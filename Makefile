.PHONY: all updateVim updateTmux

all: updateVim updateTmux

updateVim:
	[ -f $${HOME}/.vimrc ] && mv $${HOME}/.vimrc $${HOME}/.vimrc.bak
	cp $${HOME}/.quaren/vimrc $${HOME}/.vimrc
	[ -d $${HOME}/.vim ] && mv $${HOME}/.vim $${HOME}/.vim.bak
	cp -r $${HOME}/.quaren/vim $${HOME}/.vim

updateTmux:
	[ 0f $${HOME}/.tmux.conf ] && mv $${HOME}/.tmux.conf $${HOME}/.tmux.conf.bak
	cp $${HOME}/.quaren/tmux.conf $${HOME}/.tmux.conf

