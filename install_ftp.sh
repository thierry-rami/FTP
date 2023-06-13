#/bin/bash
# maj des paquets
apt update && apt upgrade -y
apt-get install proftpd proftpd-mod-crypto wget -y
service proftpd stop

#création de la clé et du certificat
mkdir /etc/proftpd/ssl
openssl req -new -x509 -keyout /etc/proftpd/ssl/proftpd.key.pem -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem

#on supprime les fichiers de base
rm /etc/proftpd/proftpd.conf
rm /etc/proftpd/tls.conf
rm /etc/proftpd/modules.conf

#récupeation des fichiers de config sur github 
cd /etc/proftpd/
wget https://github.com/thierry-rami/FTP/tree/main/config/proftpd.conf
wget https://github.com/thierry-rami/FTP/tree/main/config/modules.conf
wget https://github.com/thierry-rami/FTP/tree/main/config/tls.conf

# on relance le service proftpd
service proftpd start