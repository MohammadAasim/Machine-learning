str(iris)
View(iris)

table(iris$Species)

round(prop.table(table(iris$Species))*100,digit=1)

summary(iris)

normalize <- function(x){
  num <- x-min(x)
  denom <- max(x)-min(x)
  return (num/denom)
}

iris_norm <- as.data.frame((lapply(iris[1:4],normalise)))
summary(iris.norm)

set.seed(1234)
idx <- sample(2,nrow(iris),replace = TRUE,prob = c(0.67,0.33))
table(idx)

prop.table(table(idx))

round(prop.table(table(idx))*100,digit=1)

iris.training <- iris[idx==1,1:4]
iris.training

iris.test <- iris[idx==2,1:4]
iris.test

iris.trainLabels <- iris[idx==1,5]
iris.trainLabels

iris.testLabels <- iris[idx==2,5]
iris.testLabels

library(class)
iris_pred <- knn(train = iris.training,
                 test = iris.test,
                 cl=iris.trainLabels,k=5)
library(gmodels)
CrossTable(x=iris.testLabels,y=iris_pred,prop.chisq = FALSE)


library(e1071)
library(caTools)

split <- sample.split(iris, SplitRatio = 0.7)
train_cl <- subset(iris, split=="TRUE")
train_cl
test_cl <- subset(iris, split=="FALSE")
test_cl

train_scale <- scale(train_cl[, 1:4])
train_scale

set.seed(120)
classifier_cl <- naiveBayes(Species ~ ., data = train_cl)
classifier_cl

y_pred <- predict(classifier_cl, newdata = test_cl)

#confusion matrix
cm <- table(test_cl$Species,y_pred)
cm


#Home Work
#Diamond
