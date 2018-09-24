install:
	ln -sf $$PWD $$HOME/.vim
	vim +PlugInstall +qall

update-vim-plug:
	curl -fLo autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
