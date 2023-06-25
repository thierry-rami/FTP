#/bin/bash
service proftpd stop
servive clamav-daemon stop
service antivirus stop
systemctl enable antivirus
rm -fr /etc/systemd/system/antivirus.service
rm -fr /etc/proftpd/ssl
# X-Team
apt purge proftpd proftpd-mod-crypto wget clamav clamav-daemon
apt autoremove
