# Debian Gnome Dotfiles

> [!NOTE]
> Setup installed with [Debian Netinstaller](https://www.debian.org/CD/netinst/)

## Sudo and Git

> [!NOTE]
> Login as root

```
apt install sudo git
```
```
usermod -aG sudo konrad
```
```
reboot
```

## Packages

```
sed 's/#.*//' packages | xargs -r sudo apt install -y
```

## Zsh

```
chsh -s $(which zsh)
```

## Dotfiles

```
cp -a *~/Dotfiles/ ~/.config/
```


## Font

```
mkdir -p ~/.fonts
```

```
wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.0/JetBrainsMono.zip
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


## Tools

* [IntelliJ](https://www.jetbrains.com/idea/download/?section=linux)
* [Anki](https://apps.ankiweb.net/)
* [Tutanota](https://tuta.com/de#download)
* [Spotify](https://www.spotify.com/us/download/linux/)
