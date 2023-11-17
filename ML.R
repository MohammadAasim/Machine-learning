data("mtcars")
?mtcars
str(mtcars)

install.packages('caTools')
library(caTools)

split <- sample.split(mtcars,splitRatio = 0.7)
split

training <- subset(mtcars,split="TRUE")
training

testing <- subset(mtcars,split="False")
testing

model <- glm(vs ~ wt+disp,training,family="binomial")
model
summary(model)

testing

data <- data.frame(disp=167.6 , wt=3.440)
answer <- predict(model,data,type="response")
answer

predict_reg <- predict(model,testing,type="response")
predict_reg > 0.5
# confusion matrix is a matrix that summarize the performance of machine learning model on set of test data
# Accuracy = (TP+TN)/(TP+TN+FP+FN)
# Precision = (TP)/(TP+FP)
# Recall = (TP)/(TP+FN)
# F1-Score = (2*Pre*Recall)/(Pre+Recall)
