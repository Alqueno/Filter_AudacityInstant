#!/bin/bash
# Filtro_auda.sh archivo.csv nhits
# si querés 10 resultados usar Filtro_auda.sh archivo.csv 10
# definimos donde está el programa AWK
awkfile="Filter_Auda.awk" # corregir el path si no esta jutno con este script
# luego saneamos el input (quitamos enters y ordenamos
tmpfile=$(mktemp /tmp/FA_tmp.XXXXXX)
cat $1 | tr -d '\n' | tr '\r' '\n' | sort -n -k 1,1 -k 7,7 > $tmpfile
# ahora ejecutamos el programa AWK
awk -v nhits=$2 -f $awkfile $tmpfile | sort -d -k 1,1
# limpiamos la casa
rm $tmpfile
