#!/bin/bash
# dir.sh : Comprueba si el argumento es un directorio
if test -d $1
then
  echo $1 'es un directorio'
elif test -e $1
then
  echo $1 'no es un directorio'
else
  echo $1 'no existe'
fi

