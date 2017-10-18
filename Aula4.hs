module Aula4 where
    
data Correncia = Euro | Dollar | Real | Bitcoin deriving Show

--Record Syntax é o ato de se nomear os campos de um value constructors
--Nome dos campos se comportam como getters
--Esses nomes também são chamados de funções de projeção
data Dinheiro = Dinheiro { valor :: Double,
                                    curr:: Correncia }
{-| Moeda Double Correncia | Nada -} deriving Show

{- data Dinheiro = Dinheiro { valor :: Double, curr:: Correncia } | Moeda Double Correncia | Nada deriving Show -}

converterReal :: Dinheiro -> Dinheiro
converterReal (Dinheiro x Dollar) = Dinheiro (3.14*x) Real
converterReal (Dinheiro x Euro) = Dinheiro (3.71*x) Real
converterReal (Dinheiro x Bitcoin) = Dinheiro (13000*x) Real
-- só usa underline se não usa retorno
-- x nesse caso é dinheiro, e não valor
converterReal x = x

-- Faça uma funcao para dobrar um dinheiro

dobrarDinheiro :: Dinheiro -> Dinheiro
dobrarDinheiro (Dinheiro x y) = Dinheiro (2*x) y
--Pattern Matching só se tiver condicional

somarDinheiroReal :: Dinheiro -> Dinheiro -> Dinheiro

--somarDinheiroReal (Dinheiro x y) dinheiro = Dinheiro ( x+ valor (converterReal(dinheiro)) ) y
somarDinheiroReal dinheiro1 dinheiro2 = Dinheiro ( valor (converterReal dinheiro2) + valor (converterReal dinheiro2) ) Real

--lambda
--let dobro = (2*)