# Installation fedora 20 packages for gui, which are not so easy to install.

################
# Sublime text 3
wget https://gist.githubusercontent.com/xtranophilist/5932634/raw/3f3514e2f5a1c51ccdbf00b63e4a6aaf82aaa101/sublime-text-3.sh | sh

################
# vlc and codecs

# Add free and nonfree(binary) repositories rpmfusion. More packages
rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
yum update # else the following command will return an error
rpm -Uhv http://download1.rpmfusion.org/nonfree/fedora/releases/20/Everything/x86_64/os/rpmfusion-nonfree-release-20-1.noarch.rpm

# install vlc
yum update
yum install -y vlc

###############
# git. No problems at all, unlike centos
yum install -y git

##############
# youtube-dl - useful utility to work with youtube and download from there.
yum install -y youtube-dl

##############
# lm_sensors - utility to monitor cpu frequency and temperature
yum install -y lm_sensors
# type `sensors` to run utility

##############
# cpupower - powerful utility to manage cpu frequency
yum install -y cpupower
# cpupower frequency-set --min 1000MHz --max 3000MHz


##############
# fonts
yum install -y *bitstream*
# Nice article on how to improve font rendering engine in fedora, because fonts are awful
http://worldofgnome.org/how-to-greatly-improve-font-rendering-under-fedora-20/

##############
# set time zone (overwrite /etc/localtime file)
cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime

##############
# enable bluetooth module on system load
rulefile="/etc/udev/rules.d/00-local.rules"
echo "# Set bluetooth power up" >> rulefile
echo "ACTION==\"add\", KERNEL==\"hci0\", RUN+=\"/usr/bin/hciconfig hci0 up\"" >> rulefile
# run bluetooth now
/usr/bin/hciconfig hci0 up
# TODO: article on how to work with bluetoothctl utility