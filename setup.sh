#!/bin/sh
sudo mkdir -p /usr/share/zsh/plugins
sudo chown $USER /usr/share/zsh/plugins 

while read plugin; do
	git clone https://github.com/$plugin.git /usr/share/zsh/plugins/$plugin
done < ~/DotFiles/zsh-plugins.lst

