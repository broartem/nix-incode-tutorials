git push --mirror https://github.com/exampleuser/new-repository.git

# Change remote repository
git remote rename origin old
git remote add origin https://github.com/cyberplane2012/informational_system.git
git remote rm old

# Create a repository for collaborative work
# based on question: http://stackoverflow.com/questions/3242282/how-to-configure-an-existing-git-repo-to-be-shared-by-a-unix-group
git init --bare --shared=group repodir
chgrp -R foo repodir

# make existing repository collaborative
git config core.sharedRepository group
chgrp -R foo repodir                # set the group
chmod -R g+rw repodir               # allow the group to read/write
chmod g+s `find repodir -type d`    # new files get group id of directory