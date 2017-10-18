module Aula10 where

-- Qual o kind? * -> *
-- Eh polimorfico? Sim.
-- Quantos VC? 1
-- Quantos campos tem o VC? 1
-- Qual o tipo do campo? a
data Id a = Id a deriving Show

instance Functor Id where
    fmap ab (Id a) = Id (ab a)

(|>) :: a -> (a -> b) -> b
(|>) x f = f x

-- Polimorfica? Sim, recebe um parâmetro variável
-- [a] == [] a
-- f :: Id a -> [a] 
-- TRANSFORMACAO NATURAL: EH UMA FUNCAO QUE "TROCA"
-- FUNTOR E NAO POSSUI RESTRICAO ALGUMA.
-- f :: Id -> []
-- TEM A FORMA GENERICA: 
-- f :: (Functor F, Functor G) => F a -> G a 
-- ONDE F eh uma instancia de Functor e G tb.
f :: Id a -> [] a 
f (Id x) = [x]

f' :: a -> [] a
f' x = [x]

-- F = Id, G = []
g :: a -> [] a 
g x = [x]

-- F = [], G = Id
h :: [] a -> Id a 
h xs = Id (head xs)

-- F = [], G = Maybe
h2 :: [] a -> Maybe a 
h2 [] = Nothing
h2 xs = Just (head xs)

--DEF MONOID
--UM MONADA (M) É UM FUNCTOR DE KIND 2 E DUAS TRANSFORMAÇÕES NATURAIS
-- MONADA (M, return, join) sobre 
-- uma categoria C (HASK) 
--TRANSFORMACAO NATURAL É UMA FUNCAO QUE TROCA O FUNCTOR

-- UMA MONADA SOBRE UMA CATEGORIA C (HASK) É A TRIPLA (M, return, join), onde
-- M É UM TIPO DE KIND *->* INSTANCIA DE FUCNTOR
--RETURN É UMA TRANSFORMACAO NATURAL DE TIPO return :: a -> M a (troca Id por m)
-- JOIN É UMA TRANSFORMACAO NATURAL DE TIPO join :: M (M a) -> M a (troca dois funtores por um funtor)
-- elementro neutro é o return
-- assossiativo é o return
-- def arrogante: uma monada na categoria C é apenas um monoid na categoria dos (endo)functores (ou só dos functores)
-- monada é um monoid de funtores

--BIND
-- (>>=) :: (Monad m) => m a -> (a -> m b) -> m b
-- (>>=)  x f = join (fmap f x)  -- fmap f x é mb
-- questao da p3 join em funcao do bind 