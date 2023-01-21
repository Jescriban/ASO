#!/bin/bash
# creacuenta.sh : Crea carpetas basadas en el nombre proporcionado por el primer parámetro
# seguido de un numero entre el segundo parametro y el tercero
if [ $# -ne 3 ];then
  echo "Se ha de poner estrictamente tres parametros"
  exit 1
else
  nombre=$1
  max=$3
  cuenta=$2
  while [ $cuenta -lt $max ]
  do
  if [ -d $nombre$cuenta ];then
    echo "la carpeta $nombre$cuenta ya existe"
  else
    mkdir $nombre$cuenta && echo "$nombre$cuenta creado"
  fi
  cuenta=$((cuenta+1))
  done
fi
