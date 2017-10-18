module Aula5 where

-- HIGH-ORDER FUNCTION: EH UMA FUNCAO QUE:
-- A) RECEBE VIA PARAMETRO UMA FUNCAO E/OU
-- B) RETORNA UMA FUNCAO

foo :: Int -> (Int -> Int) -> Int 
foo x f = x + f 1 

dobro :: Int -> Int
dobro x = 2*x

-- (\ x -> 2*x)

g:: (Int -> Int) -> Int -- caso a
g f = f 1 

h:: Int -> (Int -> Int) -- caso b
h x = \y -> x*y 

-- Currying eh passar menos argumentos
-- do que o esperado para uma funcao
-- se uma funcao espera 3 e voce passar 2 argumentos
--voce tera uma funcao que espera 1 parametro

somar :: Int -> Int -> Int -> Int
somar x y z = x+y+z

-- let f = somar 1 2
-- f 3 retorna 6
-- f = somar 1 2 = \z -> 1+2+z
-- f 3 = 1+2+3 = 6

-- map / fold / filter

-- map: joga uma funcao em uma lista de elementos
-- filter: filtra os elementos de uma lista de acordo com um predicado (a -> Bool)
-- foldl: imitam contadores e acumuladores (dobra até restar um valor)

tamanho :: String -> Int
--tamanho xs = length xs
--eta reducao
tamanho = length

ehPrimo :: Int -> Bool
ehPrimo n = filter (\x -> mod n x == 0) [1 .. n-1] == [1]
-- filter ehPrimo lista

-- foldl (\soma vi -> soma + vi) 0 [1 .. 10]
-- foldl (+) 0 [1 .. 10]
-- foldl (*) 1 [1 .. 10]

--map funcao lista lista_com_funcao
-- filter funcao_condicional lista condicao
-- foldl funcao inicial lista

fat :: Int -> Int
fat n = foldl (*) 1 [1 .. n]

--foldl (\cont _ -> cont+1) 0 "ABCDEFG" 

--($) IGUAL O MAP, MAS SEM LISTA
--CHAMA-SE APLICACAO DE FUNCOES
-- CIFRAO SUBSTITUI PARENTESES
-- DOBRO (5 + 5) É O MESMO QUE DOBRO $ 5 + 5

-- OPERADOR, OU FUNCAO INFIXA
infixl 0 |> 
(|>) :: a -> (a -> b) -> b
(|>) x f = f x

foo' :: Int -> Int
foo' n = n |> \x -> 2*x |> \y -> 3*y
foo' n = n |> \x -> 2*x |> \y -> y + x +1