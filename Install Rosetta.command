#!/bin/bash

clear
echo "=================================="
echo "       Rosetta 2 Installer"
echo "=================================="
echo

if [ "$(uname -m)" != "arm64" ]; then
    echo "This Mac is not Apple Silicon (M1/M2/M3/M4 or newer)."
    echo "Rosetta 2 installation is not needed or supported here."
    read -r -p "Press Return to close..."
    exit 1
fi

if /usr/bin/pgrep oahd >/dev/null 2>&1; then
    echo "Rosetta 2 appears to be running already."
fi

echo "Starting official Apple Rosetta 2 installation..."
sudo /usr/sbin/softwareupdate --install-rosetta --agree-to-license

status=$?
echo
if [ "$status" -eq 0 ]; then
    echo "Rosetta 2 installation completed successfully."
else
    echo "Installation failed. Check your internet connection and try again."
fi

echo
read -r -p "Press Return to close this window..."
exit "$status"
