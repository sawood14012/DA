df_train=read.csv('/home/aman/college/data_science/da_lab/titanic/train.csv')
df_test=read.csv('/home/aman/college/data_science/da_lab/titanic/test.csv')
colSums(is.na(df_train))
space=function(x){sum(x=="")}
apply(df_train,2,space)
names(df_train)
df_train_clean=subset(df_train,select = -c(PassengerId,Cabin,Ticket,Name))
df_train_clean$Age[is.na(df_train_clean$Age)]=median(na.omit(df_train_clean$Age))
colSums(is.na(df_train_clean))
index=sample(1:nrow(df_train_clean),size=round(nrow(df_train_clean)*0.8),replace=FALSE)
names(df_train_clean)
apply(df_train_clean,2,function(x){sum(x=="")})
df_train_clean=df_train_clean[!(df_train$Embarked==""),]
head(df_train_clean)
df_train_clean$Survived=as.factor(df_train_clean$Survived)
df_train_clean$Sex=as.factor(df_train_clean$Sex)
df_train_clean$Embarked=as.factor(df_train_clean$Embarked)
df_train_clean$Pclass=as.factor(df_train_clean$Pclass)
str(df_train_clean)
x_train=df_train_clean[index,]
x_test=df_train_clean[-index,]
library(MASS)
head(x_train)
qda.model = qda (Survived ~ Pclass + Sex + Age + Parch, data=x_train)
qda_prob <- predict(qda.model, newdata = x_test)
table(Predicted = qda_prob$class, actual=x_test$Survived)
