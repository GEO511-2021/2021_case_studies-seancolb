---
title: "Dismo and rFIA"
author: "Sean Colby"
date: "10/26/2021"
css: https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css
output: 
  revealjs::revealjs_presentation:
      lib_dir: externals
      keep_md: true
      theme: solarized
      highlight: tango
      self_contained: false
      transition: zoom
---




## rFIA Package 
![](https://besjournals.onlinelibrary.wiley.com/cms/asset/2b0ad9ee-06e0-44e7-86c9-be062d06e8d3/jpe13504-fig-0001-m.png){width=50%}

## How We Can Use FIA Data
* Land Value Assessment
* Conservation Biology
* Species Distribution Models
* Invasive Ecology
* Urban Planning
* Fire Management

## ![](https://forestthreats.org/products/news/in-the-news/fia-data-inform-insect-invasion-research/images-1/OSB_risk_map.jpg)

## rFIA Functions

Mostly Involved with species land cover, tree ring data, growth rates, and abundances. 

Some of the main functions:

* `Carbon()- Estimate carbon stocks of forest`
* `Diversity()- Estimate species diversity of plot`
* `Invasive()- Estimate coverage of invasive species`
* `Tpa()- Estimates abundance of standing trees`

## Example Run

```r
#Load the Library
library(rFIA)
library(tidyverse)
#Get Data
NY<- getFIA("NY")
#Invasive Species Coverage
Invasive_NY <- invasive(NY)
#Filter It
Garlic_Mustard <- filter(Invasive_NY, COMMON_NAME == "garlic mustard")
```
## Example Run Continued
![](Rplot.jpeg)

* Garlic Mustard Percentage Graphed Over Time
* `NYS Records Between 2007-2019`



