ln -s -f "$(pwd)/zsh/.zshrc" ~/.zshrc
ln -s -f "$(pwd)/zsh/.zshenv" ~/.zshenv
ln -s -f "$(pwd)/spacemacs/.spacemacs" ~/.spacemacs
mkdir -p ~/.config/nvim
ln -s -f "$(pwd)/nvim/.config/nvim/init.vim" ~/.config/nvim/init.vim
ln -s -f "$(pwd)/nvim/.config/nvim/coc-settings.json" ~/.config/nvim/coc-settings.json
ln -s -f "$(pwd)/tmux/.tmux.conf" ~/.tmux.conf
mkdir -p ~/.config/tmux
ln -s -f "$(pwd)/tmux/solarized.theme" ~/.config/tmux/solarized.theme
ln -s -f "$(pwd)/vim/.vimrc" ~/.vimrc
mkdir -p ~/.i3
ln -s -f "$(pwd)/i3/.i3/config" ~/.i3/config
ln -s -f "$(pwd)/X/.Xresources" ~/.Xresources
ln -s -f "$(pwd)/X/.xinitrc" ~/.xinitrc

mkdir -p ~/.config/bspwm
ln -s -f "$(pwd)/bspwm/.config/bspwm/bspwmrc" ~/.config/bspwm/bspwmrc
mkdir -p ~/.config/sxhkd
ln -s -f "$(pwd)/bspwm/.config/sxhkd/sxhkdrc" ~/.config/sxhkd/sxhkdrc
ln -s -f "$(pwd)/compton/compton.conf" ~/compton.conf

mkdir -p ~/.config/polybar
ln -s -f "$(pwd)/polybar/.config/polybar/config" ~/.config/polybar/config
cp -rsf "$(pwd)/.IntelliJIdea2017.2" ~/.IntelliJIdea2017.2
ln -s -f "$(pwd)/ideavimrc/.ideavimrc" ~/.ideavimrc

mkdir -p ~/.config/fish
ln -s -f "$(pwd)/fish/.config/fish/config.fish" ~/.config/fish/config.fish
ln -s -f "$(pwd)/fish/.config/fish/fishfile" ~/.config/fish/fishfile
ln -s -f "$(pwd)/fish/.config/fish/functions" ~/.config/fish/functions

mkdir -p ~/.config/kitty
ln -s -f "$(pwd)/kitty/.config/kitty/kitty.conf" ~/.config/kitty/kitty.conf

ln -s -f -d "$(pwd)/awesome" ~/.config

ln -s -f -d "$(pwd)/blender" ~/.config

ln -s -f -d "$(pwd)/nvim" ~/.config/nvim

ln -s -f "$(pwd)/mouse/gpro.conf" /etc/X11/xorg.conf.d/gpro.conf

