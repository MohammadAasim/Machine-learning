wbcd = read.csv("Prostate_cancer.csv")
str(wbcd)

wbcd <- wbcd[-1]

table(wbcd$diagnosis)

wbcd$diagnosis <- factor(wbcd$diagnosis,levels = c("B","M"),labels=c("Benign","Malignant"))
View(wbcd)

round(prop.table(table(wbcd$diagnosis))*100,digits=1)

normalize <- function(x){
  return ((x-min(x))/max(x)-min(x))
}

wbcd_train <- wbcd_n[1:469,]
wbcd_test <- wbcd_n[470:549,]

wbcd_train_labels <- wbcd[1:469,1]
wbcd_test_labels <- wbcd[470:549,1]

wbcd_train_labels
wbcd_test_labels


