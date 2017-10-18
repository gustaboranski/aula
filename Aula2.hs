{-
sudo apt-get update
sudo apt-get install haskell-platform
ghci
--compilar 
:l 

--atualiza o modulo
:r

1) (:) coloca elemento na frente de uma lista
2) (++) concatena listas
3) (!!) pega elemento pelo indice
4) (let) da um apelido a uma lista
5) (\\) remove da lista (:m + Data.List)
6) (length) tamanho da lista
7) (reverse) reverte a lista
8) (head) primeira letra
9) (tail) todos os elementos menos o primeiro
----------------------------------------------------------------
List Comprehension 

São listas geradas a partir de expressões e filtros

[expr que depende de x, y, z (ou mais) | x <- lista1,
					 y <- lista2,
					 z <- lista3,
					 EXPR BOOL1 (somente booleano)
					 EXPR BOOL2

Exemplo: 

[x + 1] | x <- [1,8,7,6], X /= 6
resposta: [2,9,8]

[x | x <- [1..40], mod x 4 /= 0]

10) [0..200]
11) [0,2..200] 
12) [500,499.. -1]

tupla é um conjunto de dados com dimensão definida e vários tipos

sintaxe de função) fazNada x = (head x) : (tail x)

----------------------------------------------------------------

Tupla:

1) Elementos de tipos diferentes
2) O números de coordenadas é fixa
3) fst pega o primeiro de uma tupla com duas dimensões
3) snd pega o segundo de uma tupla com duas dimensões
4) (:t) pergunta o tipo
5) (fst) pega o primeiro da tupla (só funciona com dois dados)
6) (snd) pega o segundoda tupla (só funciona com dois dados)

lista de tupla

[(val, naipe) | val <- "A234567890QJK", naipe <- ["PAUS", "COPAS", "ESPADAS", "OUROS"]]

-}