#!/bin/sh

brew install zsh zsh-completions tmux neovim python3 ag reattach-to-user-namespace archey
brew cask
brew cask install iterm2

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install neovim

brew tap homebrew/cask-fonts
brew cask install font-fira-code

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.2
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

chsh -s $(which zsh)

rm -rf ~/.asdfrc ~/.default-gems ~/.default-npm-packages ~/.gemrc \
    ~/.gitconfig ~/.gitignore_global ~/.irbrc ~/.pryrc ~/.rspec \
    ~/.tool-versions ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf \
    ~/.config/nvim 2> /dev/null

mkdir -p ~/.config ~/.config/nvim

ln -s ~/.dotfiles/asdfrc ~/.asdfrc
ln -s ~/.dotfiles/default-gems ~/.default-gems
ln -s ~/.dotfiles/default-npm-packages ~/.default-npm-packages
ln -s ~/.dotfiles/gemrc ~/.gemrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/irbrc ~/.irbrc
ln -s ~/.dotfiles/pryrc ~/.pryrc
ln -s ~/.dotfiles/rspec ~/.rspec
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/tool-versions ~/.tool-versions
ln -s ~/.dotfiles/vimrc ~/.config/nvim/init.vim

asdf install