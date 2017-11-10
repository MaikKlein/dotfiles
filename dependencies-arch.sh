sudo pacman -Syu
sudo pacman -S \
    git \
    vim \
    wget \
    cmake \
    make \
    rofi \
    pavucontrol \
    emacs \
    rxvt-unicode \
    tmux \
    compton \
    nitrogen \
    neovim \
    zsh \
    curl \
    i3-wm \
    steam \
    feh \
    scrot \
    gimp \
    peek \
    xclip \
    bspwm \
    powerline-fonts \
    freetype2 \
    fontconfig \
    pkg-config \

git clone https://github.com/syl20bnr/spacemacs /tmp/.emacs.d
cp -f -R /tmp/.emacs.d ~/.emacs.d

git clone https://github.com/robbyrussell/oh-my-zsh /tmp/oh-my-zsh
cp -f -R /tmp/oh-my-zsh ~/oh-my-zsh

