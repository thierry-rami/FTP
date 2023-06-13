#/bin/bash
service proftpd stop
rm -fr /etc/proftpd/ssl
apt purge proftpd-core proftpd-mod-crypto
apt autoremove
