#!/bin/sh
for i in ~/DotFiles/zsh-plugins.lst; do
	git clone "https://github.com/$i" /usr/share/zsh/plugins/
done

cp -ar ~/DotFiles/$(hostname)/ ~/
