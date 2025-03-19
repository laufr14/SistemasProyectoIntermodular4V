#!/bin/bash

#Verificar si se pasó un archivo como parámetro

if [ -z "$1" ]; then 
echo "Uso: $0 <nombre_archivo>"
exit 1
fi

#Definir variables 
archivo="$1"
papelera="HOME/papelera"

# Crear la papelera si no existe
mkdir -p "$papelera"

#Verificar si el archivo existe
if [ -f "$archivo" ]; then 
cp "archivo" "$papelera/"

#Borrar el archivo original
rm "$archivo"

echo "El archivo '$archivo' ha sido movido a la papelera y eliminado del directorio actual."
else
echo "Error: El archivo '$archivo' no existe."
exit 1
fi

 
