# Change all shell scripts to executable
.PHONY: exec_scripts
exec_scripts:
	find . -name "*.sh" -type f | xargs -I % sh -c 'chmod +x %'

# Print out all PPAs for a Debian system
.PHONY: list_ppas
list_ppas:
	grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*
