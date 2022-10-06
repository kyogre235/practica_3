--practica 3

{-Jacome Delgado Alejandro
Jiménez Sánchez Emma Alicia

Esta mejor explicado en el readme .
-}

type EList a = [(a,a)] {- en esta linea le decimos que las listas que tengan "a" van a ser listas con pares -}

--ejercicio 1

longP :: EList a -> Int {- aqui le decimos que tiene que aceptar lista (de pares)  y me va a regresar un Int -}

longP [(x, y)] = 2 {- aqui decimos que cuando la lista solo tiene un par, me regrese que tiene un valor de 2, 
pues en ese par hay 2 elementos -}

longP ((x, y):xs) = 2 + longP xs {- aqui le decimos que cuando le entregamos una lista con cabeza y cola, cuente 2 
y le sume el valor de la funcion longP de la cola (paso recursivo-}

--ejercicio 2
elemP ::(Eq a) => a -> EList a -> Bool
elemP e [] = False --Caso Base
elemP e ((x,y):xs) = if ((evaluar e [(x,y)]) == True) 
                    then True
                    else elemP e xs --Caso Recursivo

--fucnión auxiliar para el ejercicio 2
evaluar ::(Eq a) => a -> EList a -> Bool
evaluar e [(x,y)] =  if (e == x)
                    then True
                    else if (e == y) then True else False
                    
--ejercicio 3

consP :: (a,a) -> EList a -> EList a
consP (x,y) [] = [(x, y)] --Caso Base
consP (a,b) ((x,y):xs) = (a,b) : consP (x,y) xs  --Caso Recursivo


--ejercico 4
appendP :: EList a -> EList a -> EList a
appendP [] ((x,y):xs) = ((x,y):xs) --Caso Base
appendP ((x,y):xs) ((a,b):ys) = (x,y) : appendP xs ((a,b):ys) --Caso Recursivo

--ejercicio 5
snocP :: (a,a) -> EList a -> EList a
snocP (x,y) [] = [(x, y)] --Caso Base
snocP (a,b) ((x,y):xs) = (x,y) : snocP (a,b) xs  --Caso Recursivo


--ejercicio 6
atP:: EList a -> Int -> a
atP [] n = error "no hay elementos"
atP ((x,y):xs) 1 = x --Primer Caso Base
atP ((x,y):xs) 2 = y --Segundo Caso Base
atP ((x,y):xs) n = if (n>2)  
                    then atP xs (n-2) --Caso Recursivo
                    else atP ((x,y):xs) n 


--ejercicio 7
updateP :: (Num n, Ord n) => EList a -> n -> a -> EList a
--updateP :: Elist a -> Int -> a -> Elist a
updateP [] n e = error "no hay elementos"
updateP ((x,y):xs) 1 e = ((e,y):xs)
updateP ((x,y):xs) 2 e = ((x,e):xs)
updateP ((x,y):xs) n e = if (n>2) 
                    then (x,y) : updateP xs (n-2) e
                    else updateP ((x,y):xs) n e

--ejercicio 8

aplanarP :: EList a -> [a]
aplanarP [] = [] --Caso Base
aplanarP ((x,y):xs) = x : y : aplanarP xs --Caso Recursivo

--ejercicio 9

toEl :: [a] -> EList a 

toEl [] = [] --Primer Caso Base
toEl [x] = [] --Segundo Caso Base
toEl (x:y:xs) = (x,y): toEl xs --Caso Recursivo

--ejercicio 10
dropP :: Int -> EList a -> EList a
dropP n []  = error "no hay elementos"
dropP 1 ((x,y):xs)  = error "el numero no es par" --Primer Caso Base
dropP 2 ((x,y):xs)  = xs --Segundo Caso Base
dropP n ((x,y):xs)  = if (n>2) 
                    then dropP (n-2) xs --Caso Recursivo
                    else dropP  n ((x,y):xs) 

--ejercicio 11

dropN :: Int -> EList a -> [a]
dropN n []  = error "no hay elementos"
dropN 1 ((x,y):xs)  = y: aplanarP xs --Primer Caso Base
dropN 2 ((x,y):xs)  = aplanarP xs --Segundo Caso Base
dropN n ((x,y):xs)  = if (n>2) 
                    then dropN (n-2) xs  --Caso Recursivo
                    else dropN  n ((x,y):xs) 

--ejercicio 12
takeP :: Int -> EList a -> EList a
takeP n []  = error "no hay elementos"
takeP 1 ((x,y):xs)  = error "numero no valido"
takeP 2 ((x,y):xs)  = [(x,y)]
takeP n ((x,y):xs)  = if (n>2) 
                    then (x,y): takeP (n-2) xs 
                    else takeP  n ((x,y):xs) 

--ejercicio 13
takeN :: Int -> EList a -> [a]
takeN n []  = error "no hay elementos"
takeN 1 ((x,y):xs)  = [x] --Primer Caso Base
takeN 2 ((x,y):xs)  = aplanarP [(x,y)] --Segundo Caso Base
takeN n ((x,y):xs)  = if (n>2) 
                    then x : y : takeN (n-2) xs --Caso Recursivo
                    else takeN  n ((x,y):xs) 

--ejercicio 14
reversaP :: EList a -> EList a 
reversaP [] = [] --Caso Base
reversaP ((x, y):xs) = reversaP xs ++ [(y,x)] --Caso Recursivo

--funcion myMap

myMap :: (a -> b) -> EList a -> EList b
myMap f [] = []--Primer Caso Base
myMap f [(x,y)] = [(f(x),f(y))]--Segundo Caso Base
myMap f ((x,y):xs) = myMap f [(x,y)] ++ myMap f (xs) --Caso Recursivo
