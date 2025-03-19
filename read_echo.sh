#!/bin/bash 

#1. Uso de echo con diferentes opciones
echo "Soy un script que muestra como funciona echo"
echo "Hola mundo, me llamo Laura"
echo -n "Este es un tercer parámetro"
echo -e "Este es un cuarto parámetro"

#2. Uso de read con diferentes opciones 
read -p "Introduce tu nombre:" $nombre
read -s "Introduce tu contraseña:" 
read -t "Este mensaje es temporal"

#3. Probando read
read "¿Como te llamas?" nombre
echo "Hola, me llamo: $nombre"
echo -t 5 -p "Este mensaje dura 5 segundos"

