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

#check what labels do what
?labs()

#plot
Wealth_Life_Expectancy <- ggplot(Countries_No_Kuwait, aes(x= lifeExp, y=gdpPercap, color= continent, size=pop/100000))+
  geom_point()+  
  facet_wrap(~year, nrow=1)+ 
  scale_y_continuous(trans = "sqrt")+
  theme_bw()+
  labs(title= "Wealth and Life Expectancy", x= "Life Expectancy", y= "GDP per Capita", color= "Continent", size= "Population in 100k")

#Print new plot
Wealth_Life_Expectancy
#Set up data for Plot 2
gapminder_continent<- gapminder%>%
  group_by(continent, year)%>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
            pop = sum(as.numeric(pop)))
#display new dataset
gapminder_continent

#plot the second dataset
ggplot(gapminder_continent, aes(x=year, y=gdpPercapweighted), color=continent, size=pop/100000)+ 
  geom_point()+
  facet_wrap(~continent, nrow=1)+
  geom_line(data=gapminder_continent)+
  theme_bw()

#Combine both plots together
ggplot(gapminder, aes(x = year, y =gdpPercap, color=continent, size=pop/100000)) +
  geom_line(aes(group=country, size = .05)) +
  geom_point()+
  geom_line(data= gapminder_continent, mapping= aes(year, gdpPercapweighted, col= "black" ))+
  geom_point(data= gapminder_continent, mapping= aes(year, gdpPercapweighted, col= "black"))+
  facet_wrap(~continent, nrow=1) +
  theme_bw() +
  labs( x= "Year", y = "GDP per Capita", size = "Population (100k)")


  