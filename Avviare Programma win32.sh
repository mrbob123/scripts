#!/bin/bash

##Con questo script si possono avviare applicativi win32 per piattaforme Windows®

selection=$(zenity --list "WineCFG" "Apri File" "Esci" --column="" --text="Text above column(s)" --title="My menu")

wait

zenity --warning --title="Prefisso" --text="È necessario selezionare un prefisso di Wine per continuare"

wait

prefisso=$(zenity --list "$HOME/.wine32" "$HOME/.wine" "$HOME/.wine32-spore" --column="" --text="Text above column(s)" --title="Seliziona un prefisso...")

wait

case "$selection" in
"WineCFG")(WINEARCH=win32 WINEPREFIX=$prefisso winecfg);;
"Esci")exit;;
"Apri File")(FILE=$(zenity --file-selection --title="Seleziona un File Windows®" --file-filter=""*.exe" "*.bat" "*.msi"" )

wait

(zenity --info --title="Avvio..." --text="Continuando verrà avviato questo file: $FILE su wine32, se l'applicazione non dovesse funzionare riavviare lo script in un terminale per vedere l'output di wine")

wait

WINEARCH=win32 WINEPREFIX=$prefisso wine $FILE

wait);;

esac
