#! /bin/bash

# File.sh

 

ENTRY=$(zenity --password --username --title="Accedi a Facebook")

case $? in
         0)
	 	NAME=("User Name: `echo $ENTRY | cut -d'|' -f1`")
	 	PASS=("Password : `echo $ENTRY | cut -d'|' -f2`")
		;;
         1)
                echo "Stop login.";;
        -1)
                echo "An unexpected error has occurred.";;
esac

zenity --info --title=COGLIONE --height=300 --text="
<big> <b> Complimenti coglione ti ho rubato
le tue credeziali di Facebook, non ci credi ? </b> </big>
<tt> Nome Utente (o E-Mail)
	$NAME
Password
	$PASS </tt>"
