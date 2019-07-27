.PHONY: all updateVim

all: updateVim

updateVim:
	mv ~/.vimrc ~/.quaren/.vimrc.bak
	cp ~/.quaren/.vimrc ~/.vimrc
