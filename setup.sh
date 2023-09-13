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

# Link zsh custom files
rm -rf ~/.oh-my-zsh/custom/aliases.zsh
ln -s ${DOTFILES_DIR}/.zsh/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh

rm -rf ~/.oh-my-zsh/custom/environment.zsh
ln -s ${DOTFILES_DIR}/.zsh/environment.zsh ~/.oh-my-zsh/custom/environment.zsh

# Copy the spaceship theme into the oh-my-zsh themes directory
cp spaceship.zsh-theme $HOME/.oh-my-zsh/themes/.
