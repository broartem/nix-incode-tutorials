useradd ivan
passwd ivan
mkdir /home/ivan
sudo chown ivan:ivan /home/ivan

# add to sudoers, ubuntu:
sudo useradd ivan sudo
# fedora/centos
# enter visudo command, It will open vim with /etc/sudoers file
# find string "root     ALL=(ALL)      ALL"
# and add string "user1     ALL=(ALL)      ALL" after it

# set up .bashrc
cp /etc/skel/.bashrc ~/
sudo chmod 644 ~/.bashrc

# maybe neccessary or not, see http://askubuntu.com/questions/163802/backspace-tab-del-and-arrow-keys-not-working-in-terminal-using-ssh/208275
chsh -s /bin/bash 

# highly colored .bashrc, can be googled as The Ultimate bashrc
cd ~
wget http://gnome-look.org/CONTENT/content-files/129746-bashrc.tar.gz
tar xvzf 129746-bashrc.tar.gz
# Apply new bashrc file
source ./.bashrc

# Create ssh key pair (OSX, Linux) for user user1 for loging in remote server 
# Genetare keypair and save to ~/.ssh folder
ssh-keygen -t rsa -f ~/.ssh/key_for_my_host

# If password-powered authentication is allowed by remote server, it is easier to
# use ssh-copy-id util. For osx this util can be taken from repository
# https://github.com/beautifulcode/ssh-copy-id-for-OSX
# ssh-copy-id [-i [identity_file]] [user@]machine

# else, copy key from another account, and add it to authoruzed_keys file
scp ~/.ssh/key_for_my_host.pub somerootuser@host:/home/user1/.ssh/key_for_my_host.pub
# and then enter on remote server and enter:
#cat /home/user1/.ssh/key_for_my_host.pub > /home/user1/.ssh/authoruzed_keys

# on OSX it is possible to copy key into clipboard by typing:
# pbcopy < ~/.ssh/key_for_my_host.pub


