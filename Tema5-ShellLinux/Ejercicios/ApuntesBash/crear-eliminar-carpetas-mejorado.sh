#!/bin/bash
# creacuenta.sh : Crea carpetas basadas en el nombre proporcionado por el primer parámetro
# seguido de un numero entre el segundo parametro y el tercero y pregunta si eliminarlas despues
#Modificacion
# Comprobar que son tres parametros
if [ $# -ne 3 ];then
  echo "Se ha de poner estrictamente tres parametros"
  exit 1
# Comienza el script
else
  echo ""
  echo "-----------------"
  echo ""
  nombre=$1
  max=$3
  cuenta=$2
# Creacion de las carpetas
  while [ $cuenta -lt $max ]
  do
  if [ -d $nombre$cuenta ];then
    echo "la carpeta $nombre$cuenta ya existe"
    sleep 0.5
  else
    mkdir $nombre$cuenta && echo "$nombre$cuenta creado"
    sleep 0.5
  fi
  cuenta=$((cuenta+1))
  done
  echo ""
  echo "-----------------"
  echo ""
  echo "Directorio actual"
  pwd
  touch temp.txt
  #Imprimir listado de archivos y carpetas
  num=0
  for i in *
  do
    num=$((num+1))
  done
  #Parte para colorear texto
  RED='\033[0;31m'
  YELLOW='\033[1;33m'
  NC='\033[0m'
  #
  #LIsta de archivos/directorios con resaltado a color
  cuenta=2
  while [ $cuenta -le $num ]
  do
    contadorEspacios=0
    ls -l | sed -n $cuenta\p | grep -o " " | wc -l > temp.txt
    numEspacios=$(cat temp.txt)
    espaciosVariables=$((numEspacios-6))
    espacioContinuacion=$(($espaciosVariables+3))
    espacioFinal=$(($numEspacios+1))
    echo -n $(ls -l | sed -n $cuenta\p | cut -d " " -f1-4)
    while [ $contadorEspacios -le $espaciosVariables ]
    do
      echo -n " "
      contadorEspacios=$(($contadorEspacios+1))
    done
    echo -n $(ls -l | sed -n $cuenta\p | cut -d " " -f$espacioContinuacion-$numEspacios)
    echo -n " "
    #Rojo para las carpetas recien creadas Amarillo para las demas
    ls -l | sed -n $cuenta\p | cut -d " " -f$espacioFinal > temp.txt
    palabra=$(cat temp.txt)
    echo $nombre | wc -c > temp.txt
    numLetras=$(cat temp.txt)
    numLetras=$(($numLetras-1))
    palabra=$(echo $palabra | cut -c 1-$numLetras)
    if [ $palabra == $nombre ];then
      echo -e ${RED}$(ls -l | sed -n $cuenta\p | cut -d " " -f$espacioFinal)${NC}
    else
      echo -e ${YELLOW}$(ls -l | sed -n $cuenta\p | cut -d " " -f$espacioFinal)${NC}
    fi
    cuenta=$((cuenta+1))
  done
  # Acaba la lista
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
        sleep 0.5
        cuenta=$((cuenta+1))
      done
      echo ""
      echo "-----------------"
      echo ""
      #Imprimir listado de archivos y carpetas
      num=0
      for i in *
      do
        num=$((num+1))
      done
      #Imprimir listado coloreado
      cuenta=2
      while [ $cuenta -le $num ]
      do
        contadorEspacios=0
        ls -l | sed -n $cuenta\p | grep -o " " | wc -l > temp.txt
        numEspacios=$(cat temp.txt)
        espaciosVariables=$((numEspacios-6))
        espacioContinuacion=$(($espaciosVariables+3))
        espacioFinal=$(($numEspacios+1))
        echo -n $(ls -l | sed -n $cuenta\p | cut -d " " -f1-4)
        while [ $contadorEspacios -le $espaciosVariables ]
        do
          echo -n " "
          contadorEspacios=$(($contadorEspacios+1))
        done
        echo -n $(ls -l | sed -n $cuenta\p | cut -d " " -f$espacioContinuacion-$numEspacios)
        echo -n " "
        echo -e ${YELLOW}$(ls -l | sed -n $cuenta\p | cut -d " " -f$espacioFinal)${NC}
        cuenta=$((cuenta+1))
      done
      rm temp.txt
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
