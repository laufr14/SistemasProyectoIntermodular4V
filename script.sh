#!/bin/bash

#Mostrar el número de parámetros 

echo "Número de parámetros: $#"

#Mostrar cada parámetro por separado

contador=1

for parametro in "$@"; do
echo "Parámetro $contador: $parametro"
contador=$((contador+1))
done

