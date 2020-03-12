rfModel <- randomForest(Churn ~., data = training)
print(rfModel)


pred_rf <- predict(rfModel, testing)
confusionMatrix(pred_rf, testing$Churn)
caret::confusionMatrix(pred_rf, testing$Churn)


plot(rfModel)

t <- tuneRF(training[, -18], training[, 18], stepFactor = 0.5, 
            plot = TRUE, ntreeTry = 200, trace = TRUE, improve = 0.05)


rfModel_new <- randomForest(Churn ~., data = training, ntree = 200, mtry = 2, importance = TRUE, proximity = TRUE)
print(rfModel_new)

pred_rf_new <- predict(rfModel_new, testing)
caret::confusionMatrix(pred_rf_new, testing$Churn)


varImpPlot(rfModel_new, sort=T, n.var = 10, main = 'Top 10 Feature Importance')
