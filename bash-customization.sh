# written with centOS 6.5 in mind. Not tested.

# install additional bash completion:
# Variablename completion
# Username completion
# Hostname completion
# Pathname completion
# Filename completion
# and so on, see http://www.thegeekstuff.com/2013/12/bash-completion-complete/
yum install bash-completion

# in ~/.bashrc find 'PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ' and replace into
# PS1='${debian_chroot:+($debian_chroot)}\W\$ '. It will delete annoying 
# [user@localhost] #/home/user/folder/subfolder/subsubfolder into pretty 'subsubfolder$ '
# where small \w into big \W changes option if show a full path.