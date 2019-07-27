.PHONY: all updateVim

all: updateVim

updateVim:
	mv $${HOME}/.vimrc $${HOME}/.vimrc.bak
	cp $${HOME}/.quaren/.vimrc $${HOME}/.vimrc
	mv $${HOME}/.vim $${HOME}/.vim.bak
	cp -r $${HOME}/.quaren/.vim $${HOME}/.vim
