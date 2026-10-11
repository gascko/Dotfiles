# Debian Gnome Dotfiles

> [!NOTE]
> Setup installed with [Debian Netinstaller](https://www.debian.org/CD/netinst/)

## Sudo

> [!NOTE]
> Login as root

```
apt install sudo
```
```
usermod -aG sudo <USERNAME>
```
```
reboot
```
## Dotfiles

> [!NOTE]
> Login as user

```
git clone <REPOSITORY>
```

```
cp -a *~/Dotfiles/ ~/.config/
```

## Packages

```
sed 's/#.*//' packages | xargs -r sudo apt install -y
```

## Zsh

```
chsh -s $(which zsh)
```

## Font

```
mkdir -p ~/.fonts
```

> [!NOTE]
> Check latest [Nerdfont Version](https://github.com/ryanoasis/nerd-fonts/releases)

```
wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/releases/download/<VERSION>/JetBrainsMono.zip
```

```
unzip ~/.fonts/*.zip
```

```
fc-cache
```

## Firewall

```
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
```

## Grub

```
GRUB_TIMEOUT=0
GRUB_CMDLINE_LINUX_DEFAULT="quit splash loglevel=3"
```

> /etc/default/grub

```
sudo update-grub2
```

## Helix

> [!NOTE]
> Check latest [Helix Version](https://github.com/helix-editor/helix/releases)

```
wget https://github.com/helix-editor/helix/releases/download/<VERSION>/helix_<VERSION>_amd64.deb
```

```
cargo install uwu_colors
```
