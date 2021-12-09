#Load Dataset
data(iris)

#Name Variable of Petal length column
Petal.Length <- iris$Petal.Length

#Calculate Mean of Petal Length
mean(Petal.Length)

#Save Mean Petal Length as New Variable
petal_length_mean <- mean(Petal.Length)

#Print New Variable
petal_length_mean

#Make a Histogram of the Mean Petal Length
hist(Petal.Length)

#Customize Histogram to have appropriate titles and color
hist(Petal.Length, col = "green", main= "Distribution of Petal Length", xlab = "Petal Length")

#Try to implement in ggplot2
install.packages("ggplot2")

#load GGplot
library(ggplot2)

#Set GG PLot
plot_1 <- ggplot(data=iris, aes(Petal.Length))+ geom_histogram(fill= "green")+
  title("Petal Length Distribution")

#Print Plot 1
plot_1

