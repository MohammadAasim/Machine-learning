credit <- read.csv("credit.csv",stringsAsFactors = FALSE)
str(credit)
table(credit$checking_balance)
table(credit$savings_balance)
summary((credit$months_loan_duration))
summary((credit$amount))
table(credit$default)

credit$default <- factor(credit$default,
                         levels = c("1","2"),
                         labels = c("No","Yes"))
set.seed(123)
train_sample <- sample(1000,900)
str(train_sample)

credit_train <- credit[train_sample,]
credit_test <- credit[-train_sample,]

prop.table(table(credit_train$default))
prop.table(table(credit_test$default))

install.packages("C50")
library(C50)
credit_train$default <- as.factor(credit_test$default)
str(credit_train$default)
credit_model <- C5.0(credit_train[-17],credit_train$default)

credit_model

# to see the tree's decision , we can call the summary() on the model.......
summary(credit_model)

#step-4  evaluating model performance
credit_pred <- predict(credit_model,credit_test)  # credit_test is the test dataset
library(gmodels)

CrossTable(credit_test$default, credit_pred, prop.chisq = FALSE,
           prop.c = FALSE,prop.r = FALSE,
           dnn = c('actual default','predicted default'))s
