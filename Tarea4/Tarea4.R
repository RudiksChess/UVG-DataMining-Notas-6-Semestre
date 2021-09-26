#Paquetes
install.packages("dplyr")
library(dplyr)

install.packages("nycflights13")
library(nycflights13)

head(flights)
?flights 
view(flights)


#Formulazos 

filter(flights, month == 11, day ==3, carrier == "AA")
filter(flights, dep_delay >0)

slice(flights, 1:10)

arrange(flights, year,day,month,desc(arr_time))

select(flights, -carrier)

# Cambiar nombre de colmnas 

df <- rename(flights, aerolinea = carrier)

distinc(select(flights, carrier))

#Mutate 

mutate(flights, diferencia= arr_delay - dep_delay)

#Summary 

summarise(flights, tiempo_promedio=mean(air_time, na.rm=T))

#Pipe operation 

flights %>% select(air_time, aerolinea) %>% select(air_time, aerolinea) %>% arrange(aerolinea, desc(air_time))




