#!/bin/sh
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev  libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev libssl-dev
mkdir -p ~/src
hg clone https://vim.googlecode.com/hg/ ~/src/vim
cd ~/src/vim
./configure --enable-multibyte --enable-pythoninterp --enable-cscope --enable-xim --with-features=huge --enable-gui=gnome2
make
