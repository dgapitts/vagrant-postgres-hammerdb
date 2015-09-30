#! /bin/bash
if [ ! -f /home/vagrant/already-installed-flag ]
then
  echo "ADD EXTRA ALIAS VIA .bashrc"
  cat /vagrant/bashrc.append.txt >> /home/vagrant/.bashrc
  #echo "GENERAL YUM UPDATE"
  #yum -y update
  #echo "INSTALL GIT"
  #yum -y install git
  #echo "INSTALL VIM"
  #yum -y install vim
  #echo "INSTALL TREE"
  #yum -y install tree
  #echo "INSTALL UNZIP"
  #yum  -y install unzip curl wget


  #yum -y update
  echo "install X11 server"
  yum -y groupinstall "X Window System"
  yum -y install xorg-x11-apps   #useful for testing x11 setup is OK
  yum -y install libXScrnSaver   #work around for : wish8.5: error while loading shared libraries: libXss.so.1
  echo "install postgresql-server"
  yum -y install postgresql-server
  echo "install postgresql-contrib"
  yum -y install postgresql-contrib
  echo "set postgres to start on boot"
  chkconfig postgresql on
  service postgresql initdb
  service postgresql start
  #yum install xorg-x11-apps.x86_64



else
  echo "already installed flag set : /home/vagrant/already-installed-flag"
fi


