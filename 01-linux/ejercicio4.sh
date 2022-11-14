#!/bin/bash

if [ -z $1 ]; then
    echo "Es necesario el parámetro"
    exit 1
fi

ARCHIVO="ejercicio4_response.txt"
URL="https://lemoncode.net/bootcamp-devops"

curl -s -o $ARCHIVO $URL

NUM_VECES=$(grep -o $1 $ARCHIVO | wc -l)

if [ $NUM_VECES -gt 0 ]; then
    LINEA=$(grep -m1 -n $1 $ARCHIVO | awk -F: '{print $1}')

    echo "La palabra \"$1\" aparece $NUM_VECES veces"
    echo "Aparece por primera vez en la línea $LINEA"
else
    echo "No se ha encontrado la palabra \"$1\""
fi