#!/bin/bash
set -e

sudo apt-get update -y

# DEBIAN_FRONTEND=noninteractive fa in modo che il comando dopo eviti di chiedere input dall'utente.
# Potrebbe chidere password o simili e questo fa in modo che metta automaticamente l'opzione di default.
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

sudo systemctl enable mysql
sudo systemctl start mysql

# sed permetted di modificare file, in questo caso un file di configurazione.
# -i modifica questo file (non va a scrivere su un altro file di output)
# s/vecchio_pattern/nuovo_pattern/ (trova e sostituisce)
# ^bind-address (cerca se comincia per bind-address)
# \s* = qualsiasi numero di spazi (anche 0)
# vacchio_pattern: 127.0.0.1, nuovo_pattern: 0.0.0.0 (tutti gli indirizzi)
# L'ultima cosa è il percorso del file di configurazione
sudo sed -i "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

sudo systemctl restart mysql

# host: 10.10.20.11
# user: test_user
# password: test_password
# DB: test_db
sudo mysql -u root -e "CREATE SCHEMA test_db"
sudo mysql -u root -e "CREATE USER 'test_user'@'%' IDENTIFIED BY 'test_password';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON test_db.* TO 'test_user'@'%';"

sudo mysql -u root -e "FLUSH PRIVILEGES;"

sudo systemctl restart mysql