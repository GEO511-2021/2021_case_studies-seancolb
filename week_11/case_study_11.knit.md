---
title: "Case Study 11"
author: Sean Colby
date: August 1, 2020
output: github_document
---
 

#Install New Packages
install.packages("mapview")
install.packages("foreach")
install.packages("doParallel")
install.packages("tidycensus")
#Load in Packages
library(tidyverse)
library(spData)
library(sf)
library(mapview)
library(foreach)
library(doParallel)
library(raster)
registerDoParallel(4)
getDoParWorkers()

#Load Census and Key
library(tidycensus)
census_api_key("c8c3ddff45dcf65f4888750b07878a707cdc25d0", install = TRUE)

#Load Buffalo Demographics
library(tidycensus)
racevars <- c(White = "P005003", 
              Black = "P005004", 
              Asian = "P005006", 
              Hispanic = "P004003")
              
options(tigris_use_cache = TRUE)
erie <- get_decennial(geography = "block", variables = racevars, 
                  state = "NY", county = "Erie County", geometry = TRUE,
                  summary_var = "P001001", cache_table=T) 

#Crop county-level data
county<- st_crop(erie, xmin=-78.9,xmax=-78.85,ymin=42.888,ymax=42.92)

#Convert Racial Variable
race<- as.factor(erie$variable)
#For Each Function to seperate by race
foreach(y=x,i=1:4,.combine=‘rbind’)%do%
st_sample(size=.$value)

library(dplyr)
#QIngqing code
generate_points <- function(df, r){df%>%
    filter(., variable==r)%>%  
    st_sample(., size = .$value)%>%  
    st_as_sf()%>% 
    mutate(variable = r)%>% 
    rename(geometry = x)}

# parallel computing
foreach(r=unique(county$variable),.combine=rbind) %dopar% {generate_points(county, race)}

