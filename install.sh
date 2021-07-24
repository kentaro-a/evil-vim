#!/bin/sh


# curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# sh ./installer.sh ./config/.vim/dein
# rm ./installer.sh


# git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
# nerd-fonts/install.sh
# rm -fr nerd-fonts


node -v &> /dev/null
if [ $? -ne 0 ]; then
	echo "Require Node.js for Coc.vim, Get started to install Node.js latest..."
	curl -sL install-node.now.sh/lts | bash
else
	echo "nodejs is installed"
fi
