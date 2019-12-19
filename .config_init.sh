#!/bin/sh

cd ~

sudo apt install zsh trash-cli

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pip3 install virtualenvwrapper pipenv

# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm .zshrc
cp .zshrc.pre-oh-my-zsh .zshrc

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# fzf. Ctrl-T to search
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# To install black vim plugin properly
mkdir -p ~/.local/share/virtualenvs
cd ~/.local/share/virtualenvs
python3 -m venv black
sudo python3 -m pip install black

# Ctags for tagbar
sudo apt install universal-ctags

# Pyenv
curl https://pyenv.run | bash

echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bash_aliases

cd ~/Downloads
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
cd nord-gnome-terminal/src
./nord.sh

