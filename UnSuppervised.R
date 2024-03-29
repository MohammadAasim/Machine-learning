install.packages("clusterR")
install.packages("cluster")

library(cluster)

iris_1 <- iris[,-5]

set.seed(240)

kmeans.re = kmeans(iris_1,
                   centers = 3,
                   nstart = 20)

kmeans.re$cluster

cm <- table(iris$Species,kmeans.re$cluster)
cm

plot(iris_1[c("Sepal.Length","Sepal.Width")],
     col = kmeans.re$cluster, main = "K-means with 3 Clusters")

points(kmeans.re$centers[, c("Sepal.Length","Sepal.Width")], col = 1:3, pch = 8, cex = 3)

y_means <- kmeans.re$cluster

clusplot(iris_1[,c("Sepal.Length","Sepal.Width")],
         y_kmeans,
         lines=0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span =TRUE,
         main = paste("cluster iris"),
         xlab = 'Sepal>length',
         ylab = 'Sepal.Width')
