#!/bin/bash

DOTFILES_DIR=$(dirname "$(readlink -f "$0")")

# Link the directories you want (including those that start with dot)
rm -rf ~/bin
ln -s ${DOTFILES_DIR}/bin ~/bin

# Link all the files that start with a dot
FILES=$(find -maxdepth 1 -type f -name ".*")
for file in $FILES; do
    name=$(basename ${file})
    rm -rf ~/${name}
    ln -s ${DOTFILES_DIR}/${name} ~/${name}
done

echo "Installing fonts."
FONT_DIR="$HOME/.fonts"
git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
cd $FONT_DIR
./install.sh

# Link zsh custom files
rm -rf ~/.oh-my-zsh/custom/aliases.zsh
ln -s ${DOTFILES_DIR}/.zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

rm -rf ~/.oh-my-zsh/custom/environment.zsh
ln -s ${DOTFILES_DIR}/.zsh/environment.zsh ~/.oh-my-zsh/custom/environment.zsh

echo "Setting up the Spaceship theme."
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo "Applying changes to .zshrc"
omz reload

echo "Reload the .zshrc file"
exec zsh
