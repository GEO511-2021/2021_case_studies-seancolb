#Beware the Canadians Lab

#Install and load packages
install.packages("sf")
install.packages("spData")
install.packages("tidyverse")
#Load Library
library(sf)
library(spData)
library(tidyverse)

#Load the data
data(world)
data(us_states)

#Look at what comprises states to call NY
str(us_states, max.level=2)

#Set NY as seperate entity
NY = us_states[us_states$NAME == "New York",]

