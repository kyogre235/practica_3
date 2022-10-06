--practica 3

Integrantes del equipo:
Jacome Delgado Alejandro
Jimenez Sanchez Emma Alicia

En esta linea le decimos que las listas que tengan "a" van a ser listas con pares.
type EList a = [(a,a)]

Ejercicio 1
En la firma decimos que tiene que aceptar lista de duplas y me va a regresar un Int, que va a ser el tamaño de la lista.

longP :: EList a -> Int

En el caso base decimos que cuando la lista solo tiene una duplas, me regrese que tiene un valor de 2, pues en esa duplas hay solamente 2 elementos.

longP [(x, y)] = 2 

En el caso recursivo decimos que cuando le entregamos una lista con cabeza y cola, cuente 2 y le sume el valor de la función longP de la cola (paso recursivo).

longP ((x, y):xs) = 2 + longP xs

--ejercicio 2
En la firma decimos que tiene introducir un elemento a comparar y una lista de duplas y me va a regresar un Bool, que va a ser el estado de verdadero o falso segun sea el caso a comparar.

elemP ::(Eq a) => a -> EList a -> Bool

El caso base es si se quiere comparar un número e con una lista vacía nos va a dar que es falso, ya que no se esta comparando nada.

elemP e [] = False

En el caso recursivo decimos que cuando le entregamos un número e y una lista con cabeza y cola, va a comparar si ese número esta en la primera lista de duplas. Para esta función se tiene que ocupar una función auxiliar para poder evaluar una duplas y luego un conjunto de estas en una lista.

elemP e ((x,y):xs) = if ((evaluar e [(x,y)]) == True) 
                    then True
                    else elemP e xs 
                    
Función Auxiliar del ejercicio 2

En esta función tenemos la misma firma que elemP.        

evaluar ::(Eq a) => a -> EList a -> Bool

En el if esta se esta evaluando que cuando entra un número cualquiera para poder comparar con una duplas, si el número es igual al primer elemento o al segundo elemento entonces es verdadero sino sería falso que ese número pertenece.

evaluar e [(x,y)] =  if (e == x) 
                    then True 
                    else if (e == y) then True else False
                    


--ejercicio 3

En la firma decimos que tiene introducir una dupla, la que se desea agregar en otra lista de duplas y va a regresar una lista de duplas.

consP :: (a,a) -> EList a -> EList a

En el caso base de consP, se ingresa una dupla y si se une a otra lista que es vacía nos va a regresar esa misma dupla.

consP (x,y) [] = (x, y)

En el caso recursivo, se ingresa una dupla (a,b) y una lista de duplas, la primera dupla ingresada (a,b) se va agregar primero en la lista de duplas y va a formar una nueva lista de duplas.

consP (a,b) ((x,y):xs) = (a,b) : consP (x,y) xs 

--ejercico 4
En la firma decimos que tiene introducir dos listas de duplas deseadas para concatenar, y va a regresar una lista de duplas con las listas anteriores unidas.

appendP :: EList a -> EList a -> EList a

En el caso base si deseamos concatenar una lista vacía a una lista de duplas, va a regresar la lista de duplas.

appendP [] ((x,y):xs) = ((x,y):xs)

En el caso recursivo, ingresamos las dos listas duplas, donde primero se tiene que mostrar la cabeza de la primera lista ingresada y después se sigue evaluando las demás listas de pares (paso recursivo).

appendP ((x,y):xs) ((a,b):ys) = (x,y) : appendP xs ((a,b):ys)


--ejercicio 5
En la firma decimos que tiene introducir una dupla, la cual se va a agregar a otra lista de duplas y va a regresar una lista de duplas.

snocP :: (a,a) -> EList a -> EList a

En el caso base, si se desea agregar una dupla a una lista vacía va a regresar esa misma dupla.

snocP (x,y) [] = (x, y)

En el caso recursivo, ingresa una dupla a agregar al último de una lista de duplas, para eso se debe mencionar que la cabeza de la lista de duplas ingresada, va a tener que ir primero y después evaluar las demás duplas de listas hasta llegar al caso caso.

snocP (a,b) ((x,y):xs) = (x,y) : snocP (a,b) xs  


--ejercicio 6
En la firma decimos que tiene introducir una lista de duplas de lista, después ingresar un número entero y va a regresar el elemento a.

atP:: EList a -> Int -> a

