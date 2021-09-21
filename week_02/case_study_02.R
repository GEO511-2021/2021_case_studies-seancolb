#Open Tidyverse
library(tidyverse)

#Open link to data
dataurl= "https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt"

#Download Data
temp=read_table(dataurl,
                skip=3, 
                na="999.90", 
                col_names = c("YEAR","JAN","FEB","MAR", 
                              "APR","MAY","JUN","JUL",  
                              "AUG","SEP","OCT","NOV",  
                              "DEC","DJF","MAM","JJA",  
                              "SON","metANN"))

#Toy with data and view it
View(temp)

#graph annual mean temperature in June, July and August. 
Temp_Plot<-ggplot(temp, aes(YEAR, JJA))+ geom_smooth()+ 
  geom_line()+
  xlab("Year")+ 
  ylab("Mean Temperature")

#Print Plot
Temp_Plot

#add graph title with ggtitle
Temp_Plot + ggtitle("Average Summer Temperature Over Time")

#Save as Last one
Temp_Plot_Final<- Temp_Plot + ggtitle("Average Summer Temperature Over Time")

#Save graphic to png file
png("Mean Temperature over Time")

#Plot
Temp_Plot_Final

