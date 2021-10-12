#Install new packages
install.packages("ncdf4")
#Load in Libraries
library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)
library(ncdf4)
#Load Data in
data(world)
tmax_monthly <- getData(name= "worldclim", var="tmax", res=10)

#Peek at world data
str(world)

#Remove Antarctica 
Countries <- filter(world, continent != "Antarctica")

#Set as sp
Countries_sp <- as(Countries, "Spatial")

#Peek at Temperature
str(tmax_monthly, max.level=2)
tmax_monthly

#What does gain do?
?gain()

#Convert Temperature Value
gain(tmax_monthly)= .1

#Find max annual
tmax_annual <- max(tmax_monthly)
tmax <- names(tmax_annual)

#Calculate and plot maximum temperature per country


