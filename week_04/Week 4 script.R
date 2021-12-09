
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
  left_join(airports, c("dest"= "faa"))%>%
  select(name)

#convert data frame to single character value and rename
farthest_airport <- as.character(furthest_distance)

#Display the farthest airport
farthest_airport
