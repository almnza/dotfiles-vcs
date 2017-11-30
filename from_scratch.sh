#!/bin/bash
# Purpose: 
#     For storing dotfiles, starting from scratch
# Note:
#     This script has not been tested

# Setup location for the dotfile repo
git init --bare $HOME/.cfg

# Set an alias to interact with the repo, prevent interactions with other git repos
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc

# turn off messages about untracked files
config config --local status.showUntrackedFiles no