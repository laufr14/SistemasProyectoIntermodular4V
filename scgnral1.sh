#!/bin/bash

# Comprobamos que hay 3 parámetros
if [ $# -ne 3 ]; then
    echo "Error: Debes proporcionar 3 parámetros: fichero, número de líneas y opción (-h o -t)."
    exit 1
fi

# Asignar los parámetros a variables
fichero="$1"
num_lineas="$2"
opcion="$3"

# Verificamos si el fichero existe y es un archivo regular
if [ ! -f "$fichero" ]; then
    echo "Error: El fichero '$fichero' no existe o no es un archivo regular."
    exit 1
fi

# Verificar si el número de líneas es un número válido
if ! [[ "$num_lineas" =~ ^[0-9]+$ ]]; then
    echo "Error: El número de líneas debe ser un número entero positivo."
    exit 1
fi

# Obtener el número total de líneas del fichero
total_lineas=$(wc -l < "$fichero")

# Verificamos que no se pidan más líneas de las que tiene el fichero
if [ "$num_lineas" -gt "$total_lineas" ]; then
    echo "Error: El fichero '$fichero' solo tiene $total_lineas líneas."
    exit 1
fi

# Mostrar las líneas según la opción indicada
case "$opcion" in
    -h) head -n "$num_lineas" "$fichero" ;;
    -t) tail -n "$num_lineas" "$fichero" ;;
    *) echo "Error: Opción inválida. Usa '-h' para las primeras líneas o '-t' para las últimas."; exit 1 ;;
esac
