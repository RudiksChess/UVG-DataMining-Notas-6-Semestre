print("Data Mining")

#Introducción a R 
#Operaciones básicas 
1+1
1*1
1/1
1^1
1-1

#Ayuda
?lm
?sum 
?cor

#Variables 

x<- 72
y<-7

x+y
x*y

z<-x*y

c <- "Data mining"

class(x)
class(c)

#Vectores 
a <- c(1,2,3,4,5)
a

names(a)<- c("a","b","c","d","e")

a*5
a+1

b <- c(7:11)
b

a*b


#Operaciones vectores 

mean(a)
max(a)
median(a)
summary(a)

sum(a>b)
sum(b>a)

#Simbolo cuando hace referecia igual a 
a==b
a!=b

#Seleccionar ciertos valores dentro de un vector
a[1]
a[2]
a[c(2:3)]
b[c(3:4)]
a["c"]

#Matrices

v<- c(1:10)
matrix(v, byrow = T, nrow=2)

#Hago una matriz de stocks 

nike <- c(500,600,650,675,490)
adidas <- c(400,450,415,390,405)
stock <- c("nike", "adidas")

stocks <- matrix(c(nike,adidas),byrow= T, nrow=2)


# Vectores de nombres 

dias <- c("lun", "mar", "mie", "jue", "vie")
nombres <- c("nike", "adidas")

colnames(stocks)<- dias
stocks 
row.names(stocks) <- nombres 
stocks


rowMeans(stocks)
colMeans(stocks)


stocks*5 

rebook <- c(300,325,330,310,250)

stocks <- rbind(stocks, rebook)
stocks

#Seleccionar valores dentro de una matriz 

stocks[1,1]
stocks[3,1]
stocks[,"mar"]
stocks["nike","mar"]
stocks[,c(1:3)]

#DataFrames
state.x77
head(state.x77)
str(state.x77)
class(state.x77)

# Construir DataFrame
dias 
lluvia <- c(T,T,T,F,F)
temp <- c(22,23,20,25,26)

df <- data.frame(dias,lluvia, temp)
df

#Seleccionando finales y columnas 
df[,2]
df[,"dias"]

subset(df,lluvia==T)
subset(df,temp >24)

#Filtros condicionales en datos 
head(mtcars)
mtcars[mtcars$mpg >20,]
mtcars[mtcars$hp> 100 & mtcars$mpg >20,]

#Cargas arcguvis a r 
df <- mtcars 
# write.csv(df, "mtcars.csv")
# read.csv("mtcars.csv")
