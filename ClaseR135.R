# CLASE FUNDAMENTOS DE R  13/5
# Maestría en Gestion Estrategica de Marketing Digital y Negocios por Internet
# Economia digital

#Utilizaremos la tecla # cuando queremos comentar algo o dejar una nota.
#Es importante comentar lo que se realiza en los scripts.


# LA COMBINACIÓN DE TECLAS <Ctrl ENTER>  corre lo seleccionado 

# <Ctrl 1>     y      <Ctrl 2>    permiten pasar de la ventana de script (arriba) a la consola de abajo.

# <Ctrl S>   graba

# <Ctrl A> selecciona todo el contenido de la ventana de Scripts.

# <cTRL l> LIMPIA LA CONSULA

# ESC   INTERRUMPE EL PROCESO CORRIENDO EN R


#Siempre antes de empezar borramos cualquier objeto en memoria con:


rm(list=ls(all = TRUE))

# otra forma"click en la "escoba"que se encuentra en el environment


#En R podemos hacer cuentas, al igual que utilizando una calculadora:
#Dividir
50/2
# El resultado es 25, y se imprime en consola como [1] 25
#Multiplicar
25*2
#Sumar
39696+410
#Restar
30-2
#Potenciacion
5^2
#Radicacion
sqrt(4)
#Numero e
exp(1)
#Logaritmo neperiano
log(4)
#Logaritmo  base 10
log10(10)
#Valor absoluto de un numero
abs(-3)
#Numero pi
pi
#Operaciones combinadas:
(20-2)/(log10(100)+sqrt(125))

#OBJETOS EN R: veremos algunas nociones de vectores y data frames.
#En el apunte tienen un poco mas de info acerca de matrices y listas.
#VECTORES
#nombre_objeto <-c(x1, x2, x3) 

vector1<-c(1,3,5,7)
vector1
vector2<-c(4,5,8,9)
vector2
vector3<-c("a","b","c","d")
vector3
vector4<-c(TRUE,FALSE,TRUE,TRUE)
vector4

mode(vector1) 
mode(vector2); mode(vector3); mode(vector4)
#mode: me dice que tipo es el vector, en el caso de vector1 numerico.
length(vector1)
#length: me da la longitud del vector, si tiene 4 elementos, su longitud es de 4.
length(vector2);length(vector3);length(vector4)
str(vector1)
str(vector2);str(vector3);str(vector4)
#str: da la estructura del vector, que tipo es, cantidad de elementos y los elementos que contiene.
summary(vector1)
#summary: da las medidas de resumen (minimo, maximo, mediana, Q25, Q75, media)
sum(vector1)
#sum: suma todos los elementos de un vector (para vectores numericos)

# otro ejemplo: vector con longitud 1

m<-5
m

mode(m)
length(m)

#Supongamos que quiero eliminar el vector a, uso la funcion rm
rm(m)

#Podemos realizar operaciones entre vectores que contienen elementos del mismo tipo e igual longitud


#DATA FRAMES
#s una base de dats plana, que permite combinar vectores con 
# diferente tipo de datos (numéricos, carácter, lógico).
#Cada columna correspondera a una variable/atributo  
#Cada fila a un registro/observacion/sujeto

vector_a_1<-c(1,3,5,7)
vector_a_2<-c(4,5,8,9)
vector_a_3<-c("a","b","c","d")
vector_a_4<-c(TRUE,FALSE,TRUE,TRUE)

#Vamos a crear un data frame llamado datos
datos<-data.frame(vector_a_1, vector_a_2, vector_a_3, vector_a_4)

View(datos)
#vemos el data frame
dim(datos)
#dim arroja las dimensiones del data frames: 4 filas y 4 columnas

#Si quiero ver una variable (columna especifica del data frame), ej vector_a_1, utilizo el signo $
datos$vector_a_1

datos$vector_a_2

# Si queremos una parte del data frame, por ejemplo, las primeras 2 filas:
head(datos,2)
#Si queremos ver las 2 ultimas filas:
tail(datos,2)
# Con la funcion summary obtenemos las medidas de resumen de cada columna del data frame
summary(datos)

# En el caso de querer las funciones resumen de solo una columna:
summary(datos$vector_a_2)

#Si queremos saber el numero de filas del data frame
nrow(datos)
#Si queremos saber el numero de columnas del data frame
ncol(datos)

#Algunas medidas estadisticas
#Medidas de tendencia central:
#Media (promedio): es el valor que define el promedio de un conjunto numérico
mean(datos$vector_a_1)

#Mediana: corresponde al valor de la variable que divide en dos partes iguales a los datos
#ordenados por valor creciente del carácter (el 50% de los datos tendrán un valor menor que la
#mediana, y el otro 50% de los datos tendrán un valor mayor).

median(datos$vector_a_1)

#Medias de dispersion
#Varianza: mide la dispersión media de los valores observados de una variable
var(datos$vector_a_1)

#Desvio estandar: raiz cuadrada de la varianza (misma unidad que variable)
sd(datos$vector_a_1)

