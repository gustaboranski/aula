module Teste where
import Data.Monoid

data Coisa a = UmaCoisa a | DuasCoisas a a | Nada deriving Show

instance Monoid a => Monoid (Coisa a) where
    mempty = Nada
    mappend Nada x = x
    mappend x Nada = x
    mappend (UmaCoisa a) (UmaCoisa b) = UmaCoisa (a<>b)
    mappend (DuasCoisas a1 b1) (DuasCoisas a2 b2) = DuasCoisas (a1<>a2) (b1<>b2)