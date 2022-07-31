BEGIN { 
	FPAT = "([^,]*)|(\"[^\"]+\")";
	#Definimos los campos por REGEX ya que hay comas embebidas. ¡Antes sanear el input para remover enters embebidos!
	if (nhits=="") nhits=10;
	# asignamos un valor default a mindist. Se puede pasar con -v mindist=X, para obtener X se puede usar: cut -d, -f 7 neighbours.csv | sort -n | head -1 // para que devuelva el mínimo  valor de distancia
	lastid="";
	hitcount=0;
	PROCINFO["sorted_in"]="@val_num_asc";
	# configuramos AWK para que ordene los arrays en orden descendiente y con esto podemos filtrar por calidad
} 
!$9==True && $1 != "sequence_id" {
	# esto se hace para cada línea que no sea idéntica al query (algo que se codifica en el novemo campo) y que no sea la cabecera
	# primero chequeamos si el ID sigue siendo el mismo, sino, lo actualizamos
	if (lastid!=$1) {
		hitcount=0;
		lastid=$1;
	}
	++hitcount;
	if ( hitcount<nhits+1 ){
		resdist[$1][$3]=$7;
		results[$1][$3]=$8;
	}
	

	# cargamos la matriz de resultados con los datos de calidad. Quedará ordenada en orden decreciente de la misma
}
END {
	# una vez que leyó el archivo volcamos los resultados.
	for (i in resdist){
		for (j in resdist[i]){
			print i "\t" j "\t" results[i][j] "\t" resdist[i][j];
		}
	}
}
