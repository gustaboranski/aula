module Aula6 where

data Status = Magro | Gordo | Saudavel deriving Show

fat:: Int -> Int
fat 0 = 1
fat n
    | n<=1=1
    | otherwise = n*fat(n-1)
    
modulo :: Double -> Double

modulo x
       |x > 0 = x
       |otherwise = -x
       
       
elimvogal :: String -> String
elimvogal [] = []
elimvogal (x:xs)
    |elem x "AEIOUaeiou" = elimvogal xs
    |otherwise = x : elimvogal xs
    
imc :: Double -> Double -> Status
imc peso altura
    | peso/(altura*altura) <= 18 = Magro
    | peso/(altura*altura) <= 25 = Saudavel
    | otherwise = Gordo
    where
        z = peso/(altura*altura)

-- :kind

    --- Tipo Polimórfico (polimorfismo paramétrico)
--data Bolsa a = Nada | UmItem a | DoisItens a a deriving Show
-- kind aumenta a cada parametro
data Bolsa a b = Nada | UmItem a | DoisItens a b deriving Show


-- Aula Exclusiva

--phantom type / tipo fantasma / ghost typing
data Metros a = Metros Double deriving Show

data Um
data Dois

areaQuadrado :: Metros Um -> Metros Dois
areaQuadrado (Metros m) = Metros (m*m)

--areaQuadrado :: Metros -> Metros
--areaQuadrado (Metros 1 m) = (Metros 2 (m*m))
--areaQuadrado _ = MetragemInvalida

-- Aula Exclusiva