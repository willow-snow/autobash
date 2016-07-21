#uncomment next line if using root ssh key
#sudo su
sudo apt-get update
sudo apt-get install -y apache2 mysql-server php5-mysql php5 libapache2-mod-php5 php5-mcrypt phpmyadmin
sudo mysql_secure_installation
sudo rm /etc/apache2/mods-enabled/dir.conf
sudo chmod 777 -R /var/www/
sudo echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
sudo >/var/www/html/index.php
sudo wget -O /var/www/html/index.php https://raw.githubusercontent.com/nicememedude/autobash/master/noneedtodl/indexlamp.php
sudo wget -O /etc/apache2/mods-enabled/dir.conf https://raw.githubusercontent.com/nicememedude/autobash/master/noneedtodl/dirlamp.conf
sudo service apache2 restart

