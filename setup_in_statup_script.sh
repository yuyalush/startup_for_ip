#!/bin/sh
# pwd => /
# whoami => root

cd /root
echo "START!!!!"
date
apt-get install -y build-essential libssl-dev openssl libreadline6 libreadline6-dev git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion git-core unzip wget
echo "apt-get finished."
date

#ruby1.9.2
echo "TITLE:Ruby start."
date
wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.gz
tar zxvf ruby-1.9.2-p290.tar.gz
cd ruby-1.9.2-p290
./configure
make -j
make install
echo "TITLE:Ruby finished."
date

#Sinatra
echo "TITLE:Sinatra start"
date
echo "gem: --no-ri --no-rdoc" > /root/.gemrc
cd ..
sudo gem update --system
sudo gem update rake
sudo gem install sinatra
echo "TITLE:Sinatra finished"
date

#Create Server
wget https://github.com/yuyalush/ip_address/zipball/master -O ip_address.zip
unzip ip_address.zip
mv yuyalush-ip_* ip_address
cd ip_address
rackup -D config.ru

echo "TITLE:ufw setting"
ufw allow 9292

echo "TITLE:Finish!!!!!"
date

# Please Access http:// global-ip :9292/
