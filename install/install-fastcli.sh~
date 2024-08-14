#!/bin/bash

if npm list -g fast-cli > /dev/null 2>&1; then
    read -p "fast-cli is already installed. Do you want to update it? (Y/n): " choice
    choice=${choice:-Y}
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        echo "Updating fast-cli..."
        npm update -g fast-cli
    else
        echo "Skipping update."
    fi
else
    echo "fast-cli is not installed. Installing..."
    npm install -g fast-cli
fi
