#!/bin/bash
#lista.sh : Lista archivos de extensiones dadas por el usuario
# Termina cuando se escribe la extension \"fin\"
read -p "Teclea una extension: " ext
while [ $ext != "fin" ]
do
  lista=$(ls *.$ext 2>/dev/null)
  cant=$(echo $lista | wc -w)
  if [ $cant -gt 0 ];then
    echo "Los ficheros .$ext son:" $lista
  else
    echo "No hay ficheros con la extension \".$ext\""
  fi
  read -p "Teclea otra extension:" ext
done
echo "Has finalizado el programa"
