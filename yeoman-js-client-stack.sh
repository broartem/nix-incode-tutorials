# Tested on CentOS / OSX. Current version of yeoman is 1.
# It is sopposed, that node and npm alredy installed.

# install 
npm install -g yo

# sample webapp generator (bootstrap, SASS and so on)
npm install -g generator-webapp

# But things are not so easy. You need compass for CSS compiling. Unfortunately, compass is
# a ruby util.
gem update --system && gem install compass
npm install grunt-contrib-compass --save-dev

# Ruby gems are like npm gloval packages. Bat after installation they are unavailable
# from console. It is neccessary to add gems executables directory into the PATH.
# So, type the following command
gem environment | grep 'EXECUTABLE DIRECTORY'
# , and add to $PATH variable printed directory, e.g if command returned:
# '/usr/local/Cellar/ruby/2.1.0/bin', let PATH be $PATH:/usr/local/Cellar/ruby/2.1.0/bin

# But not all the problems solved. For me, ruby installed compass v0.12.2 and sass
# v3.3.0.rc.4, and they are incompartible. The solution:
gem uninstall sass --version 3.3.0.rc.4
gem install sass --version 3.2.13
compass -v # no more huge error as it used to be!