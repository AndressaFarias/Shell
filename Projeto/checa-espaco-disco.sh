#!/bin/bash
# Autor: Ivan Moretto
# Data: 17/03/2015

# Sintaxe do comando: ./checa-espaco-disco.sh

rm /tmp/parte -f
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
if [ -e /tmp/parte ]
then
   /usr/bin/unix2dos /tmp/parte   # Converte para poder ser lido no Window$
   /etc/bin/email.sh "Espaco em disco "  "Espaco em Disco Critico" /tmp/parte
fi