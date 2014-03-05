# based mostly on tutorial `http://www.cyberciti.biz/faq/linux-generating-rsa-keys/`
_HOST=myhost # shortcut for remote host name
ssh-keygen -t rsa -f ~/.ssh/"$_HOST"

# on OSX there is no ssh-copy-id utility, so you can use the one from github:
# https://github.com/beautifulcode/ssh-copy-id-for-OSX
_USERNAME=user
_HOSTNAME=server.com # remote host IP/URL
# ssh-copy-id -i ~/.ssh/"$_HOST"_rsa.pub "$_USERNAME"@"$_HOSTNAME"

# lets write server config to ~/.ssh/config to have access to it by shortcut
cnfile=~/.ssh/config # path to user local ssh config file
echo ""                                             >> $cnfile;
echo "Host $_HOST"                                  >> $cnfile;
echo "Hostname $_HOSTNAME"                          >> $cnfile;
echo "Port 22"                                      >> $cnfile;
echo "User $_USERNAME"                              >> $cnfile;
echo "IdentityFile ~/.ssh/""$_HOST""_rsa"           >> $cnfile;