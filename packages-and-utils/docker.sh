# Build box form Dockerfile
sudo docker build -t username/boxname /path/to/folder/with/Dockerfile

# Run the box from image (we can run boxes from images only, not from another box)
sudo docker run --name someboxname -d username/boxname

# get box id form the output of a file
sudo docker ps | head -n 5

# Commit the box to make new image (now we can run command from this image)
sudo docker commit boxid username/boxname

# Start interactive terminal session command
sudo docker run -i -t someboxname /bin/bash