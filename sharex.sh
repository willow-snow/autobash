#!/bin/bash

sudo echo "|---------------------------------------|"
sudo echo "|---------------------------------------|"
sudo echo "|ShareX Uploader Script for Ubuntu 14.04|"
sudo echo "|---------------------------------------|"
sudo echo "|_______________________________________|"
sudo echo ""
sudo echo ""
sudo echo "|-----------------------------------------------------------------------------------------------------------------------------|"
sudo echo "|Make sure you have a LAMP stack installed before running this! You can find one at the same place you downloaded this script!|"
sudo echo "|http://github.com/nicememedude/autobash                                                                                      |"                                                           |"
sudo echo "|This script will install the following automatically: unzip                                                                  |"
sudo echo "|-----------------------------------------------------------------------------------------------------------------------------|"
while true; do
    read -p "Do you have Apache and PHP installed? [Y/N] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) sudo apt-get -qq -y install apache2 php5 libapache2-mod-php5
                sudo rm /etc/apache2/mods-enabled/dir.conf
                sudo chmod 777 -R /var/www/
                sudo wget --quiet -O /etc/apache2/mods-enabled/dir.conf https://raw.githubusercontent.com/nicememedude/autobash/master/noneedtodl/dirlamp.conf
                sudo service apache2 restart
                sudo echo "Apache and PHP installed successfully!"
		break;;
    esac
done
apt-get -qq update
apt-get -qq -y install unzip
sudo echo "Downloading ShareX upload script base"
wget --quiet -O /var/www/html/upload.zip https://github.com/nicememedude/autobashfiles/raw/master/u.zip 
sudo unzip -qq /var/www/html/upload.zip -d /var/www/html/
sudo echo "Type the SECRET KEY you want to use, followed by [ENTER]:"
read secretkey
sudo echo "'secure_key' => '$secretkey',"
sudo echo "Type your domain name or public IP address (e.g. 127.0.0.1 or example.com) without http:// or /, followed by [ENTER]:"
read domainname
sudo echo "'output_url' => 'http://$domainname/u/',"
sudo echo "'redirect_url' => 'http://$domainname/',"
sudo echo "Creating config.php!"
sudo touch /var/www/html/u/config.php
sudo echo "" > /var/www/html/u/config.php
sudo echo "<?php" >> /var/www/html/u/config.php
sudo echo "return array(" >> /var/www/html/u/config.php
sudo echo "'secure_key' => '$secretkey'," >> /var/www/html/u/config.php
sudo echo "'output_url' => 'http://$domainname/u/'," >> /var/www/html/u/config.php
sudo echo "'redirect_url' => 'http://$domainname/'," >> /var/www/html/u/config.php
sudo echo ");" >> /var/www/html/u/config.php
sudo echo "?>" >> /var/www/html/u/config.php
sudo echo "Writing a ShareX config at /var/www/html/sharexconfig.json"
sudo touch /var/www/html/sharexconfig.json
sudo echo "" > /var/www/html/sharexconfig.json
sudo echo "{" >> /var/www/html/sharexconfig.json
sudo echo "  \"Name\": \"Custom ShareX Server\"," >> /var/www/html/sharexconfig.json
sudo echo "  \"RequestType\": \"POST\"," >> /var/www/html/sharexconfig.json
sudo echo "  \"RequestURL\": \"$domainname/upload.php\"," >> /var/www/html/sharexconfig.json
sudo echo "  \"FileFormName\": \"d\"," >> /var/www/html/sharexconfig.json
sudo echo "  \"Arguments\": {" >> /var/www/html/sharexconfig.json
sudo echo "    \"key\": \"$secretkey\"," >> /var/www/html/sharexconfig.json
sudo echo "    \"name\": \"%ra%rx%rn%ra\"" >> /var/www/html/sharexconfig.json
sudo echo "  }," >> /var/www/html/sharexconfig.json
sudo echo "  \"ResponseType\": \"Text\"" >> /var/www/html/sharexconfig.json
sudo echo "}" >> /var/www/html/sharexconfig.json
sudo echo "All done! You can find your ShareX config at http://$domainname/sharexconfig.json"
