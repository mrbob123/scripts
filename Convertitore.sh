#!/bin/bash

numer0=$(zenity --entry --title="Converti" --text="Inserire un numero da convertire" --window-icon=/usr/share/icons/gnome/32x32/apps/gnome-calculator.png )

wait

BASE=$(zenity --list --radiolist --title="Selezionare una base" --text=" <big> <b> Base? </b> </big>
	È necessario selezionare la base del numero che
	s'intende convertire:" --print-column=2 --column="Scegli" --column="Base" --column="Nome Base" true "10" "Decimale" false "8" "Ottale" false "2" "Binario" false "16" "Esadecimale" --height=300 --window-icon=/usr/share/icons/gnome/32x32/apps/gnome-calculator.png)

wait

case $BASE in 
"10")numero=$numer0;;
"8")numero=$(echo "ibase=8;obase=10; $numer0" | bc) ;;
"2")numero=$(echo "ibase=2;obase=10; $numer0" | bc) ;;
"16")numero=$(echo "ibase=16;obase=10; $numer0" | bc) ;;

esac

wait

NUMERO=$(echo "ibase=10;obase=2; $numero" | bc)
ESADECIMALE=$(echo "ibase=10;obase=16; $numero" | bc )
OTTALE=$(echo "ibase=10;obase=8; $numero" | bc)

wait

(zenity --info --title="Converti" --text="
	<big> <b>CONVERSIONE  </b> </big>
	\n 
	<tt>DEX - $numero 
	BIN - $NUMERO 
	HEX - $ESADECIMALE
	OCT - $OTTALE</tt>" --window-icon=/usr/share/icons/gnome/32x32/apps/gnome-calculator.png  )

wait
