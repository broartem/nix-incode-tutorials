# mount remote folder over ssh
mkdir mount_point
sshfs user@host:/path/to/folder ./mount_point -o workaround=rename,idmap=user