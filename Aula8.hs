{-# LANGUAGE FlexibleInstances, UndecidableInstances #-} 
module Aula8 where
-- MONOIDS (DATA.MONOID)
--AXIOMA É UMA VERDADE, QUE NAO PRECISO PROVAR
--MAPPEND = (<>)
--DEF: UM TIPO M E UMA OPERACAO BINARIA
--(<>) :: M -> M -> M
-- SATISFAZENDO: 
-- AXIOMA DO ELEMENTO NEUTRO 
-- A) ELEMENTO NEUTRO: EXISTE ELEMENTONEUTRO :: M (MEMPTY) TAL QUE
-- A <> E = A
-- E <> A = A

--ASSOCIATIVIDADE
--B) PARA CADA A,B,C :: M
-- (A <> B) <> C = A <> (B <> C)

import Data.Monoid

data And = And Bool deriving Show

instance Monoid And where
    mempty = And True
    mappend (And x) (And y) = And (x && y)
    -- mappend (And True)(And True) = And True
    
data Carteira a = Nada
                | UmItem a 
                | DoisItens a a deriving Show

instance Monoid a => Monoid (Carteira a) where
    mempty = Nada
    mappend (UmItem x) (UmItem y) = UmItem (x <> y)
    mappend Nada x = x
    mappend x Nada = x
    
-- ab é sempre uma funcao que troca a por b
-- fmap :: (a -> b) -> Carteira a -> Carteira b
instance Functor Carteira where
    fmap ab Nada = Nada
    fmap ab (UmItem a) = UmItem (ab a)
    fmap ab (DoisItens a1 a2) = DoisItens (ab a1) (ab a2)
    
-- functor Maybe
-- data Maybe a = Nothing | Just a
-- instance Functor Maybe where
--      fmap ab Nothing = Nothing
--      fmap ab (Just a) = Just (ab a)

-- Maybe conserta funcoes parciais
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead xs = Just (head xs)
    