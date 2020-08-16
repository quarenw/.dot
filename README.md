# dotfile
My dotfiles

### Powershell ssh-copy-id equivalent commands:
`cat ~/.ssh/id_rsa.pub | ssh user@123.45.67.89 "cat >> ~/.ssh/authorized_keys"`

if no `.ssh` directory
`cat ~/.ssh/id_rsa.pub | ssh user@123.45.56.78 "mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys"`
