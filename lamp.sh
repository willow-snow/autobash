#uncomment next line if using root ssh key
#sudo su
sudo echo "First, we update apt-get repos"
sudo apt-get -qq update
sudo echo "Then, we install all the necessary components of a LAMP stack!"
sudo apt-get -qq install -y apache2 mysql-server php5-mysql php5 libapache2-mod-php5 php5-mcrypt phpmyadmin
sudo mysql_secure_installation
sudo rm /etc/apache2/mods-enabled/dir.conf
sudo chmod 777 -R /var/www/
sudo echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
sudo wget -O /var/www/html/index.php https://raw.githubusercontent.com/nicememedude/autobash/master/noneedtodl/indexlamp.php
sudo wget -O /etc/apache2/mods-enabled/dir.conf https://raw.githubusercontent.com/nicememedude/autobash/master/noneedtodl/dirlamp.conf
sudo php5enmod mcrypt
sudo service apache2 restart

