## Welcome to my dotfiles repository

### 建立配置文件的软连接：

```
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf "$DOTFILES_DIR/.conkyrc" ~
ln -sf "$DOTFILES_DIR/.dwm" ~
ln -sf "$DOTFILES_DIR/.dwm/dwm.desktop" /usr/share/xsessions
ln -sf "$DOTFILES_DIR/.gitconfig" ~
ln -sf "$DOTFILES_DIR/.gitignore" ~
ln -sf "$DOTFILES_DIR/.xprofile" ~
ln -sf "$DOTFILES_DIR/.Xresources" ~
ln -sf "$DOTFILES_DIR/.zshrc" ~

```

