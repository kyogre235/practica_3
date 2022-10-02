--practica 3



--ejercicio 1
type EList a = [(a,a)] {- en esta linea le decimos que 
las listas que tengan "a" van a ser listas con pares -}


longP :: EList a -> Int {- aqui le decimos que tiene que aceptar lista (de pares) 
 y me va a regresar un Int -}

longP [(x, y)] = 2 {- aqui decimos que cuando la lista solo tiene un par, 
me regrese que tiene un valor de 2, pues en ese par hay 2 elementos -}

longP ((x, y):xs) = 2 + longP xs {- aqui le decimos que cuando le entregamos 
una lista con cabeza y cola, cuente 2 y le sume el valor de la funcion 
longP de la cola (paso recursivo-}

--ejercicio 2
elemP ::(Eq a) => a -> EList a -> Bool
elemP e [] = False

elemP e ((x,y):xs) = if ((evaluar e [(x,y)]) == True) 
                    then True
                    else elemP e xs 
                    


--ejercicio 3

consP :: EList a -> EList a -> EList a

consP [(x,y)] [] = [(x, y)]

consP [(a,b)] ((x,y):xs) = (a,b) : consP [(x,y)] xs 



--ejercico 4
appendP :: EList a -> EList a -> EList a

appendP [] ((x,y):xs) = ((x,y):xs)

appendP ((x,y):xs) ((a,b):ys) = (x,y) : appendP xs ((a,b):ys)




--ejercicio 5
snocP :: EList a -> EList a -> EList a

snocP [(x,y)] [] = [(x, y)]

snocP [(a,b)] ((x,y):xs) = (x,y) : snocP [(a,b)] xs  




--ejercicio 6

atP:: EList a -> Int -> a
atP [] n = error "no hay elementos"
atP ((x,y):xs) 1 = x 
atP ((x,y):xs) 2 = y
atP ((x,y):xs) n = if (n>2) 
                    then atP xs (n-2)
                    else atP ((x,y):xs) n
--ejercicio 7

--updateP:: EList a -> Int -> e -> EList a
updateP [] n e = error "no hay elementos"
updateP ((x,y):xs) 1 e = ((e,y):xs)
updateP ((x,y):xs) 2 e = ((x,e):xs)
updateP ((x,y):xs) n e = if (n>2) 
                    then (x,y) : updateP xs (n-2) e
                    else updateP ((x,y):xs) n e


--ejercicio 8

aplanarP :: EList a -> [a]

aplanarP [] = []
aplanarP ((x,y):xs) = x : y : aplanarP xs




--ejercicio 9

toEl :: [a] -> EList a 

toEl [] = []
toEl [x] = []
toEl (x:y:xs) = (x,y): toEl xs



--ejercicio 10
dropP :: Int -> EList a -> EList a
dropP n []  = error "no hay elementos"
dropP 1 ((x,y):xs)  = error "el numero no es par" 
dropP 2 ((x,y):xs)  = xs
dropP n ((x,y):xs)  = if (n>2) 
                    then dropP (n-2) xs 
                    else dropP  n ((x,y):xs) 


--ejercicio 11

dropN :: Int -> EList a -> [a]
dropN n []  = error "no hay elementos"
dropN 1 ((x,y):xs)  = y: aplanarP xs
dropN 2 ((x,y):xs)  = aplanarP xs
dropN n ((x,y):xs)  = if (n>2) 
                    then dropN (n-2) xs 
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
takeN 1 ((x,y):xs)  = [x]
takeN 2 ((x,y):xs)  = aplanarP [(x,y)]
takeN n ((x,y):xs)  = if (n>2) 
                    then x : y : takeN (n-2) xs 
                    else takeN  n ((x,y):xs) 


--ejercicio 14
reversaP :: EList a -> EList a 
reversaP [] = []
reversaP ((x, y):xs) = reversaP xs ++ [(x,y)]






--funcion myMap

--myMap :: (c -> b) -> EList a -> EList a

myMap f [] = []
myMap f [(x,y)] = [(f(x),f(y))]
myMap f ((x,y):xs) = myMap f [(x,y)] ++ myMap f (xs)



--fucniones auxiliares

evaluar ::(Eq a) => a -> EList a -> Bool

evaluar e [(x,y)] =  if (e == x) 
                    then True 
                    else if (e == y) then True else False


