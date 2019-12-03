df=read.csv('/home/aman/college/data_science/da_lab/loan.csv')
test=data.frame(c(48),c(142000))
distances=c()
for(i in 1:nrow(df)){
  distances=append(distances,sqrt((df[i,1]-test[1,1])**2+(df[i,2]-test[1,2])**2))
}
df_dist=cbind(df,"dist"=distances)
df_dist
df_dist=df_dist[order(df_dist$dist),]
y=0
for(i in 1:5)
{
  if(df_dist$Default[i]=="Y")
  {
    y=y+1
  }
}
if(y>2) print("Yes") else print("No")
