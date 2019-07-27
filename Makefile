.PHONY: all updateVim

all: updateVim

updateVim:
	[ -f $${HOME}/.vimrc ] && mv $${HOME}/.vimrc $${HOME}/.vimrc.bak
	cp $${HOME}/.quaren/.vimrc $${HOME}/.vimrc
	[ -d $${HOME}/.vim ] && mv $${HOME}/.vim $${HOME}/.vim.bak
	cp -r $${HOME}/.quaren/.vim $${HOME}/.vim
