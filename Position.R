dataset =read.csv("Position_Salaries.csv")
dataset =dataset[2:3]

lin_reg = lm(formula = Salary ~.,data = dataset)
summary(lin_reg)

dataset$Level2=dataset$Level^2
dataset$Level3=dataset$Level^3
dataset$Level4=dataset$Level^4
dataset
poly_reg=lm(formula = Salary ~.,data=dataset)