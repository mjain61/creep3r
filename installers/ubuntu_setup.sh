#!/usr/bin/env bash
#
# Creep3r Setup Script
#
# sudo ./setup.sh
# Run with sudo or with root privs
# Installs all Creep3r dependencies for OS & Ruby
#
# This is the Ubuntu installer...
#
# Need to check against Ubuntu 10.04 and older Debian based systems....
#

echo "Running Ubuntu Installer....." | grep --color 'Running Ubuntu Installer'
echo "Installing OS packages...." | grep --color 'Installing OS packages'
apt-get -y install curl libcurl3 libcurl4-openssl-dev mysql-client libmysqlclient18 libmysqlclient-dev bundler ruby-dev nmap freetds-common freetds-bin freetds-dev libpq-dev

echo "Installing MongoDB...." | grep --color 'Installing MongoDB'
# Add Keys for security
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

# Add entry to repos
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list.d/10gen.list

# Update and pull in new repos
apt-get -y update

# Install MongoDB from new repo
apt-get -y install mongodb-10gen

echo "Installing Ruby gems now...." | grep --color 'Installing Ruby gems now'
cd .. && bundle install

echo
echo "Installation Completed!" | grep --color 'Installation Completed'
