library(MASS)
df=read.csv('/home/aman/college/data_science/da_lab/vehicle_csv.csv')
maxs=apply(df[,1:18],2,max)
mins=apply(df[,1:18],2,min)
dataset=as.data.frame(scale(data[,1:18],center=mins,scale=maxs-mins))
dataset=cbind(dataset,"class"=df$Class)
index=sample(1:nrow(dataset),round(nrow(dataset)*0.6),replace=FALSE)
x_train=dataset[index,]
x_test=dataset[-index,]
library(MASS)
model=lda(class ~ .,data=x_train)
projected_data=as.matrix(x_train[,1:18])%*%model$scaling
plot(projected_data,col=x_train[,19],pch=19)
model.results=predict(model,x_test)
model.results
x_test$class
head(x_test)
X_test = x_test[, !( names( x_test ) %in% c( "class" ) ) ]
head(X_test)
model.results=predict(model,x_test[,1:18])
length(model.results$class)
table(x_test$class,model.results$class)
