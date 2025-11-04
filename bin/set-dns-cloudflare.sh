#!/usr/bin/env bash
# Bash script to connect to a network and permanently set Cloudflare DNS (1.1.1.1 / 1.0.0.1)
# for all valid wired and wireless NetworkManager connections.

set -euo pipefail

# Function: Check if connected
check_connection() {
    ACTIVE=$(nmcli -t -f STATE general status)
    if [ "$ACTIVE" == "connected" ]; then
        echo "✅ You are already connected to a network."
        return 0
    else
        echo "⚠️ No active network connection detected."
        return 1
    fi
}

# Function: List open Wi-Fi networks and prompt user to select
connect_open_wifi() {
    echo "🔎 Scanning for open Wi-Fi networks..."
    mapfile -t OPEN_NETWORKS < <(nmcli -t -f SSID,SECURITY dev wifi list | awk -F: '$2=="" {print $1}' | sort -u)

    if [ ${#OPEN_NETWORKS[@]} -eq 0 ]; then
        echo "❌ No open Wi-Fi networks found."
        exit 1
    fi

    echo ""
    echo "Available Open Networks:"
    for i in "${!OPEN_NETWORKS[@]}"; do
        printf "%d) %s\n" $((i+1)) "${OPEN_NETWORKS[$i]}"
    done

    echo ""
    read -rp "👉 Enter the number of the Wi-Fi network you want to connect to: " CHOICE
    if ! [[ "$CHOICE" =~ ^[0-9]+$ ]] || [ "$CHOICE" -lt 1 ] || [ "$CHOICE" -gt "${#OPEN_NETWORKS[@]}" ]; then
        echo "❌ Invalid choice."
        exit 1
    fi

    SSID="${OPEN_NETWORKS[$((CHOICE-1))]}"
    echo "➡️ Connecting to $SSID..."
    nmcli dev wifi connect "$SSID"
}

# Function: Assign Cloudflare DNS
assign_dns() {
    echo "🔧 Assigning Cloudflare DNS (1.1.1.1 / 1.0.0.1)..."

    # Prevent NetworkManager from overwriting DNS globally
    sudo mkdir -p /etc/NetworkManager/conf.d
    cat <<EOF | sudo tee /etc/NetworkManager/conf.d/dns.conf >/dev/null
[main]
dns=none
EOF

    # Get all active connections (Ethernet or Wi-Fi)
    mapfile -t ACTIVE_CONNS < <(nmcli -t -f NAME,DEVICE connection show --active | cut -d: -f1)

    for CON_NAME in "${ACTIVE_CONNS[@]}"; do
        echo "🔹 Configuring connection: $CON_NAME"

        nmcli connection modify "$CON_NAME" ipv4.ignore-auto-dns yes
        nmcli connection modify "$CON_NAME" ipv4.dns "1.1.1.1 1.0.0.1"
        nmcli connection modify "$CON_NAME" ipv4.method auto

        nmcli connection modify "$CON_NAME" ipv6.ignore-auto-dns yes
        nmcli connection modify "$CON_NAME" ipv6.dns "2606:4700:4700::1111 2606:4700:4700::1001"
        nmcli connection modify "$CON_NAME" ipv6.method auto
    done

    echo "🔁 Restarting NetworkManager..."
    sudo systemctl restart NetworkManager

    echo "⏳ Waiting a few seconds for connections to re-establish..."
    sleep 5
}

# Function: Show current DNS
show_dns() {
    echo ""
    echo "🔍 Current DNS servers:"
    nmcli dev show | grep DNS || echo "No DNS entries found."
}

# --- Main Flow ---
if ! check_connection; then
    connect_open_wifi
    sleep 3
fi

assign_dns
sleep 3
show_dns
#!/usr/bin/env bash
# Permanently set DNS to Cloudflare (1.1.1.1) for all valid wired and wireless NetworkManager connections
# Prompt user to connect to a network and set Cloudflare DNS
# NetworkManager is restarted first, then script waits for active connection

set -euo pipefail

# Function: Wait until a connection is active
wait_for_connection() {
  echo "⏳ Waiting for network connection..."
  until nmcli -t -f STATE general | grep -q "connected"; do
    sleep 1
  done
  echo "✅ NetworkManager reports an active connection."
}

# Function: Ask user to connect to a network if none is active
connect_to_network() {
    # Get the name of the active connection
    ACTIVE_CONN=$(nmcli -t -f NAME connection show --active | head -n 1 || true)

    if [ -n "$ACTIVE_CONN" ]; then
        echo "✅ Already connected to: $ACTIVE_CONN"
        return
    fi

    # No active connection found, exit
    echo "❌ No active connection found."
    echo "Please connect to Wi-Fi or a wired connection first."
    exit 1
}

# Function: Set Cloudflare DNS
set_dns() {
  echo ""
  echo "🔧 Setting DNS to Cloudflare (1.1.1.1 / 1.0.0.1)..."

  sudo mkdir -p /etc/NetworkManager/conf.d
  cat <<EOF | sudo tee /etc/NetworkManager/conf.d/dns.conf >/dev/null
[main]
dns=none
EOF

  # Get the currently active connection
  ACTIVE_CONN=$(nmcli -t -f NAME connection show --active | head -n 1)

  if [ -z "$ACTIVE_CONN" ]; then
    echo "❌ No active connection found. Cannot set DNS."
    exit 1
  fi

  echo "🔹 Applying Cloudflare DNS to: $ACTIVE_CONN"
  nmcli connection modify "$ACTIVE_CONN" ipv4.ignore-auto-dns yes
  nmcli connection modify "$ACTIVE_CONN" ipv4.dns "1.1.1.1 1.0.0.1"
  nmcli connection modify "$ACTIVE_CONN" ipv4.method auto

  nmcli connection modify "$ACTIVE_CONN" ipv6.ignore-auto-dns yes
  nmcli connection modify "$ACTIVE_CONN" ipv6.dns "2606:4700:4700::1111 2606:4700:4700::1001"
  nmcli connection modify "$ACTIVE_CONN" ipv6.method auto

  # Reconnect to apply DNS
  nmcli connection down "$ACTIVE_CONN" >/dev/null 2>&1 || true
  nmcli connection up "$ACTIVE_CONN" >/dev/null 2>&1 || true

  # Wait a few seconds to ensure DNS is active
  sleep 3

  echo "✅ DNS set successfully."
  echo ""
  echo "🔍 Current DNS servers:"
  nmcli dev show | grep DNS
}

# --- Main Script Flow ---

echo "🔁 Restarting NetworkManager..."
sudo systemctl restart NetworkManager

# Wait until NetworkManager is running
sleep 2
wait_for_connection

connect_to_network
set_dns
