README
Para usar se necesitan los dos archivos: Filtro_auda.sh y Filter_Auda.awk
Necesita herramientas de core-utils como mktemp, cut, sort y head, todas cosas que están instaladas en casi cualquier distro de linux.
primero hay que darle permiso de ejecución a Filtro_auda.sh si es que no lo tiene. Se hace una sola vez con el comando:

chmod +x Filtro_auda.sh

Luego se usa de la siguiente manera:

Filtro_auda.sh archivo.csv

El resultado va a ser los nombres de la secuencias (según GISAID) que tienen el mínimo número de cambios, ordenados por orden decreciente de calidad de alineamiento.

Si necesito sólo 10 puedo usar el comando:

Filtro_auda.sh archivo.csv | head -n 10

Si me molestan los resultados de las calidades (quiero armar un archivo para copiar los nombres y pegarlos en el cuadro de búsqueda de GISAID) puedo usar:

Filtro_auda.sh archivo.csv | head -n 10 | cut -f 1

Y si no quiero copiar desde la consola porque me complica, puedo usar:

Filtro_auda.sh archivo.csv | head -n 10 | cut -f 1 > Para_Copiar.txt

Esto crea el archivo "Para_Copiar.txt" con los resultados