#Como calculamos cuantiles:
quantile(datos$vector_a_1)

#Importacion de base de datos:
#Utilizaremos la base sp (archivo excel)
#En environment--> import dataset-->from excel--> browse--> busco archivo--> puedo cambiar nombre
#de data set (ej coloco nombre datos)-->import
#veo como aparece el data set en el environment

#Otra forma, por codigo:
#Seteo directorio de trabajo
#Session--> set working directory--> to source file location
datos <- read_excel("sp.xlsx")

#Vemos que la variable peso, la leyo como caracter cuando en verdad es numerica (puede pasar)
#Para realizar luego las operaciones de una variable numerica, debemos convertirla:
datos$Peso<- as.numeric(datos$Peso)

##################################################################################################
#Visualizacion de datos
#Primero debemos comentar como instalar paquetes en R :

#Los paquetes consisten en una colección de funciones R, datos y código compilado. La ubicación donde se almacenan
#los mismos se denomina Librería (library).

#Los paquetes se instalan una sola vez, pero cada vez que debemos utilizar el paquete se carga
#la libreria en memoria

#Paquete ggplot2
#instalar paquete
install.packages(ggplot2)
#otra forma: packages (panel derecho inferior),install, coloco nombre, install

library(ggplot2)

#Otros ejemplos
#Instale y cargue los siguientes paquetes: tidyverse y dplyr.

#ggplot2 arma los graficos  utilizando capas
#Las distintas capas son:
#data (datos): data set
#aes (estetica): Cómo se relacionan cada una de las variables de los datos con las propiedades estética del gráfico
#geom (geometrica): tipo de geometria a graficar (punto, barras,lineas, etc)
#facet (facetas): se subdivide el grafico en facetas segun los datos (ej por variables categoricas)
#theme (tema): permite controlar los colores, líneas, tipografía, etc.
#sistema de coordenadas: para modificar los ejes
#stats (estadistica): se realiza alguna operacion estadistica a los datos

#En help se puede buscar ggplot
#Vamos a trabajar con el data set mpg, un data set con 234 filas y 11 variables
mpg
#lo guardo en un objeto como mpg
mpg<- data.frame(mpg)

#model : model name (nombre del modelo)

#displ: engine displacement, in litres (desplazamiento de cilindros, ing del motor)

#year: year of manufacture (an~o de manufactura)

#cyl:  number of cylinders (numero de cilindros)

#trans:  type of transmission (tipo de transmision)

#drv: the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd

#am tipo de tren de transmisión, donde f = tracción delantera, r = tracción trasera, 4 = 4wd)

#cty: city miles per gallon (millas por galon en ciudad)

#hwy: highway miles per gallon (millas por galon en autopista)

#fl:fuel type (tipo de combustible)

#class: "type" of car  (tipo de auto)

#Que variables son cualitativas? y cuales son cuantitativas?

#Queremos estudiar la relacion entre 2 variables numericas, para ello realizamos un
#scatterplot (diagrama de dispersion)
ggplot(mpg, aes(displ, hwy)) +
  geom_point()

#En este caso vemos la relacion de hwy (millas/galon) en funcion de displ (desplazamiento), 
#que observamos??

#Veamos las partes del codigo:
#ggplot( nombre del data set, aes(x,y))+ geometria (point=punto---> scatterplot) 
#Con el mas vamos agregando capas

#Podemos seguir agregando capas
ggplot(mpg, aes(
  displ, hwy)) +
  geom_point(col="violet") +
  labs(
    x = "Desplazamiento del motor (litres)",
    y = "Millas de autopista por galon")+ ggtitle("Kilometraje por tamaño de motor y cilindros")
#con labs agregamos titulo a los ejes, al grafico, y en geom point pido un color determinado 
#con ggtitle: titulo al grafico

# Podemos  " facetar"  o subdividir el gráfico de acuerdo a los niveles o categorías de la variable de comparación
ggplot(mpg, aes(displ, hwy)) + geom_point(col="green") + facet_wrap(~class)
#vemos 7 graficos: 1 por cada tipo de auto (variable class)

#que podemos observar?

#Se puede cambiar la forma de los puntos: shape

ggplot(mpg, aes(displ, hwy)) + geom_point(col="brown1", shape=17)

#Si queremos agregar una regresion lineal al grafico, lo hacemos con geom_smooth
ggplot(mpg, aes(
  displ, hwy)) +
  geom_point(col="violet") +geom_smooth(method = "lm")


#Grafico de barras (bar plot)
#Lo utilizabamos para variables cuantitativas discretas
#Vamos a realizar un barplot de la variable cyl: numero de cilindros

ggplot(mpg, aes(cyl)) + 
  geom_bar() + 
  xlab("Número de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Gráfico de Barras de la variable cyl")

ggplot(mpg, aes(cyl)) + 
  geom_bar(col="darkslategray", fill="coral") + 
  xlab("Número de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Gráfico de Barras de la variable cyl")
