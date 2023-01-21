#!/bin/bash
# lsdirs.sh : Lista el numero de directorios del directorio actual
num=0
for i in *
do
  if [ -d $i ];then
    echo $i
    let num=num+1
  fi
done
echo "Total: $num directorio(s)"
