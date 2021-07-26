#!/bin/sh



curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ./config/.vim/dein
rm ./installer.sh


if ! command -v rg &> /dev/null
then
	echo "[Error] ripgrep command is not found"
	echo "# CentOS:7"
	echo "$ yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo"
	echo "$ yum install ripgrep"
	echo ""
	echo "# Mac"
	echo "brew install ripgrep"
fi

cp config/.rgignore ~/

echo ""
echo "[Note] Require Node.js if you use Coc.vim Node.js lsp"
echo "-----------"
echo "# Node.js Latest"
echo "$ curl -sL install-node.now.sh/lts | bash"
echo "-----------"
echo ""
echo ""
echo "[Note] Require Go and gopls if you use Coc.vim golang lsp"
echo "-----------"
echo "# Go"
echo "$ wget https://golang.org/dl/go1.16.6.linux-amd64.tar.gz"
echo "$ tar xzf go1.16.6.linux-amd64.tar.gz -C ~"
echo "$ export GOROOT=$HOME/go"
echo "$ export GOPATH=$HOME/Documents/go"
echo "$ export PATH=$PATH:$GOROOT/bin:$GOPATH/bin"
echo ""
echo "# gopls"
echo "$ go get golang.org/x/tools/gopls@latest"
echo "-----------"
echo ""
echo ""
echo "Copy config/coc-settings.json to :CocConfig"
echo ""