#fill=para relleno, col= bordes de barras

#Se puede   cambiar la orientación de los ejes usando coord_flip():
ggplot(mpg, aes(cyl)) + 
  geom_bar(col="darkslategray", fill="cyan3") + 
  xlab("Número de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Gráfico de Barras de la variable cyl")+coord_flip()

#que observamos?

#aca tenemos la lista de colores https://r-charts.com/es/colores/


#Si quiero colorear las barras por otra variable, ej fl (tipo de combustible)
#para eso debo convertir la variable a factor, uso dentro de aes , fill
ggplot(mpg, aes(cyl, fill = as.factor(fl))) + 
  geom_bar() + 
  xlab("Numero de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Numero de cilindros segun combustible") +
  labs(fill = "Tipo de combustible")


#Histograma
#Lo utilizamos para variable aleatorias cuantitativas continuas
#En este caso, construimos un histograma de la variable displ
ggplot(mpg, aes(displ)) + geom_histogram()


#stat_bin() using bins = 30. Pick better value with binwidth.
#Las posibles opciones para solucionar esto es estableciendo el número de barras con el argumento bins o 
#modificar el ancho de cada barra con el argumento  binwidth .
#binwidth= ancho de las barras que recogen los rangos de representación de la variable.

#bins=5 (tengo 5 intervalos=5 barras apiladas)

ggplot(mpg, aes(displ,fill="coral")) + geom_histogram()+stat_bin(bins=5)+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()

#Si quiero un histograma por variable tipo de auto, debo facetar:

ggplot(mpg, aes(displ,fill="coral"),binwidth=30) + geom_histogram()+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()+ facet_grid(class~.)

#Podemos emplear la función geom_density() para trazar un gráfico de densidad que asemeja una distribución continua:

ggplot(mpg, aes(displ,fill="blue"),binwidth=10) + geom_density()+ xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_linedraw()


#otra alternativa , el poligono de frecuencias: se ven  lineas en vez de barras
ggplot(mpg, aes(hwy)) + geom_freqpoly()

ggplot(mpg, aes(hwy)) + geom_freqpoly(col="aquamarine2") +xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_minimal()

#BOXPLOT (GRAFICO DE CAJA)
#Una gráfica de caja resume la distribución de una variable continua. 
# Muestra su mediana, su primer y tercer cuartiles y outliers.

ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot() 
#En el eje x tengo drv (tipo de transmision), y en eje y, hwy (millas por galon)

# que observamos?

#con geom_jitter, puedo "manejar" los puntos en el boxplot

#Si quiero darle color a los puntos:
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot(aes(color = drv), alpha = 0.7) + 
  geom_jitter(aes(color = drv), size = 1, alpha = 0.7)+ 
  xlab("Transmision") + 
  ylab("Millas/galon") +
  ggtitle("Boxplot") + 
  theme_minimal() 

#con size, modifico el tamano de los puntos
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot(aes(color = drv), alpha = 0.7) + 
  geom_jitter(aes(color = drv), size = 3, alpha = 0.7)+ 
  xlab("Transmision") + 
  ylab("Millas/galon") +
  ggtitle("Boxplot") + 
  theme_minimal() 

#con alpha, el tono de color de los puntos
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot(aes(color = drv), alpha = 0.1) + 
  geom_jitter(aes(color = drv), size = 3, alpha = 0.1)+ 
  xlab("Transmision") + 
  ylab("Millas/galon") +
  ggtitle("Boxplot") + 
  theme_minimal() 

#otra alternativa al boxplot es el VIOLIN PLOT (grafico de violines)
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_violin()
#Encima del grafico de violines puedo superponer el boxplot:
ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_violin(aes(fill = drv))+geom_boxplot()

#Para variables cualitativas se pueden usar los barplot:

g1<- ggplot(mpg,aes(class))+geom_bar(aes(fill=class))+
  xlab("Tipo de auto")+ylab("Frecuencia")+theme_minimal()+
  ggtitle("Tipos de autos")



g2 <- ggplot(mpg, aes(cyl, fill = as.factor(fl))) + 
  geom_bar() + 
  xlab("Numero de cilindros") + 
  ylab("Frecuencia") + 
  ggtitle("Numero de cilindros segun combustible") +
  labs(fill = "Tipo de combustible")+ theme_dark()

g3<- ggplot(mpg, aes(
  displ, hwy)) +
  geom_point(col="violet") +geom_smooth(method = "lm")

g4<- ggplot(mpg, aes(hwy)) + geom_freqpoly(col="aquamarine2") +xlab("Desplazamiento del motor") + 
  ylab("Frecuencia") + ggtitle("Desplazamiento del motor") +
  theme_minimal()


#si quiero tener en una misma hoja multiples graficos:


#Utilizo el paquete gridExtra
#Instalar el paquete y cargar la libreria en memoria
library(gridExtra)
library(dplyr)
grid.arrange(g1, g2, g3, g4, ncol=2, nrow =2)
