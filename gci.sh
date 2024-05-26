#!/bin/bash
#
# gci.sh
#
# little script for openSUSE to install or upgrade Google Chome 
# to the latest version when the built-in process does not work. 
#

# some variables
chrome_url=https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
chrome_file=/var/tmp/google-chrome-stable_current_x86_64.rpm

# shameless self-promotion
cat<<BANNER

Google Chrome Installer / Upgrader

by martinm@rsysadmin.com
==================================

BANNER

# user permissions
if [ $USER != "root" ]
then
	echo -e "ERROR - please, run this script as root\n"
	exit 1
fi

# download latest RPM to temporary location
echo "-> Silently downloading the latest stable Google Chrome..."
wget -nc -qc $chrome_url -O $chrome_file

# check if Google Chrome was already installed
echo "-> Checking if a previous version of Google Chrome is installed..."
rpm -qa | grep google-chrome-stable > /dev/null
if [ $? -eq 0 ]
then
	echo "--> Found older instance of Google Chrome."
	echo "--> It will be removed and the latest stable will be installed."
	zypper -n remove google-chrome-stable 
else
	echo "--> No previous version of Google Chrome found."
	echo "--> I will install the latest stable from scratch."
fi

# perform the installation
zypper --gpg-auto-import-keys -n install $chrome_file 

# remove temporary installer file
echo -e "\n-> Cleaning up..."
rm -f $chrome_file

# the end
echo -e "\n-> All set.\n"

