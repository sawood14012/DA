df=read.csv('/home/aman/college/data_science/da_lab/vehicle_csv.csv')
mins=apply(df[,1:18],2,min)
maxs=apply(df[,1:18],2,max)
dataset=as.data.frame(scale(df[,1:18],center=mins,scale = (maxs-mins)))
dataset=cbind(dataset,"class"=df$Class)
index=sample(1:nrow(dataset),round(nrow(dataset)*0.6),replace=FALSE)
x_train=dataset[index,]
x_test=dataset[-index,]
library(MASS)
model=lda(class ~.,data=dataset)
projected_data=as.matrix(x_train[,1:18])%*%model$scaling
plot(projected_data,col=x_train[,19])
model.results=predict(model,x_test[,1:18])
table(x_test$class,model.results$class,dnn = c('Actual group','Predicted group'))
df=df[!(df$Class=='saab'),]
df
