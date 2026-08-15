# Dotfiles

My Dotfiles from my `$HOME` 🏠

# Packages

```
xargs sudo apt -y install < ~/Dotfiles/packages
```

# Font

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

# UFW (Firewall)

```
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
```

# Other Tools

* [IntelliJ](https://www.jetbrains.com/idea/download/?section=linux)
* [Anki](https://apps.ankiweb.net/)
* [Tutanota](https://tuta.com/de#download)
