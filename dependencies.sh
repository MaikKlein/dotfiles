sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:daveg/i3-gaps
sudo apt update
sudo apt install \
    git \
    vim \
    wget \
    cmake \
    make \
    rofi \
    pavucontrol \
    emacs \
    rxvt-unicode-256color \
    tmux \
    compton \
    nitrogen \
    software-properties-common \
    neovim \
    zsh \
    curl \
    i3-wm \
    steam \
    feh \

git clone https://github.com/syl20bnr/spacemacs /tmp/.emacs.d
cp -f -R /tmp/.emacs.d ~/.emacs.d

git clone https://github.com/robbyrussell/oh-my-zsh /tmp/oh-my-zsh
cp -f -R /tmp/oh-my-zsh ~/oh-my-zsh

