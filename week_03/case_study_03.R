#install packages
install.packages("gapminder")

#load libraries 
library(ggplot2)
library(gapminder)
library(dplyr)

data(gapminder)

gapminder%>%
  filter(country != "kuwait")
