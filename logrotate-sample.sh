#!/bin/bash

# written for centOS 6.5 in mind. Not tested yet
# For more info, see: http://www.thegeekstuff.com/2010/07/logrotate-examples/

# logrotate  is  designed to ease administration of systems that generate
# large numbers of log files.  It allows automatic rotation, compression,
# removal, and mailing of log files.  Each log file may be handled daily,
# weekly, monthly, or when it grows too large.

# Suppose, we are writing a daemon my_service, performing some job and writing logs.
# Lets add a rotation for these logs.

# path to logrotate config file for my_service
cnfpath = "/etc/logrotate.d/my_service"

# path to my_service log file
echo "/home/username/.my_service/logs/my_service.log {" >> $cnfpath

# limits the number of log file rotation. So, this would keep only the recent 4
# rotated log files, the rest files will be deleted.
echo "rotate 7" >> $cnfpath

# weekly, monthly also available
echo "daily" >> $cnfpath

# Dont return error if the log file is missing
echo "missingok" >> $cnfpath

# Do not rotate the log if it is empty
echo "notifempty" >> $cnfpath

# compress with gzip the old log file
echo "compress" >> $cnfpath

# Rule to create new log file. Commented, because my_service must reopen file handler.
# So it is easier to allow my_service create new file if SIGHUP recieved and log file
# does not exists.
echo "# create 0644 vagrant vagrant" >> $cnfpath

# starting own script after rotation is done. Usually used to send some signal to my_service
# about that event
echo "postrotate" >> $cnfpath

# check if my_service.pid file exists and send SIGHUP to my_service process
echo "[ -f /home/username/.my_service/my_service.pid ] && kill -HUP \
    `cat /home/username/.my_service/my_service.pid`" >> $cnfpath

# end of script
echo "endscript" >> $cnfpath
echo "}" >> $cnfpath

# After the script above config file $cnfpath will be the following:
# /home/username/.my_service/logs/my_service.log {
#    rotate 7
#    daily
#    missingok
#    notifempty
#    compress
#    # create 0644 vagrant vagrant
#    postrotate
#        [ -f /home/username/.my_service/my_service.pid ] && \
#        kill -HUP `cat /home/username/.my_service/my_service.pid`
#    endscript
# }

# Tells logrotate to force the rotation, even if it doesn’t think this is necessary.
# Just to ckeck it works
logrotate --force $cnfpath