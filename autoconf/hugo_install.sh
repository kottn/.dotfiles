#!/bin/bash

# -- Check the newest release at https://github.com/gohugoio/hugo/releases

newest="v0.36/hugo_0.36_Linux-64bit.deb"
cd ~/Downloads
curl -LO https://github.com/gohugoio/hugo/releases/download/${newest}
sudo apt install ./*.deb
