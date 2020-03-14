numeric.var <- sapply(data, is.numeric)
corr.matrix <- cor(data[,numeric.var])
#data$TotalCharges <- NULL
t<-table(data$tenure_group)

ci<-table(data$InternetService,data$Churn)
ci<-as.data.frame(ci)
colnames(ci)<-c("Internet Service","Churn","Total Churn")
ci
ctg<-table(data$tenure_group,data$Churn)


#output$Etab1<-renderPlot(corrplot(corr.matrix, method="number"))

ggplot(data = data, aes(x=Churn, y=MonthlyCharges, fill=Churn))+geom_boxplot()

ggplot(data=data, aes(x=MonthlyCharges, color=Churn))+geom_histogram(aes(y=..density..),fill="White", bins=20)+
  geom_density(alpha=0.2)

ggplot(data =data, aes(x =Churn, y =TotalCharges, fill=Churn))+geom_boxplot()

ggplot(data=data, aes(x=data$TotalCharges, color=Churn))+geom_histogram(aes(y=..density..),fill="White", bins=20)+
  geom_density(alpha=0.2)


