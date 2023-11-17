# Read the dataset
dataset <- read.csv('data2.csv', stringsAsFactors = T)

# Display the structure of the dataset
str(dataset)

# View the dataset in RStudio (if you're using RStudio)
View(dataset)

# Encoding Categorical Data
dataset$State <- factor(dataset$State,
                        levels = c("New York", "California", "Florida"),
                        labels = c(1,2,3))

# Print the updated dataset
dataset

# Access the State column
dataset$State

# View the updated dataset in RStudio (if you're using RStudio)
View(dataset)


nstall.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
split
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula = profit ~ .,
               data = training_set)
regressor

y_pred = predict(regressor,newdata = test_set)
y_pred





install.packages('caTools')
library(cat)