En el primer caso si se desea sacar el índice a una lista vacía va a marcar un error

atP [] n = error "no hay elementos"

En el caso base, deseamos saber cuál es el primer elemento de nuestra lista de duplas, sería la cabeza de la primera dupla y si es el segundo elemento sería la cola de la primera dupla.

atP ((x,y):xs) 1 = x 
atP ((x,y):xs) 2 = y

En el caso recursivo, si deseamos sacar otro número que no sean el primero o segundo, se tendría que verificar si la n es mayor a dos y si lo es, se tiene que evaluar lo demás de la lista de duplas y le restamos n-2 para poder ir recorriendo la lista hasta que quede en los casos base.

atP ((x,y):xs) n = if (n>2) 
                    then atP xs (n-2)
                    else atP ((x,y):xs) n
--ejercicio 7

En la firma la variable e es de una instancia de la clase de tipo numérico y es un tipo que poseé un orden. Se ingresa una lista de duplas, un número , el elemento a cambiar y regresa una lista de duplas

updateP :: (Num e, Ord e) => EList a -> e -> a -> EList a

Si se quiere actualizar una lista vacía va a marcar error porque no hay elementos que actualizar.

updateP [] n e = error "no hay elementos"

En el caso base, si en la lista de duplas queremos actualizar el primer elemento entonces se cambiaría el primer elemento por el que le indicamos que cambie, pasa los mismo con el segundo elemento. 

updateP ((x,y):xs) 1 e = ((e,y):xs)
updateP ((x,y):xs) 2 e = ((x,e):xs)

En el caso recursivo, si n es mayor a dos, entonces significa que no se quiere actualizar los primeros dos elementos, sino los que van después, se evaluá los demás elementos de las duplas y se va a restar 2 a la n para que se vaya recorriendo en la lista para checar que elemento es el que va a ser actualizado, y los demás se van a ir guardando.

updateP ((x,y):xs) n e = if (n>2) 
                    then (x,y) : updateP xs (n-2) e
                    else updateP ((x,y):xs) n e


--ejercicio 8
Se debe ingresar una lista de duplas y nos va a regresar una lista.

aplanarP :: EList a -> [a]

En el caso base, si se desea aplanar una lista de duplas vacías no debe regresar una lista vacía.

aplanarP [] = []

En el caso recursivo, si se desea aplanar una lista de duplas, el primer elemento de la lista de duplas será el primer elemento de la lista, seguido del segundo elemento de la lista de duplas  y se debe evaluar el resto de la lista de duplas(paso recursivo).

aplanarP ((x,y):xs) = x : y : aplanarP xs



--ejercicio 9
Se debe ingresar una lista con elementos a y regresa una lista de duplas.

toEl :: [a] -> EList a 

En el caso base si se ingresa una lista vacía y regresa una lista vacía, si ingresa una lista con un elemento regresa una lista vacía, porque no se puede formar una lista de duplas.

toEl [] = []
toEl [x] = []

En el caso recursivo, se toma el primer elemento de la lista y se junta con el segundo elemento para poder formar la primera dupla y se evalua la cola para poder formar las listas de duplas (paso recursivo).

toEl (x:y:xs) = (x,y): toEl xs


--ejercicio 10
En la firma se ingresa un número entero junto con una lista de duplas y regresa un lista de duplas.

dropP :: Int -> EList a -> EList a

En el caso base, si se quiere quitar n elementos a una lista vacía va a dar error. Si se quiere quitar un elemento de la lista de duplas va a dar error ya que no podría regresar un lista de duplas. Si se quiere quitar dos elementos entonces solo regresará el resto de la lista de duplas sin los elementos quitados.

dropP n []  = error "no hay elementos"
dropP 1 ((x,y):xs)  = error "el numero no es par" 
dropP 2 ((x,y):xs)  = xs

En el caso recursivo, si se quiere quitar más de dos elementos, se debe de verificar que la n sea mayor a 2, si lo es entonces se debe restar 2 a la n y evaluar el resto de la lista de duplas sino se evaluá con los casos bases (paso recursivo).

dropP n ((x,y):xs)  = if (n>2) 
                    then dropP (n-2) xs 
                    else dropP  n ((x,y):xs) 


--ejercicio 11
En la firma se ingresa un número entero junto con una lista de duplas y se regresa una lista.

