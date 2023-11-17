install.packages("ggplot2")
library(ggplot2)
data("diamonds")
?diamonds

dia <- data.frame(diamonds)

ran <- sample(1:nrow(dia), 0.9*nrow(dia))
ran

nor <- function(x) { x -min(x)/max(x)-min(x)}

#normalization function is created
dia_nor<-as.data.frame(lapply(dia[,c(1,5,6,7,8,9,10)], nor))

#training dataset extracted
dia_train <-dia_nor[ran,]
dia_train

dia_test <- dia_nor[-ran,]
dia_test

dia_target  <- as.factor(dia[ran,2])
dia_target

library(class)
pr <- knn(dia_train,dia_test,cl=dia_target,k=20)
pr

tb <- table(pr,test)