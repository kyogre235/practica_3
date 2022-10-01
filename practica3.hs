--practica 3



--ejercicio 1
type EList a = [(a,a)] {- en esta linea le decimos que 
las listas que tengan "a" van a ser listas con pares -}


longP :: [a] -> Int 

longP [a] = 2 

longP (x:xs) = 2 + longP xs 

--ejercicio 2

 elemP:: (Eq a) => a -> [a] -> Bool

elemP a [] = False  
elemP a (x:xs) = if (a /= x ) 
    then elemP a xs 
    else True  


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



