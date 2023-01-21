#!/bin/bash
# copy.sh : copia un archivo
if [ -f $1 ];then
  if [ -e $2 ];then
    echo $2 'ya existe'
  else
    cp $1 $2
  fi
elif [ ! -e $1 ];then
  echo $1 'no esxiste'
else
  echo $1 'no es un archivo regular'
fi
