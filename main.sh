#!/bin/sh

echo "Backing up current CentOS-Base.repo file ..."
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.orig

echo "Downloading and placing CentOS-Base.repo ..."
curl -4 https://raw.githubusercontent.com/MrAriaNet/fix-centos7-repository/main/CentOS-Base.repo -o /etc/yum.repos.d/CentOS-Base.repo

if [[ -f /etc/yum.repos.d/epel.repo ]]; then
    sed -i 's|^metalink=|#metalink=|' /etc/yum.repos.d/epel.repo
    sed -i 's|^#baseurl=.*|baseurl=https://el7.repo.almalinux.org/epel/7/|' /etc/yum.repos.d/epel.repo
    echo "epel.repo is fixed ..."
fi

yum clean all --verbose

echo "Repositories successfully replaced."
echo "Now you can use the 'yum' command!"
