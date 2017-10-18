{-# LANGUAGE FlexibleInstances, UndecidableInstances #-} 

module Aula7 where

data Carteira a = Nada
                | UmItem a
                | DoisItens a a deriving Show
                
-- FUNCAO PARCIAL: PERIGO! NAO HA DEFINICAO DA FUNCAO
-- NO PATTEN MATCHING NADA
mostrarPrimeiro :: Carteira a -> a
mostrarPrimeiro (UmItem x) = x
mostrarPrimeiro (DoisItens x _) = x

--data hiding

-- TYPE CLASS: IMPOEM RESTRICOES A TIPOS GENERICOS
-- VOCE SO CONSEGUIRA TRABALHAR COM AS FUNCOES DEFINIDAS NO TYPE CLASS 
-- O SHOW E UMA RESTRICAO
-- RESTRICAO SOMENTE EM FUNCOES POLIMORFICAS
--FUNCAO POLIMORFICA: FUNCAO QUE SERVE PRA QUALQUER COISA. EX > a -> a
mostrar :: Show a => Carteira a -> String
mostrar Nada = "Vazio..."
mostrar (UmItem x) = "Elemento: " ++ show x
mostrar (DoisItens x y) = "Elemento 1" ++ show x
                        ++ " => Elemento2: " ++ show y

data Moeda = Euro | Real | Dollar

-- se quisermos fazer uma implementacao de show:
-- diferente da proposta da linguagem, devemos:
-- a) Tirar o deriving
-- b) prover uma instancia

instance Show Moeda where
    Show Euro = "Que chique..."
    Show  Dollar = "Que legal..."
    Show Real = "Que ..."

instance Eq Moeda where
    Dollar == Euro =        True
    Dollar == Dollar =      True
    Euro == Euro =          True
    Real == Real =          True
    _ == _ =                False

--eq e uma restricao de kind 1
--Parenteses e restricao (so o carteira com kind 1 serve) visto que eq so funciona pra kind 1    
instance (Eq a) => Eq (Carteira a) where
    Nada == Nada = True
    (UmItem x) == (UmItem y) = x == y
    (DoisItens x1 x2) == (DoisItens y1 y2) = (x1 == y1 && x2 == y2) || (x2 == y1 && x1 == y2)
    _ == _ = False
    
-- identacao de 4 espacos
-- minimal complete definition
-- funcao parcial

-- Restricao de kind    
class SimNao a where
    simnao :: a -> Bool

{--
instance SimNao Int where
    simnao x
        | x > 0 = True
        | otherwise = False
--}

instance (Ord a, Monoid a) => SimNao a where
    | simnao x > mempty = True
    | otherwise = False
    

instance SimNao [a] where
    simnao [] = False
    simnao _ = True

instance SimNao Bool where
    {--
    simnao x = x
    --}
    simnao = id
    