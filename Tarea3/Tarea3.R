# Comparativos lógicos de R 

x<- 13

#Condiciones "if" 
if(x==10){
  print("x es igual a 10")
} else if(x==22){
  print("x es igual a 22")
} else {
  print("x no es ni 10 ni es 22")
}

#while 
x<-0 

while (x< 8){
  x <- x+1
}

x<-0 
while(x<8){
  print(paste0("x tiene el siguiente valor:",x))
  x<-x+1
  if (x==8){
    print("x ya tiene el valor de 8, por lo que debemos romper el ciclo")
    break 
    }
}

# Función for loop 
v<- c(5,2,3,1,7)

for (varr in v){
  print(varr)
}

for (variable in v){
  resultado = v*3
  print("la variable temporar *3")
  print(resultado)
}

?sum 
?lm 

#Funciones
funcion <- function(a,b,c){
  resultado <- a+b+c
  return(resultado)
}

v <- 1:5 

suma_aleatorio <- function(x){
  aleatorio <- sample(1:100,1)
  return(x+aleatorio)
}

suma_aleatorio(7)


sapply(v,suma_aleatorio)

sapply(v,function(x){return(x*2)})