dropN :: Int -> EList a -> [a]

En el caso base, si se quiere quitar n elementos a una lista vacía va a dar error. Si se quiere quitar un elemento de la lista de duplas nos debe de regresar solamente el segundo elemento junto con las demás lista de pares, en una lista aplanada. Si se quiere quitar dos elementos entonces solo regresará el resto de las listas de pares en una lista aplanada.

dropN n []  = error "no hay elementos"
dropN 1 ((x,y):xs)  = y: aplanarP xs
dropN 2 ((x,y):xs)  = aplanarP xs

En el caso recursivo, se verifica si los números a quitar son mayores a dos, si lo es entonces se va a ir recorriendo, restando 2 a la n y evaluando el resto de la lista de duplas hasta que llegue a uno de los casos base.

dropN n ((x,y):xs)  = if (n>2) 
                    then dropN (n-2) xs 
                    else dropN  n ((x,y):xs) 

--ejercicio 12
En la firma nos indica que se debe de ingresar un número entero junto con una lista de duplas y va a regresar una lista de duplas.

takeP :: Int -> EList a -> EList a

En el caso base, si permanece n elementos a una lista vacía debe regresar un error ya que no podemos quitar nada a una lista vacía, porque no hay elementos. Si se desea permanecer un elemento a una lista de duplas será un número inválido, ya que no se podrá regresar una lista de duplas. Si se solo permanece los primeros dos elementos regresa solo la primera lista de pares. 

takeP n []  = error "no hay elementos"
takeP 1 ((x,y):xs)  = error "numero no valido"
takeP 2 ((x,y):xs)  = [(x,y)]

En el caso recursivo, si los elementos que van a permanecer son más de dos, entonces se tiene que recorrer la n; restandole 2, y se va a evaluar las demás listas de pares. Además los elementos que vayamos recorriendo se van a tener ir guardando.

takeP n ((x,y):xs)  = if (n>2) 
                    then (x,y): takeP (n-2) xs 
                    else takeP  n ((x,y):xs) 


--ejercicio 13
En la firma se ingresa un número entero junto con una lista de duplas y va a regresar una lista.

takeN :: Int -> EList a -> [a]

En el caso base, si permanecen n elementos de una lista vacía va a dar error, si solamente permanece un elemento solo permanece el primer elemento de la primera lista de pares. Si permanece dos elementos solo permanece los dos primeros elementos de la primera lista pares en una lista.

takeN n []  = error "no hay elementos"
takeN 1 ((x,y):xs)  = [x]
takeN 2 ((x,y):xs)  = aplanarP [(x,y)]

En el caso recursivo, si va permanecer más de dos elementos, entonces la n es mayor que dos, por ende los dos primeros elementos permanecen y se evalúa los siguiente elementos de la lista de duplas, recorriendo la lista al restar n menos 2, también se vana ir guardando, hasta llegar al caso base.

takeN n ((x,y):xs)  = if (n>2) 
                    then x : y : takeN (n-2) xs 
                    else takeN  n ((x,y):xs) 


--ejercicio 14
En la firma se indica que se debe de ingresar una lista de duplas y regresa otra lista de duplas.

reversaP :: EList a -> EList a 

En el caso base, si se realiza la reversa de una lista vacía va a devolver la lista vacía.

reversaP [] = []

En el caso recursivo, al realizar la reversa de una lista de duplas, la primera lista tiene que ir al último y va a ser concatenada con la reversa de las demás listas de pares que se hallen en la lista de duplas, formando una nueva lista de duplas. 

reversaP ((x, y):xs) = reversaP xs ++ [(x,y)]


--FUNCIÓN MAP

--funcion myMap
En la firma se indica que se esta ingresando una lista de duplas y se va a transforma en otra lista de duplas.

myMap :: (a -> b) -> EList a -> EList b

En el caso base, si aplicas una función a una lista vacía nos devuelve una lista vacía, porque no tiene elementos para poder aplicar una función.

myMap f [] = []

Para poder aplicar la función en una lista de pares, se tiene que aplicar la función en los dos elementos de la lista de pares.

myMap f [(x,y)] = [(f(x),f(y))]

En el caso recursivo, se debe de aplicar la función en la primera lista de pares y se concatena con las siguientes listas evaluadas.

myMap f ((x,y):xs) = myMap f [(x,y)] ++ myMap f (xs)
