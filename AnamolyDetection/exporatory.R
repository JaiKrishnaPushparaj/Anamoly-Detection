numeric.var <- sapply(data, is.numeric)
corr.matrix <- cor(data[,numeric.var])
data$TotalCharges <- NULL
t<-table(data$tenure_group)


