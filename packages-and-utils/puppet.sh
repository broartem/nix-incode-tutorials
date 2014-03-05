# Set up puppet server (for learning purposes) using docker, which will be available
# from everywhere.
_DOCKERPATH=/docker # folder with docker boxes
mkdir "$_DOCKERPATH"/puppetmaster
cd "$_DOCKERPATH"/puppetmaster

# clonning docker-puppetmaster repository
git clone https://github.com/daniellawrence/docker-puppetmaster.git ./

# the following is from official doc on github page
# https://github.com/daniellawrence/docker-puppetmaster

# downloading your puppet repo with all the nodes configuration
_PUPPET_REPO="your-puppet-repo/modules-and-manifests.git" # 
git clone "$_PUPPET_REPO" puppet

# automatic set up puppet box (you can do it manually). See script itself to understand
# what it is doing
./up

# restart puppet to accept keys
# puppet agent -t