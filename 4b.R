lr<-read.table("LR_Advertising.csv", header=TRUE, sep=",")
lr
budget<-mean(lr$Budget)
sales<-mean(lr$Sales)
num = sum ((lr$Budget - budget) * (lr$Sales - sales))
den = sum((lr$Budget - budget) ^ 2)
b1= num/den
b0 = sales - b1 * budget
lr$pred = b0 + b1 * lr$Budget
lr

rss = sum (( lr$Sales - lr$pred )^2)
rss
tss = sum((lr$Sales - sales)^2)
tss
rse = sqrt(rss/(nrow(lr)-2))
rse
se = 1 -(rss/tss)
se
plot(lr$Budget, lr$Sales,col="red")
lines(lr$Budget, lr$pred)
x1<- 800
x1<- as.integer(x1)
y<- b0 + b1 * x1
y