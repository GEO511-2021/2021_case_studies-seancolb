Case Study 08
================
Your Name
August 1, 2020

\`\`\`\[r\] install.packages()

#Load Packages library(tidyverse) library(dplyr) library(kableExtra)

#Read data in URL\<-
(“<https://gml.noaa.gov/webdata/ccgg/trends/co2/co2_annmean_mlo.txt>”)
Data \<- read_table(URL, skip=57, col_names= c(“year”, “mean”, “unc”))

#Plot it ggplot(data=Data,mapping=aes(x=year, y=mean))+
geom_line(color=“red”, size=2)+ xlab(“Year”)+ ylab(“Manual Loa Annual
Mean CO_2(ppm)”)

#Top 5 Mean Table Top5 \<- Data%>% arrange(desc(mean))%>% top_n(mean,
n=5)

#Print Top5 Top5

#Knit knitr::kable(Top5)