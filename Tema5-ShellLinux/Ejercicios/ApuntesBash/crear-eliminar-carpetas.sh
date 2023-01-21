#!/bin/bash
# creacuenta.sh : Crea carpetas basadas en el nombre proporcionado por el primer parámetro
# seguido de un numero entre el segundo parametro y el tercero y pregunta si eliminarlas despues
if [ $# -ne 3 ];then
  echo "Se ha de poner estrictamente tres parametros"
  exit 1
else
  echo ""
  echo "-----------------"
  echo ""
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
  echo ""
  echo "-----------------"
  echo ""
  echo "Directorio actual"
  pwd
  #Imprimir listado de archivos y carpetas
  num=0
  for i in *
  do
    num=$((num+1))
  done
  cuenta=1
  while [ $cuenta -le $num ]
  do
    ls -l | sed -n $cuenta\p | cut -d " " -f5-99
    cuenta=$((cuenta+1))
  done
  echo ""
  echo "-----------------"
  echo ""
  salir=0
  while [ $salir -lt 1 ]
  do
    read -p "Quieres eliminar las carpetas?(Si/No) " opcion
    #Eliminar las carpetas
    if [ $opcion == "Si" ];then
      cuenta=$2
      while [ $cuenta -lt $max ]
      do
        rmdir $nombre$cuenta && echo "La carpeta $nombre$cuenta se ha eliminado"
        cuenta=$((cuenta+1))
      done
      echo ""
      echo "-----------------"
      echo ""
      #Imprimir listado de archivos y carpetas
      cuenta=1
      while [ $cuenta -le $num ]
      do
        ls -l | sed -n $cuenta\p | cut -d " " -f5-99
        cuenta=$((cuenta+1))
      done
      #Salir del bucle
      salir=$((salir+1))
    elif [ $opcion == "No" ];then
      echo "Programa finalizado"
      exit 1
    else
      echo "Introduce Si o No respetando las mayusculas"
    fi
  done
echo ""
echo "-----------------"
echo ""
fi
