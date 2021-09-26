#Haga un análisis inicial de los datos usando las funciones apropiadas para el mismo. 
#Colocar el directorio de datos
setwd("C:/Users/jacky/OneDrive/Documentos/UVG/Sexto Semestre/Data Mining/JOYERÍAS EXCLUSIVAS")

#cargar los datos
je <- read.csv("diamantes - uso.csv", sep = ";", stringsAsFactors = T)
head(je)
View(diamonds)

#Un resumen estadistico de los datos y veo la estructura de cada una de las diferentes columnas
summary(diamonds)
str(diamonds)

#veo si hay datos faltantes
any(is.na(diamonds))

#Haga un screenshot del output en su informe.
#Haga un diagrama de caja utilizando la siguiente fórmula e interprete los resultados:
 # Precio vs corte

library(ggplot2)
ggplot(diamonds, aes(x=price, y = cut)) + geom_boxplot(fill = "red")

#Precio vs claridad
ggplot(diamonds, aes(x=price, y = clarity)) + geom_boxplot(fill = "blue")

#Precio vs peso
ggplot(diamonds, aes(x=price, y = carat)) + geom_boxplot(fill = "yellow")

#*Un diagrama de caja es para analizar la distribución de los datos según algún parámetro: https://www.pgconocimiento.com/diagrama-boxplot/
  
# Haga una matriz de correlación y analice los resultados. 
#¿Hay alguna variable que esté altamente relacionada?
#Evaluar que columnas son numericas
vect_num <- sapply(diamonds, is.numeric)
vect_num

#Hago un vector de valores logicos para filtrar numericos
cor_diamonds <- cor(diamonds[,vect_num])
cor_diamonds

#Graficar la matriz de correlación
library(corrplot)
corrplot(cor_diamonds,method = "color")
#Hay correlación de los kilates con el precio
#Las variables x, y y z tienen correlación
#Hay correlación con el precio y las variables x, y y z

# Haga la partición de datos en entrenamiento y prueba.
library(caTools)
#Poner los mismos parametros
set.seed(101)

#Vamos a hacer la partición de los datos
muestreo <- sample.split(diamonds$price, SplitRatio = 0.7)
muestreo

#Construir el set de entrenamiento
entrenamiento <- subset(diamonds, muestreo == T)
prueba <- subset(diamonds, muestreo == F)

#Hacer el modelo de regresión lineal
modelo <- lm(price ~ .,entrenamiento)
summary(modelo)

predicciones <- predict(modelo, prueba)
predicciones

resultados <- cbind(prueba, predicciones)
resultados

ggplot(resultados, aes(x=predicciones)) + geom_histogram(fill = "yellow")

convertir_cero <- function(x){
  if(x<min(diamonds$price)){
    return(min(diamonds$price))
  } else{
    x
  }
}

resultados$predicciones <- sapply(resultados$predicciones, convertir_cero)

mse <- mean((resultados$price - resultados$predicciones)^2)
mse

rmse <- sqrt(mse)
rmse

#usar el modelo que se construyó
uso <- read.csv("diamantes - uso.csv", sep = ";") 
predicciones_je <- predict(modelo, je)
resultados_je <- cbind(uso, predicciones_je)
resultados_je

resultados_je$predicciones_je <- sapply(resultados_je$predicciones_je, convertir_cero)

#Entrene el modelo de regresión lineal usando todas las variables como predictoras.
#Haga una función que diga si el resultado es negativo, debe colocar el valor mínimo de precio dentro de la base de datos.
#Corra la función con las predicciones.
#¿Cuál es el MAPE del modelo? ¿Cuál es el RMSE del modelo? ¿Está haciendo un buen trabajo el modelo?
#  Utilice el modelo para hacer las proyecciones utilizando el archivo de "diamantes - uso.csv".
