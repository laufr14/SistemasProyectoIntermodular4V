#!/bin/bash

# Paso 1: Obtener el nombre del fichero
if [ -z "$1" ]; then
    # Si no se pasa parámetro, pedir el nombre del archivo
    read -p "Introduce el nombre del fichero: " fichero
else
    # Si se pasa un parámetro, usarlo como el nombre del archivo
    fichero="$1"
fi

# Verificar si el archivo existe
if [ ! -f "$fichero" ]; then
    echo "El archivo '$fichero' no existe."
    exit 1
fi

# Paso 2: Mostrar mensaje de archivo
echo "Las operaciones, que se realicen a partir de ahora se efectuarán sobre el archivo: $fichero"

# Paso 3: Mostrar el menú
while true; do
    echo ""
    echo "Menú de opciones:"
    echo "1. Mostrar el nombre del usuario que ejecuta el script"
    echo "2. Mostrar el directorio actual en que nos encontramos"
    echo "3. Mostrar el contenido del fichero, paginado"
    echo "4. Mostrar los permisos sobre el fichero"
    echo "5. Indicar quien es el propietario del fichero"
    echo "6. Indicar el nº de líneas de que consta el fichero"
    echo "7. Editar el fichero (con vi)"
    echo "8. Mostrar el contenido del directorio, paginado"
    echo "9. Salir"
    read -p "Elige una opción (1-9): " opcion
    
    case $opcion in
        1)
            # Mostrar el nombre del usuario
            echo "El usuario que ejecuta el script es: $(whoami)"
            ;;
        2)
            # Mostrar el directorio actual
            echo "El directorio actual es: $(pwd)"
            ;;
        3)
            # Mostrar el contenido del fichero, paginado
            echo "Contenido del fichero $fichero:"
            cat "$fichero" | more
            ;;
        4)
            # Mostrar los permisos sobre el fichero
            echo "Permisos del fichero $fichero:"
            ls -l "$fichero"
            ;;
        5)
            # Mostrar el propietario del fichero
            echo "El propietario del fichero $fichero es:"
            ls -l "$fichero" | awk '{print $3}'
            ;;
        6)
            # Mostrar el número de líneas del fichero
            echo "El fichero $fichero tiene $(wc -l < "$fichero") líneas."
            ;;
        7)
            # Editar el fichero con vi
            vi "$fichero"
            ;;
        8)
            # Mostrar el contenido del directorio actual, paginado
            echo "Contenido del directorio actual:"
            ls | more
            ;;
        9)
            # Salir del script
            echo "Saliendo..."
            break
            ;;
        *)
            echo "Opción no válida. Por favor, elige una opción entre 1 y 9."
            ;;
    esac
done
