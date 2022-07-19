#!/bin/bash
# Filtro_auda.sh archivo.csv
# si querés 10 resultados usar Filtro_auda.sh | head -n 10
# si querés 5 usar -n 5 en lugar y así
# primero saneamos el input
awkfile="Filter_Auda.awk" # corregir el path si no esta jutno con este script
tmpfile=$(mktemp /tmp/FA_tmp.XXXXXX)
cat $1 | tr -d '\n' | tr '\r' '\n' > $tmpfile
# ahora nos fijamos el menor valor de distancia
mindist=$(cut -d, -f 7 $tmpfile | sort -n | head -1)
awk -v mindist=$mindist -f $awkfile $tmpfile 
rm $tmpfile
