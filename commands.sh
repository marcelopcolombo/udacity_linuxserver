#Atualizar pacotes instalados
sudo apt-get update
sudo apt-get upgrade

#Criar conta grader
sudo apt-get install finger
sudo adduser grader (pass graderudacity)

# dar acesso sudo
sudo su
nano /etc/sudoers.d/grader 
 #(copy vagrant) grader ALL=(ALL) NOPASSWD:ALL        grader ALL=(ALL:ALL) ALL

#gerar pares de chave
sudo ssh-keygen #/home/grader/ssh graderudacity pc
ssh-keygen -f ~/.ssh/udacity_grader_key.rsa
ssh -i lightsail_key.rsa ubuntu@3.89.196.148
#copy ssh.pub to ~/.ssh/authorized_keys second line
cd /home/grader
mkdir .ssh
cd .ssh
nano authorized_keys
paste key value
chmod 700 .ssh
chmod 644 .ssh/authorized_keys
#change owner to grader
sudo chown -R grader:grader /home/grader/.ssh

#change ssh port
sudo nano /etc/ssh/sshd_config
password authentication to no port to 2200
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 2200/tcp
sudo ufw allow www
sudo ufw allow ntp
sudo ufw deny 22
sudo ufw enable
#change port to add 2200 tcp custom

# trocar timezone utc 
timedatectl # show current timezone
timedatectl list-timezones #list
sudo timedatectl set-timezone UTC
#ou
sudo timedatectl set-timezone Etc/UTC

#instalando apache
sudo apt-get install apache2
#wsgi
sudo apt-get install libapache2-mod-wsgi
#python 3 sudo apt-get install libapache2-mod-wsgi-py3
#editar arquivo /etc/apache2/sites-enabled/000-default.conf
#WSGIScriptAlias / /var/www/html/myapp.wsgi
#reiniciar
sudo apache2ctl restart
# sudo service apache2 reload
sudo nano /var/www/html/myapp.wsgi

#postgressql
sudo apt-get install postgresql
sudo nano /etc/postgresql/9.5/main/pg_hba.conf

#create user postgres
sudo -u postgres psql
create database udacity_catalog;
create user catalog with encrypted password 'catalogudacity';
grant all privileges on database udacity_catalog to catalog;

cd /var/html/
git clone https://github.com/marcelopcolombo/udacity_catalog_items.git
sudo chown -R grader:grader udacity_catalog_items/
cd/var/www/html/udacity_catalog_items/catalog
mv application.py __init__.py
sudo -u postgres psql -d udacity_catalog -f db.sql

# install git on ubuntu
sudo apt-get update
sudo apt-get install git
git config --global user.name "Marcelo Colombo"
git config --global user.email "marcelo.pcolombo@gmail.com"
sudo apt-get -qqy install python3 python3-pip
sudo apt-get -qqy install python python-pip
sudo pip2 install flask packaging oauth2client redis passlib flask-httpauth
sudo chmod -R 755 /var/www
