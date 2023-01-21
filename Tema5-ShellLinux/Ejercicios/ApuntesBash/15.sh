#!/bin/bash
# cuenta.sh : Imprime los numeros de 0 a un valor MAX pasado como parametro
max=$1
cuenta=0
while [ $cuenta -le $max ]
do
  echo $cuenta
  cuenta=$[cuenta+1]
done
