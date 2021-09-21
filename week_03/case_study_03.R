#install packages
install.packages("gapminder")

#load libraries 
library(ggplot2)
library(gapminder)
library(dplyr)

#load as data
data(gapminder)
str(gapminder)

#Get rid of kuwait
Countries_No_Kuwait <-gapminder%>%
  filter(country != "kuwait")

#change pop
Countries_No_Kuwait%>% mutate(pop= pop/100000)

#plot
ggplot(Countries_No_Kuwait, aes(x= lifeExp, y=gdpPercap, color= continent, size=pop))+
  geom_point()
