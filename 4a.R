lr<-read.table("Advertising.csv", header=TRUE, sep=",")
input <- lr[,c("TV","sales")]
print(head(input))
model <- lm(sales~TV, data = input)
print(model)
tv_price = 100
Y = coef(model)[1] + coef(model)[2]*tv_price
print(Y)

# Try using .predict()