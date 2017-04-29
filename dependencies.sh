add-apt-repository ppa:neovim-ppa/stable
add-apt-repository ppa:daveg/i3-gaps
apt update
apt install \
	git \
	vim \
	wget \
	cmake \
	make \
	rofi \
	pavucontrol \
	emacs \
	rxvt-unicode-256color \
	compton \
	nitrogen \
	software-properties-common \
	neovim \
	zsh \
	curl \
    i3-wm \

git clone https://github.com/syl20bnr/spacemacs /tmp/.emacs.d
cp -f -R /tmp/.emacs.d ~/.emacs.d

git clone https://github.com/robbyrussell/oh-my-zsh /tmp/oh-my-zsh
cp -f -R /tmp/oh-my-zsh ~/oh-my-zsh

