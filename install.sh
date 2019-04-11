#!/bin/bash

SCRIPT_DIRECTORY=$(dirname "$(readlink -fm "$0")")

SCRIPT_FILE="${SCRIPT_DIRECTORY}/grub-reboot-windows.sh"
ICON_FILE="${SCRIPT_DIRECTORY}/windows-logo.png"
DESKTOP_FILE="${SCRIPT_DIRECTORY}/reboot-windows.desktop"

cat <<EOF >${DESKTOP_FILE}
[Desktop Entry]
Name=Reboot to Windows
Terminal=false
Type=Application
Exec=pkexec ${SCRIPT_FILE}
Icon=${ICON_FILE}
Categories=Utility
EOF
chmod +x ${DESKTOP_FILE}

echo "Successfully generated a desktop file"
echo "Move it to desktop or create a shortcout"
exit 0
