# Shell Scripting 

Os _scripts_ são muito utilizados quando temos uma tarefa que precisa ser executada várias vezes ao invés de digitarmos os mesmos comandos a cada vez. Podemos consolidar em um script e somente executarmos esse script, proporcionando uma automação de tarefas.

A pimeira linha do script, __*#!/bin/bash*__, tem como finalidade inicidar qual será o interpretador dos comandos presentes no script.


##  Pegando parâmetros passados pelo usuário

Para que seja possível pegar o conteúdo do **primeiro parâmetro** devemos referenciá-lo com o número `1` no nosso script, sendo precedido do símbolo `$` ficando `$1`

```
        #1 /bin/bash

        convert ~/Pictures/$1.jpg ~/Pictures/$1.png
```

## Utilizando laço de repetição

O símbolo `$@` é utilizado para referenciar todos os parâmetros passados por um usuário para nosso script, sem que seja necessário conhecer a quantidade de parâmetros que serão passados.

```
        #! /bin/bash

        CAMINHO_IMAGENS=~/Pictures

        for imagem in $@
        do
                convert $CAMINHO_IMAGENS/$imagem.jpg $CAMINHO_IMAGENS/$imagem.png
        done
```   

Ao criar um laço de repetição estamos pegando cada parâmetro passado pelo usuário e armazenando na variável, enquanto tivermos um parâmetro na variável a linha de conversão será executada.

##  Convertendo automaticamente todos os arquivos


    ```
    #! /bin/bash

    cd ~/Pictures/pets

    if [ ! -d png ]
    then 
            mkdir png
    fi


    for imagem in *.jpg
    do
            imagem_sem_extensao=$(ls $imagem| awk -F. '{ print $1 }')
            convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
    done
    ```

## Variaveis

As variáveis são por padrão globais podendo assim ser acessadas em qualquer trecho do nosso script, mesmo que ela se encontre dentro de uma função. 

        ```
        converte(){
        imagem="minha_imagem.jpg"
        }

        converte
        echo $imagem
        ```
Dessa forma, ao colocar o comando echo $imagem fora do escopo da função, teremos a impressão do conteúdo da variável imagem que é minha_imagem.jpg

Para criar uma variável é muito usamo a sintaxe `$variavel` exemplo OLA="OLÁ,MUNDO"

o comando `env` retorna as variáveis de ambiente do sistema



## Função 

para declarar uma função usamos a estrutur:

```
    nome_da_funcao(){

         # codigo executado pela função
    }

    nome_da_funcao # invocação  da função
    
```

### Redirecionando mensagens de erro

Os descritores de arquivos são indicadores utilizados para acessar um arquivo ou fluxos padrões como entrada, saída, e mensagens de erros. Esses fluxos padrões de entrada, saída e mensagens de erro podem ser acessados pelos descritores 0,1 e 2 respectivamente.

```
        #! /bin/bash

        # criação da função

        converte_imagem(){
                cd ~/Pictures/prets

                if [ ! -d pet_png ]
                then 
                        mkdir pets_png
                fi

                for imagem in *.jpg
                do
                        imagem_sem_extensao=$(ls $imagem| awk -F. '{ print $1 }')
                        convert $imagem_sem_extensao.jpg pets_png/$imagem_sem_extensao.png
                done
        }
```

Após a criação da função é necesário chamá-la. Utilizamos para isso o nome da função criada.

```
        converte_imagem 2>erros.txt
```

Precisamos verificar o status de saída da execução dessa função
* 0 significa que a execução ocorreu com sucesso; 
* se diferente de zero houve problema na execução.

```
        if [ $? -eq 0 ]
        then
                echo "Conversão realizada com sucesso"
        else
                echo "Houve uma falha no processo de conversão"
        fi

```
###  Listando os processos do sistema

Veja que com o comando `ps -e -o pid --sort -size`, estamos filtrando todos os identificadores dos processos com ordenação de alocação de memória decrescente, ou seja, os processos com maior alocação de memória são listados antes.

Precisamos dos 10 primeiros processos com maior quantidade de memória alocada, isso faz com que redirecionemos a saída para o `head`, porém o head traz por padrão as 10 primeiras linhas e a primeira linha é o cabeçalho PID, o que nós precisamos então é trazer 11 linhas, totalizando assim a primeira linha com o nome do cabeçalho PID e as outras 10 linhas com os números dos processos.

Para finalizar, devemos ter somente os números dos processos, então redirecionamos essa saída para o `grep` para que tenhamos somente os números sem o cabeçalho PID.

## Fazendo divisão

`echo 1000/10`

O comando `echo` irá imprimir o argumento que foi passado, no caso, nosso argumento é 1000/10, então a impressão que teremos será desse dado.

Poderemos utilizar a ferramenta `bc` pra realizar a divisão no terminal.


 ## executar o comando 

 sh <script>
 bash <script>

 alterar o script para executável = `chmod +x <script>`

 ## comentário 

 \# 

 blocos de comentário
    o nomes do bloco do comentário não pode aparecer entre outro local do script e deve ser declarado em caixa alta

 :<<'NOME'
mimi
mimi
mimi
 NOME

 # Date

 Exemplo
echo -n $(date +%F,%H:%M:%S,)
 date +%F,%H:%M:%S


 
Cursos - https://www.youtube.com/watch?v=ScIwlstkbSA

Conceitos - https://www.youtube.com/watch?v=vvp25pEgSb4 

O Primeiro script - https://www.youtube.com/watch?v=2_V-lr6w1uE

Variávei e Arrays - https://www.youtube.com/watch?v=HTc2TTnfuNc 

Funções - https://www.youtube.com/watch?v=RTeV2UsXY1k 