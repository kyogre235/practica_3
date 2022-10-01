--practica 3



--ejercicio 1
type EList a = [(a,a)] {- en esta linea le decimos que 
las listas que tengan "a" van a ser listas con pares -}


longP :: [a] -> Int {- aqui le decimos que tiene que aceptar lista (de pares) 
 y me va a regresar un Int -}

longP [a] = 2 {-} aqui decimos que cuando la lista solo tiene un par, 
me regrese que tiene un valor de 2, pues en ese par hay 2 elementos -}

longP (x:xs) = 2 + longP xs {- aqui le decimos que cuando le entregamos 
una lista con cabeza y cola, cuente 2 y le sume el valor de la funcion 
longP de la cola (paso recursivo-}

--ejercicio 2

{- elemP:: (Eq a) => a -> [a] -> Bool

elemP a [] = False  
elemP a (x:xs) = if (a /= x ) 
    then elemP a xs 
    else True  -}


--ejercicio 3

consP :: a -> [a] -> [a]

consP a [] = [a]

consP a (x:xs) = a : consP x xs 



--ejercico 4
--appendP :: [a] -> [a] -> [a]








--ejercicio 5
snocP :: a -> [a] -> [a]

snocP a [] = [a]

snocP a (x:xs) = x : snocP a xs 






--ejercicio 6









--ejercicio 7









--ejercicio 8









--ejercicio 9









--ejercicio 10









--ejercicio 11









--ejercicio 12









--funciones auxiliares



