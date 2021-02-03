#!/bin/bash
# Autor: Andressa Idalgo 
# Data: 08/06/2020

# for imagem in $@
#     do
#        imagem=$@
#        echo $imagem
#         #convert $CAMINHO_IMAGENS/$imagem.jpg $CAMINHO_IMAGENS/$imagem.png
#     done


# if [ $# -lt 1 ]; then
#    echo "Faltou utilizar pelo menos um argumento!"
#    exit 1
# fi
 
# echo "Numero de argumentos: $#"
 
# COUNT=0
# for ARG in $*; do
#    COUNT=`expr $COUNT + 1`
#    echo "Argumento $COUNT: $ARG"

#     if [ "a" == "a" ]; then echo hi; fi

#     if ['$ARG' == "Malu"] ; then
#         echo "Mamu Maluca barbudinha"
#         exit 1
#     fi

# done    

#!/bin/sh

# Cria tag para as imagens
BUILD_TAG=$(date "+%Y-%m-%d_%H-%M")
echo "Build tag: $BUILD_TAG"

# Atualiza o valor da tag no arquivo .env
echo "BUILD_TAG=$BUILD_TAG" >.env

echo "Informe o componente que deseja fazer deploy:"
echo "business | front | general"

 
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	business)
        
		echo "Inicio deploy Business Rules!"
        docker.exe build --no-cache -f ./node_oracle.dockerfile -t node_oracle:$BUILD_TAG .
        echo "--------- DOCKER COMPOSE "
        docker-compose up -d --no-deps --build business-rules
        
		;;
	front)
		echo "Inicio deploy Front!"
        echo "Hello yourself!"
		;;
    general)
		echo "Inicio deploy General Session!"
        echo "See you again!"
		break
		;;
	*)
		echo "Sorry, I don't understand"
		;;
  esac
done
echo 
echo "That's all folks!"