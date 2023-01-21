#!/bin/bash
# renombra.sh : cambia la extension de un tipo de ficheros.
# las extensiones que se pasan como parametros no incluiran el punto
if [ $# -ne 2 ];then
  echo "Este programa requiere dos argumentos"
  echo "Exit code 1"
  exit 1
fi
for i in *.$1
do
  nombre=$(basename $i $1)
  mv $nombre$1 $nombre$2
done
