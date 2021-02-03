#!/bin/bash
# Autor: Andressa IdalgoIvan Moretto
# Data: 26/05/2020

let linhas=`df -h|wc -l`-1
df -h|tail -$linhas|sed 's/%//'|sed 's/G//g'|
while read sistema Tam  Usad Disp  Uso Montado
   do
        echo $sistema $Tam $Usad $Disp $Uso $Montado
        if [ $Uso -gt 97 ]  # Quando o volume montado atingir 97%, envia email.
        then
                echo "$sistema montado em $Montado com $Uso% utilizado, Espaco Livre= $Disp" >>/tmp/parte
        fi
   done