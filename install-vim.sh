#!/bin/sh
dir=$HOME/usr/bin; [ ! -e $dir ] && mkdir -p $dir
if [ -e $dir/vim ]; then
	echo "Already Exist vim in ${dir}/usr/bin"
else
	echo "Install vim in ${dir}"
	echo 'export PATH=$HOME/usr/bin:$PATH' >> ~/.bashrc
	cd /tmp/
	git clone https://github.com/vim/vim.git
	cd /tmp/vim
	./configure --prefix=$HOME/usr
	make
	make install
fi

echo "You should execute"
echo "$ source ~/.bashrc"
