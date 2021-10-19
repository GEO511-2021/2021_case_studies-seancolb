library(tidyverse)
library(reprex)
library(sf)
library(spData)

data(world)

ggplot(world,aes(x=gdpPercap, fill=continent, color=continent))+
  geom_density(alpha=0.5)

reprex(venue="gh")
