module Apres where

--3.13
data Metros = Metros Int Double | MetragemInvalida deriving Show

areaQuadrado :: Metros -> Metros
areaQuadrado (Metros 1 x) = Metros 2 (x*x)
areaQuadrado (Metros 2 x) = Metros 2 x
areaQuadrado (Metros _ 0) = MetragemInvalida
areaQuadrado (Metros _ _) = MetragemInvalida
--areaQuadrado (Metros 3 x) = Metros 2 (x/6)

areaRet :: Metros -> Metros -> Metros
areaRet (Metros 1 x)    (Metros 1 y)    = Metros 2 (x*y)
areaRet (Metros _ _)    (Metros _ _)    = MetragemInvalida
areaRet (Metros _ 0)    _               = MetragemInvalida
areaRet _               (Metros _ 0)    = MetragemInvalida

areaCubo :: Metros -> Metros
areaCubo (Metros 1 x) = Metros 3 (x*x*6)
areaCubo (Metros 2 x) = Metros 3 (x*6)
areaCubo (Metros 3 x) = Metros 3 x
areaCubo (Metros _ 0) = MetragemInvalida
areaCubo (Metros _ _) = MetragemInvalida
--

--3.6

data Mes = Janeiro | Fevereiro | Marco | Abril | Maio | Junho | Julho | Agosto| Setembro | Outubro | Novembro | Dezembro deriving (Enum,Show)

data FimMes = VinteOito | Trinta | TrintaeUm deriving Show

data Estacao = Primavera | Verao | Outono | Inverno deriving Show

data Hemisferio = Norte | Sul

checaFim :: Mes -> FimMes
checaFim Fevereiro  = VinteOito
checaFim Abril      = Trinta
checaFim Junho      = Trinta
checaFim Setembro   = Trinta
checaFim Novembro   = Trinta
checaFim _          = TrintaeUm

prox :: Mes -> Mes
prox    Dezembro   = Janeiro
prox    x          = succ x

estacao :: Mes -> Hemisferio -> Estacao
estacao Janeiro     Norte   =   Inverno
estacao Janeiro     Sul     =   Verao
estacao Fevereiro   Norte   =   Inverno
estacao Fevereiro   Sul     =   Verao
estacao Marco       Norte   =   Primavera
estacao Marco       Sul     =   Outono
estacao Abril       Norte   =   Primavera
estacao Abril       Sul     =   Outono
estacao Maio        Norte   =   Primavera
estacao Maio        Sul     =   Outono
estacao Junho       Norte   =   Verao
estacao Junho       Sul     =   Inverno
estacao Julho       Norte   =   Verao
estacao Julho       Sul     =   Inverno
estacao Agosto      Norte   =   Verao
estacao Agosto      Sul     =   Inverno
estacao Setembro    Norte   =   Outono
estacao Setembro    Sul     =   Primavera
estacao Outubro     Norte   =   Outono
estacao Outubro     Sul     =   Primavera
estacao Novembro    Norte   =   Outono
estacao Novembro    Sul     =   Primavera
estacao Dezembro    Norte   =   Inverno
estacao Dezembro    Sul     =   Verao
--

-- 3.1

data Pergunta = Sim | Nao deriving Show

pergNum :: Pergunta -> Int
pergNum Sim = 1
pergNum Nao = 0

listPergs :: [Pergunta] -> [Int]
listPergs x = [ pergNum y | y <- x]

and' :: Pergunta -> Pergunta -> Pergunta
and' Sim    Sim     = Sim
and' _      _       = Nao

or' :: Pergunta -> Pergunta -> Pergunta
or' Nao     Nao = Nao
or' _       _    = Sim

not' :: Pergunta -> Pergunta
not' Sim = Nao
not' Nao = Sim
--

-- ex Diego
pergToBool:: Pergunta -> Bool 
pergToBool Sim = True
pergToBool Nao = False

and'':: Pergunta -> Pergunta -> Bool 
and'' x y = and [pergToBool x, pergToBool y]

--4. or’: Idem acima, porém, deve ser usado o ou lógico.
or'':: Pergunta -> Pergunta -> Bool 
or'' x y = or [pergToBool x ,pergToBool y]

--5. not’: Idem aos anteriores, porém, usando o not lógico.
not'':: Pergunta -> Bool 
not''  x = not (pergToBool x)
--