#!/bin/bash

# Función para agregar un usuario
agregar_usuario() {
    read -p "Introduce el nombre de usuario: " usuario
    if id "$usuario" &>/dev/null; then
        echo "El usuario '$usuario' ya existe."
    else
        sudo useradd "$usuario"
        echo "Usuario '$usuario' creado correctamente."
    fi
}

# Función para eliminar un usuario
eliminar_usuario() {
    read -p "Introduce el nombre de usuario a eliminar: " usuario
    if id "$usuario" &>/dev/null; then
        sudo userdel -r "$usuario"
        echo "Usuario '$usuario' eliminado correctamente."
    else
        echo "El usuario '$usuario' no existe."
    fi
}

# Función para listar los usuarios del sistema
listar_usuarios() {
    echo "Lista de usuarios en el sistema:"
    cut -d: -f1 /etc/passwd
}

# Menú principal
while true; do
    echo -e "\nGestión de Usuarios"
    echo "1. Agregar usuario"
    echo "2. Eliminar usuario"
    echo "3. Listar usuarios"
    echo "4. Salir"
    read -p "Elige una opción: " opcion

    case $opcion in
        1) agregar_usuario ;;
        2) eliminar_usuario ;;
        3) listar_usuarios ;;
        4) echo "Saliendo..."; exit ;;
        *) echo "Opción no válida. Inténtalo de nuevo." ;;
    esac
done
