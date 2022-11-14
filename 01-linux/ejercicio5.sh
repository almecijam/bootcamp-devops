#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Se necesitan únicamente dos parámetros para ejecutar este script"
    exit 1
fi

function obtener_linea() {
  echo $(grep -m1 -n $1 $2 | awk -F: '{print $1}')
}

URL=$1
PALABRA=$2
ARCHIVO="ejercicio5_response.txt"

curl -s -o $ARCHIVO $URL

NUM_VECES=$(grep -o $PALABRA $ARCHIVO | wc -l)

if [ $NUM_VECES -eq 1 ]; then
    LINEA=$(obtener_linea $PALABRA $ARCHIVO)

    echo "La palabra \"$PALABRA\" aparece 1 vez"
    echo "Aparece únicamente en la línea $LINEA"
elif [ $NUM_VECES -gt 1 ]; then
    LINEA=$(obtener_linea $PALABRA $ARCHIVO)

    echo "La palabra \"$PALABRA\" aparece $NUM_VECES veces"
    echo "Aparece por primera vez en la línea $LINEA"
else
    echo "No se ha encontrado la palabra \"$PALABRA\""
fi