#!/bin/sh
pacman -Qq > ~/.config/arch/pacman-Qq.txt
pacman -Qqe > ~/.config/arch/pacman-Qqe.txt
pacman -Qqm > ~/.config/arch/pacman-Qqm.txt
systemctl list-unit-files --state=enabled > ~/.config/arch/systemctl-enabled.txt
systemctl list-unit-files > ~/.config/arch/systemctl.txt

cp --parents -r \
/etc/fstab \
/etc/pacman.conf \
/etc/X11/xorg.conf.d/ \
/etc/default/grub \
/etc/environment \
/etc/hostname \
/etc/locale.conf \
/etc/locale.gen \
/etc/xdg/reflector/reflector.conf \
.