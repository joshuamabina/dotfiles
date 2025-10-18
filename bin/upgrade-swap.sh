#!/bin/bash

# WARNING: This will remove your current swap and create a new 128GB swap file.
# Run as root or with sudo.

SWAPFILE="/swapfile"
SWAPSIZE="128G"

echo "Turning off current swap..."
sudo swapoff -a

echo "Removing old swap file if it exists..."
sudo rm -f $SWAPFILE

echo "Creating new swap file of size $SWAPSIZE..."
if fallocate -l $SWAPSIZE $SWAPFILE 2>/dev/null; then
  echo "Swap file allocated with fallocate."
else
  echo "fallocate failed, using dd (this may take a while)..."
  sudo dd if=/dev/zero of=$SWAPFILE bs=1G count=128 status=progress
  fi

  echo "Setting swap file permissions..."
  sudo chmod 600 $SWAPFILE

  echo "Formatting swap file..."
  sudo mkswap $SWAPFILE

  echo "Enabling swap..."
  sudo swapon $SWAPFILE

  echo "Backing up /etc/fstab..."
  sudo cp /etc/fstab /etc/fstab.bak

  echo "Updating /etc/fstab..."
  if grep -q "$SWAPFILE" /etc/fstab; then
    echo "/swapfile already in fstab."
  else
    echo "$SWAPFILE none swap sw 0 0" | sudo tee -a /etc/fstab
  fi

  echo "Swap setup complete!"
  swapon --show
  free -h

