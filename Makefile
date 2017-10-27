install:
	ln -sf $$PWD/vim           $$HOME/.vim
	ln -sf $$PWD/vimrc         $$HOME/.vimrc
	ln -sf $$PWD/vimrc.bundles $$HOME/.vimrc.bundles
	vim +PlugInstall4 +qall
