#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "This script has to be ran by root"
  exit 1
fi

GRUB_ROOT=/boot/grub
GRUB_CFG_PATH=${GRUB_ROOT}/grub.cfg
GRUB_ENV_PATH=${GRUB_ROOT}/grubenv

MENU_ENTRIES="$(awk -F\' '/menuentry / {print $2}' ${GRUB_CFG_PATH})"

if [ -z "$1" ]; then
  echo "You need to specify a part of the menu entry to set next"
  echo "For example, if in grub you have \"Windows Boot Manager\" you can just use \"Windows\" to select it"
  echo "It will match the first menu entry found that contains your input"
  echo
  echo "List of possible menu entries:"
  while IFS= read -r entry; do
    echo "  \"${entry}\""
  done <<<"${MENU_ENTRIES}"
  exit 1
fi

while IFS= read -r entry; do
  if [[ $entry == *"$1"* ]]; then
    echo "Setting next entry to \"${entry}\""
    if grub-editenv ${GRUB_ENV_PATH} set next_entry="${entry}"; then
      echo "Successfully set next menu entry"
    else
      echo "Could not execute grub-editenv"
    fi
    exit 0
  fi
done <<<"${MENU_ENTRIES}"

echo "Could not match your input with any menu entry"
echo "At least a grub menu entry has to contain your input"
exit 1
