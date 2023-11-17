data <- read.csv("binary.csv")
str(data)
View(data)
hist(data$gre)

data$gre <- (data$gre - min(data$gre))/(max(data$gre)-min(data$gre))
hist(data$gre)

data$gpa <- (data$gpa - min(data$gpa))/(max(data$gpa)-min(data$gpa))
hist(data$gpa)

data$rank <- (data$rank - min(data$rank))/(max(data$rank)-min(data$rank))
hist(data$rank)

set.seed(222)
View(data)
inp <-sample(2, nrow(data), replace = TRUE, prob = c(0.7, 0.3))
inp

training_data <- data[inp==1, ]
test_data <- data[inp==2, ]
library(neuralnet)

n <- neuralnet(admit~gre + gpa + rank,
               data = training_data, )
plot(n)
