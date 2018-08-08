#!/usr/bin/env bash

#Script to setup symbolic links to all the files in /vagrant/dotfiles

echo "Copying dotfiles for $USER"

# function to backup dotfile, delete it, and then create
#  symbolic link
configDotFile() {
	local dotfile="$1"
	echo Configuring dotfile: $dotfile
	if [ -f ~/$dotFile ]
	then
	    echo Backing up $dotfile to $dotfile.bak
	    mv ~/$dotfile ~/$dotfile.bak
	fi
	sudo rm -f ~/$dotfile
	echo Creating symbolic link from /vagrant/dotfiles/$dotfile to ~/$dotfile
	ln -s /vagrant/dotfiles/$dotfile ~/$dotfile
}

# Configure each dot file in /vagrant/dotfiles
# set dotglob to show hidden files also
shopt -s dotglob
for file in /vagrant/dotfiles/*
do
    configDotFile  "$(basename $file)"
done
