#!/bin/bash

# Secure the server immediately
sudo chmod go-rwx /home/*
sudo chmod o-r /home/
ssh-keygen
mv ssh_config ~/.ssh/config
sudo mv sshd_config /etc/ssh/sshd_config

# Install dot-files for normal user
apt-get install zsh
git clone https://github.com/kirkelifson/dot-files
cd dot-files
./install
chsh /bin/zsh
cd ~
# Install dot-files for root
sudo bash -c "cd; git clone https://github.com/kirkelifson/dot-files; cd dot-files; ./install; chsh /bin/zsh"

# Download the necessary packages and tools
sudo mv sources.list /etc/apt/sources.list
sudo apt-get install sudo build-essential ruby python git gdb deborphan libncurses5-dev libevent-dev ssh
git clone https://github.com/kirkelifson/tools
wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-2.0/tmux-2.0.tar.gz
tar xf tmux-2.0.tar.gz
cd tmux-2.0
./configure && make && sudo make install
cd ~
