#Load Library
library(tidyverse)
library(reprex)
library(sf)
library(spData)

#Load Data
data(world)

#Plot it
ggplot(world,aes(x=gdpPercap, fill=continent, color=continent))+
  geom_density(alpha=0.5)

#Reprex
reprex(venue="gh")
