module Aula3 where

dobro :: Double -> Double
dobro x = 2*x

somar:: Int -> Int -> Int -> Int
somar x y z = x+y+z

f :: String -> Int
f ls = 1 + length ls

maiorQue :: Int -> Int -> Bool
maiorQue x n = x > n

--tipo de enumeração (nome gourmet para inteiro, cada um tem um valor)
--conjunto finito de valores
--java enum
-- é enumeração por ser separado por ou ( | )
-- NOME DO tIPO, TIPO OU (DATA CONSTRUCTOR)
-- VALOR OU VALUE (VALUE CONSTRUCTOR)
-- Show exibe
-- Eq faz igualdae
-- Enum só funciona em enumeração
-- Enum transforma em lista
data Dia = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado deriving (Enum, Eq, Show)


--Pattern Matching: Desconstroi um tipo
-- Fazendo com que seja revelada sua estrutura interna
-- No nosso caso, foi revelado os value constructors
agenda :: Dia -> String
agenda Segunda = "Dia de cinema"
agenda Quarta = "Dia de futebol"
agenda Quinta = "Dia de praça e Nossa"
agenda Sexta = "Dia de maldade"
agenda Sabado = "Dia de balada 10/10 topster"
agenda _ = "Dia de nao fazer nada"

--Ex1 - Aula3
intDia :: Dia -> Int
intDia Segunda = 1
intDia Terca = 2
intDia Quarta = 3
intDia Quinta = 4
intDia Sexta = 5
intDia Sabado = 6
intDia Domingo = 7

--Ex2 - Aula3
data Day = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday deriving (Enum, Eq, Show)

traduzirPI :: Dia -> Day
traduzirPI Domingo = Sunday
traduzirPI Segunda = Monday
traduzirPI Terca = Tuesday
traduzirPI Quarta = Wednesday
traduzirPI Quinta = Thursday
traduzirPI Sexta = Friday
traduzirPI Sabado = Saturday

--enumeração tem value constructors sem campo
--tipo enumeração também chmado de tipo soma
data Curso = ADS | SI | GE | GP | LOG deriving Show

--value construtor chamado de tipo multiplicacao
--tupla é geral, e esse é tem um value constructor
--diferença é semantica
data Aluno = Aluno String Int Curso deriving Show

aniversario :: Aluno -> Aluno
aniversario (Aluno nome idade curso) = Aluno nome (idade+1) curso 

data Naipe = Ouros | Espadas | Copas | Paus deriving (Enum, Show)

data Valor = As | Dois | Tres | Quatro | Cinco | Seis | Sete | Oito | Nove | Dez | Valete | Dama | Rei deriving (Enum,Show)

--só um value constructor e dois campos
data Carta = Carta Valor Naipe deriving Show

--let cartas = [(Carta valor naipe) | valor <- [As .. Rei] , naipe <- [Ouros .. Paus]]
--faça uma funcao que receba uma carta e retorne se ela é preta ou vermelha

data CoresCarta = Vermelha | Preta deriving (Enum, Show)

corDaCarta :: Carta -> CoresCarta
corDaCarta (Carta _ Ouros) = Vermelha
corDaCarta (Carta _ Copas) = Vermelha
corDaCarta (Carta _ Paus) = Preta
corDaCarta (Carta _ Espadas) = Preta