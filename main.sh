#!/bin/sh
RANDOM_NUMBER=$(($RANDOM % 900 + 100))

echo "Backing up current yum.repos.d files..."
mv /etc/yum.repos.d /etc/yum.repos.d.backup$RANDOM_NUMBER

echo "Creating new yum.repos.d directory..."
mkdir /etc/yum.repos.d

echo "Downloading and placing CentOS-Base.repo..."
curl -4 https://raw.githubusercontent.com/MrAriaNet/fix-centos7-repository/refs/heads/main/CentOS-Base.repo -o /etc/yum.repos.d/CentOS-Base.repo

yum clean all --verbose

echo "Repositories successfully replaced."
echo "Now you can use the 'yum' command!"
