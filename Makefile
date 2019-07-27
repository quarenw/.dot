.PHONY: all updateVim

all: updateVim

updateVim:
	mv ~/.vimrc ~/.vimrc.bak
	cp ~/.quaren/.vimrc ~/.vimrc
	mv -r ~/.vim ~/.vim.bak
	cp ~/.quaren/.vim ~/.vim

