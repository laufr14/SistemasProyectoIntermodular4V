#!/bin/bash 

# Solicitar el nombre de archivo 

echo -n "Introduce el nombre del archivo"
read nombre_archivo

# Copiar el archivo al directorio 'copia (suponiendo que está en el mismo directorio actual)
cp "$nombre_archivo" ~/programadorc/copia/ 2>/dev/null
   

