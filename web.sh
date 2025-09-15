#!/bin/bash
# Fa in modo che lo script smetta di andare avanti in caso incontri qualsiasi errore
set -e

# apt-get preferibile al posto di apt in script automatizzati perché è più prevedibile
# -y risponde "yes" a qualsiasi prompt automaticamente
sudo apt-get update -y

sudo apt-get install -y apache2 php libapache2-mod-php php-mysqli php-curl php-json unzip wget

cd /var/www/html

# -q = quiet, scrive solo errori a terminale
# -O salva con nome scelto (index.php) nella directory corrente
sudo wget -q https://www.adminer.org/latest.php -O index.php
# sudo rm index.html

# Dà ownership all'utente e gruppo utilizzato da Apache (www-data)
# -R = ricorsivo
sudo chown -R www-data:www-data /var/www/html

sudo systemctl restart apache2
