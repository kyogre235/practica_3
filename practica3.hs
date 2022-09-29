--practica 3

type EList a = [(a,a)] {- en esta linea le decimos que 
 las listas que tengan "a" van a ser listas con pares -}


longP :: [a] -> Int {- aqui le decimos que tiene que aceptar lista (de pares) 
 y me va a regresar un Int -}

longP [a] = 2 {-} aqui decimos que cuando la lista solo tiene un par, 
me regrese que tiene un valor de 2, pues en ese par hay 2 elementos -}

longP (x:xs) = 2 + longP xs {- aqui le decimos que cuando le entregamos 
una lista con cabeza y cola, cuente 2 y le sume el valor de la funcion 
longP de la cola (paso recursivo-}
