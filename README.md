# grub-reboot-windows

These scripts are meant to be used from Linux to set the next selected entry to be the one with Windows.

It requires the commands `pkexec`, `grub-editenv` and `awk` for the scripts to work.

By default it assumes the grub directory is in `/boot/grub`, you might want to modify that in the file `grub-setnext.sh`

## Installing

- Ensure you have all the required commands available
- Clone the repository somewhere under your user directory
  - Run in a terminal `git clone https://github.com/jamezrin/grub-reboot-windows`
- Execute the install script
  - Run in a terminal `./install.sh`
- After that, make a shortcut of the `reboot-windows.desktop` file to the desktop
- You are done, now if you double click that file it should ask for your user password and reboot
