data<-read.table("Bank_logistic.csv",header=TRUE,sep=",")
data$det=gsub("N",0,data$det)
data$det=gsub("Y",1,data$det)
x1<-mean(as.integer(data$det))
y1<-mean(data$balance)
num=sum((as.integer(data$det)-x1)*(data$balance-y1))
den=sum((as.integer(data$det)-x1)^2)
b1=num/den
bo=y1-b1*x1
data$pred=bo+b1*(as.integer(data$det))
e=2.71828
data$pred_log=1/(1+e^(-data$pred))
plot(data$det,data$pred_log,col="red")
plot(data$det,data$pred_log, type="l", col="green", lwd=5, xlab="det", ylab="log")