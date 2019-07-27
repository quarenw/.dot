.PHONY: all updateVim

all: updateVim

updateVim:
	mv $${HOME}/.vimrc $${HOME}/.vimrc.bak
	cp $${HOME}/.quaren/.vimrc $${HOME}/.vimrc
	mv -r $${HOME}/.vim $${HOME}/.vim.bak
	cp $${HOME}/.quaren/.vim $${HOME}/.vim
