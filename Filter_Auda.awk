BEGIN { 
	FPAT = "([^,]*)|(\"[^\"]+\")";
	#Definimos los campos por REGEX ya que hay comas embebidas. ¡Antes sanear el input para remover enters embebidos!
	if (mindist=="") mindist=0;
	# asignamos un valor default a mindist. Se puede pasar con -v mindist=X, para obtener X se puede usar: cut -d, -f 7 neighbours.csv | sort -n | head -1 // para que devuelva el mínimo  valor de distancia
	PROCINFO["sorted_in"]="@val_num_desc";
	# configuramos AWK para que ordene los arrays en orden descendiente y con esto podemos filtrar por calidad
} 
!$9==True && $7==mindist {
	# esto se hace para cada línea que no sea idéntica al query (algo que se codifica en el novemo campo) y que este a la distancia indicada (o 0 si no se indica)
	results[$3]=$8;
	# cargamos la matriz de resultados con los datos de calidad. Quedará ordenada en orden decreciente de la misma
}
END {
	# una vez que leyó el archivo volcamos los resultados.
	for (i in results){
		print i "\t" results[i];
	}
}
