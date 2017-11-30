#!/bin/bash
# Purpose: 
#       For migrating from a remote repo to a system already setup
#       to track dotfiles.   
# Note:
#       This script has not been tested.

# Must set the remote repo
exit 1
REMOTE=

# prevent recursion. only needed if already setup to track dotfiles
echo ".cfg" >> .gitignore

git clone --bare $REMOTE $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no