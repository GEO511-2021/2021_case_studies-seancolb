
#Load Library
library(tidyverse)
library(nycflights13)

#View Dataset
str(flights)
str(airports)

#Arrange data using distance
furthest_distance<- flights%>%
  arrange(desc(distance))%>%
  slice_max(distance, n=1)%>%
  count(origin, dest, distance)%>%
  left_join(airports, c("dest"= "faa"))
 
#select destination name column
furthest_distance%>%
  select(name)

#convert dataframe to single character value