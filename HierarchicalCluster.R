View(iris)
iris1=iris
iris1
iris1$Species=NULL
d = dist(iris1,method = "euclidean")
hfit = hclust(d,method = "average")
hfit
plot(hfit)
grps = cutree(hfit,k=3)
grps
rect.hclust(hfit,k=3,border = 'red')
