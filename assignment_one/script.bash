#!/bin/bash

# Change directory to the tests directory using absolute pathname
cd /home/altschool/tests

# Change directory to the tests directory using relative pathname
cd tests

# Use echo to create and add text content to fileA in misc directory
echo 'Hello A' >> misc/fileA

# Create empty fileB in misc directory and populate with dummy content afterwards
touch misc/fileB && echo 'dummy content' >> misc/fileB

# Copy contents of fileA into fileC
cp misc/fileA fileC

# Move contents of fileB into fileD
cp misc/fileB fileD

# Create tar archive of misc directory
tar -cf misc.tar misc

# Compress the tar archive
tar -czvf misc.tar.gz misc.tar

# Create user and force password change on login
sudo useradd --expiredate 0 student

# Lock a user's password
sudo passwd -l student

# Create a user with no login shell
sudo useradd -s /sbin/nologin student

# Disable password based authentication for ssh

# Disable root login for ssh
sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/ssh_config
