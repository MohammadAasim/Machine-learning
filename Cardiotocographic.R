data <- read.csv('Cardiotocographic.csv',stringsAsFactors = FALSE)
str(data)


data$NSPF <- factor(data$NSP)

str(data)

set.seed(1234)
pd <- sample(2,nrow(data),replace=TRUE,prob = c(0.8,0.2))

train <- data[pd==1,]
test <- data[pd==2,]

install.packages("party")
library(party)

tree <- ctree(NSPF~LB+AC+FM,data=train,controls = ctree_control(mincriterion = 0.90,minsplit = 200))
?ctree_control

tree

plot(tree)

#prediction
predict(tree,test,type="prob")
predict(tree,test)->preModel
table(preModel,test$NSPF)
#Decision
install.packages("rpart")
library(rpart)
tree1 <- rpart(NSPF~LB+AC+FM,train)
install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(tree1)
predict(tree1,test)

table <- table(predict(tree),train$NSPF)
table
1-sum(diag(table)/sum(table))
