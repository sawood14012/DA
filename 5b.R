lr<-read.table("Advertising.csv",header=TRUE,sep=",")
lr

x1 <-mean(lr$TV)
x2 <- mean(lr$radio)
y <- mean(lr$sales)
print(c(x1, x2, y))

#TV
num = sum((lr$TV-x1)*(lr$sales-y))
den = sum((lr$TV-x1)^2)
b1<- num/den
b1

#radio
num1 = sum((lr$radio-x2)*(lr$sales-y))
den1 = sum((lr$radio-x2)^2)
b2<- num1/den1
b2

#b0
b0 = y - b1*x1 - b2*x2
b0

lr$pred = b0 + b1*lr$TV + b2*lr$radio
lr

rss = sum (( lr$sales - lr$pred )^2)
rss
tss = sum((lr$sales - y)^2)
tss

rse = sqrt(rss/(nrow(lr)-2))
rse
se = 1 -(rss/tss)
se