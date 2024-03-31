# .dot

My humble dotfiles.

This is a set of scripts to allow quick config of as many machines as possible though for now centered around Debian based and MacOS. Tried to assume as little about the system as possible and not rely on binaries that might not be available, which means most of the scripts are made to work with `dash` (rather than `bash`).

The main script is `install.sh` but everything has been chunked so that each section can be run independently. The main phases are:
- Init and create `local` and `backup` folders
- Bootstrap the system
- Install CLI tools like vim and tmux + their dotfiles
- Install more desktop or optional packages
- Set up any dev specific things per language
- Install any additional modules

Any existying configs should be moved to the `backup` folder though that may not be the case across the board  atm.

I want to keep vim and neovim mostly in line and use both. Vim for quick simple text editing, while Neovim for development, with the addition of things like LSPs and fzf dependency. Most of the core setup for Neovim is sourced from `.vimrc` and the Lua config is only for more advanced extras.

For shells, Bash can be set up with either `Bash-it` or `Oh-my-bash`, zsh with `Oh-my-zsh`. As other programs have a habit of making changes to the shell rc files, which would cause these to diverge from the git if symlinked, I am just importing the extras for each `.bashrc` and `.zshrc` as follows:
- `files/shrc` version controlled configs for all shells
- `files/bashrc` version controlled configs for just bash
- `files/zshrc` version controlled configs for just zsh
- `local/shrc` untracked configs for all shells
- `local/bashrc` untracked configs for just bash
- `local/zshrc` untracked configs for just zsh

The idea is that most things that will be used across the board will be in `files/shrc` but if there is anything specific to the machine or that shouldn't be in git, it can be added to `local/shrc`, the bash and zsh specific files are there in case anything should only be available for them.

Similar concept with `vimrc`, `nvimrc.lua` and `tmux.conf`, for each a local file being sourced respectively in case any local modifications need to be made for a particular machine.

Finally, there is a `utils` folder with a collection of scripts that I want to have available but don't want to be sourced.

## Installation

**Warning:** Be careful if trying this as it will make system changes.

### If you have git

Everything expects for this repo to exist in the HOME directory. You will need to clone it under `~/.dot`.

```bash
cd ~ && git clone https://github.com/quarenw/.dot.git && cd .dot && ./install.sh
```

If there are any updates to the config files simply pull them from git.

```bash
cd ~/.dot && git pull
```

You can always re-run the installer again as well or any individual section.

### Without git

There is a `download.sh` script which will try to download the repo tar using either `wget` or `curl`, extract it, move it to the correct location and clean up. To download that script you can refer to the `start.command` or run

```bash
wget http://raw.githubusercontent.com/quarenw/.dot/main/download.sh && \
chmod 777 download.sh && \
./download.sh && \
cd ~/.dot && \
./install.sh
```

This will require `wget` and `sudo` to be installed.
