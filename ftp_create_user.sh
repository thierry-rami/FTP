#/bin/sh
# enleve les espaces dans le fichier
sed s/ //g Shell_Userlist.csv

cat Shell_Userlist.csv| while IFS="," read -r Id Prenom Nom Mdp Role; do

	if [ "$Id" = 'Id' ]; then
		continue
	fi

if [ $? -eq 0 ]; then 
        # enleve les majuscules
        $Prenom="${Prenom,,}"
        $Nom="${Nom,,}"
		useradd --badname "$Prenom.$Nom" -p $Mdp --shell /bin/false -m -d /home/"$Prenom.$Nom"
		echo "$Prenom.$Nom créé avec succès"

	else
		echo "Impossible de créer $Prenom.$Nom"
	fi

done
