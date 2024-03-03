.PHONY: exec_scripts

exec_scripts:
	find . -name "*.sh" -type f | xargs -I % sh -c 'chmod +x %'

list_ppas:
	grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*
