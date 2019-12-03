lr<-read.table("Advertising.csv", header=TRUE, sep=",")
input <- lr[,c("TV","radio","newspaper","sales")]
print(head(input))
model <- lm(sales~TV+radio+newspaper, data = input)
print(model)
x1 = 229
x2 = 36
x3 = 68
Y = coef(model)[1] + coef(model)[2]*x1 + coef(model)[3]*x2 + coef(model)[4]*x3
print(Y)

# Try using .predict()