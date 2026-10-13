# Debian Gnome Dotfiles

> [!NOTE]
> Setup installed with [Debian Netinstaller](https://www.debian.org/CD/netinst/)

# Installation

> [!NOTE]
> Login as root

```
apt install sudo git
```
```
usermod -aG sudo <USERNAME>
```
```
reboot
```

> [!NOTE]
> Login as user

```
git clone <REPOSITORY>
```
```
sed 's/#.*//' packages | xargs -r sudo apt install -y
```
```
mkdir ~/.config
find ~/<DOTFILES_FOLDER>/ -mindepth 1 -maxdepth 1 -not -name '.*' -type d | xargs -I '{}' cp -r '{}' ~/.config/
cp ~/Dotfiles-Gnome/.zshrc ~/
```
```
chsh -s $(which zsh)
```
```
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
```

> [!NOTE]
> Write into /etc/default/grub

```
GRUB_TIMEOUT=0
GRUB_CMDLINE_LINUX_DEFAULT="quit splash loglevel=3"
```
```
sudo update-grub2
```
```
sudo reboot
```
