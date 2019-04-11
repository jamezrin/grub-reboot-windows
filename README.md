# grub-reboot-windows

These scripts are meant to be used from Linux to set the next selected entry to be the one with Windows.

It requires the commands `pkexec`, `grub-editenv` and `awk` for the scripts to work.

By default it assumes the grub directory is in `/boot/grub`, you might want to modify that in the file `grub-setnext.sh`

## Installing

- Clone the repository wherever you want with `git clone https://github.com/jamezrin/grub-reboot-windows`
- Fix the paths to the repository files in `reboot-windows.desktop`
- After that, make a shortcut of the `reboot-windows.desktop` file to the desktop and you are done
