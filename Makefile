setup:
	ln -sf $$PWD $$HOME/.vim

install: setup
	vim +PlugInstall +qall

update-vim-plug:
	curl -fLo autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

update-plugins:
	rm -f vimrc.lock
	vim +PlugUpdate '+PlugSnapshot vimrc.lock' +qall
	sed -i '/^PlugUpdate/d' vimrc.lock
