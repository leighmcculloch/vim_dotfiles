install:
	ln -sf $$PWD/vim           $$HOME/.vim
	ln -sf $$PWD/vimrc         $$HOME/.vimrc
	ln -sf $$PWD/vimrc.bundles $$HOME/.vimrc.bundles
	ln -sf $$PWD/gvimrc        $$HOME/.gvimrc
	vim +PlugInstall 1 +PlugClean! +qall