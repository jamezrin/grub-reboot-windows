#!/bin/bash

SCRIPT_DIRECTORY=$(dirname "$(readlink -fm "$0")")
NEXT_ENTRY_SCRIPT="${SCRIPT_DIRECTORY}/grub-setnext.sh"
NEXT_ENTRY="Windows"

if /bin/bash ${NEXT_ENTRY_SCRIPT} ${NEXT_ENTRY}; then
    echo "Rebooting now..."
    reboot
fi
