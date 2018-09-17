install:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -sf $$PWD/vimrc $$HOME/.vimrc
	vim +PlugInstall +qall
	vim +GoInstallBinaries +qall
