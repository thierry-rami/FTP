# Installation d'un serveur FTP (en SSL/TLS ) avec Antivirus
## sur une Debian fraîchement installée

* **Installation** :

		apt install wget 
		su -
		wget https://raw.githubusercontent.com/thierry-rami/FTP/main/install_ftp.sh
		chmod +x install_ftp.sh	
		./install_ftp.sh
		
* **test avec un client FTP ( FileZilla )** :

	Télécharger et installer le client [Filezilla](https://filezilla-project.org/download.php?type=client) et lancer la connexion dans mon cas adr 192.168.39.130 , utilisateur et mot de passe: x
	
	![Logo](https://raw.githubusercontent.com/thierry-rami/FTP/main/Filezilla.png)
	
	on voit bien que la connexion s'est bien établie en TLS

* **test de la partie Antivirus** :


	Se loguer en tant qu’utilisateur ( pas root ) et taper :
	
		cd
		echo > eicar.txt 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*'
		ls -al 
		cat eicar.txt
		ls -al 

	la ligne echo crée un fichier eicar.txt contenant une signature de virus
	
	le 1er ls liste bien le fichier eicar.txt
	
	le "cat eicar.txt" fait un accès au fichier ( et si l'antivirus est bien configuré, celui ci supprime le fichier eicar.txt car pour lui il est vérolé )

	le 2eme ls -al n'affiche rien, car le fichier a été supprimé par l'antivirus

	Maintenant si on fait ( en tant que root ) :  tail -f clamav.log 

	On voit que dans le log le fichier eicar a bien été vu par l'antivirus comme un fichier vérolé .

		Sun Jun 25 09:14:16 2023 -> instream(local): Eicar-Signature(69630e4574ec6798239b091cda43dca0:69) FOUND
	
	
* **Désinstallation** :
	
		wget https://raw.githubusercontent.com/thierry-rami/FTP/main/remove_ftp.sh
		chmod +x remove_ftp.sh
		./remove_ftp.sh
	
	
	**PS :** 
	Un problème sous Debian 12 , le service ne se lance pas au démarrage.
	Il faut le lancer manuellement  par: systemctl start proftpd
