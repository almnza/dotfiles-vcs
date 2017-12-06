#!/bin/bash
# Purpose: 
#     For storing dotfiles, starting from scratch
# Note:
#     Be sure to call source on .bashrc so that the new alias takes effect

# Setup location for the dotfile repo
git init --bare $HOME/.cfg

# Set an alias to interact with the repo, prevent interactions with other git repos
cat >> $HOME/.bashrc << "EOF"

# encapsulate calls to the dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
EOF

# turn off messages about untracked files
/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
