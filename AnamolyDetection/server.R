library(shiny)

source("preprocess.R")
source("DataTraining.R")
source("Logistic.R")
source("Tree.R")
source("exporatory.R")
server <- function(input, output) {
  
 #observeEvent(input$submit, {
  #  updateNumericInput( "slider", value = 0)})

  
  
  dim(training); dim(testing)
  
  output$Etab1<-renderPlot(corrplot(corr.matrix, method="number"))
  output$Etab2p2 <- renderPlot(ggplot(data, aes(x=SeniorCitizen)) + ggtitle("Senior Citizen") + xlab("Senior Citizen") + 
                             geom_bar(aes(y = 100*(..count..)/sum(..count..)), width = 0.5) + ylab("Percentage") + coord_flip() + theme_minimal())
  output$Etab2p4 <- renderPlot(ggplot(data, aes(x=Dependents)) + ggtitle("Dependents") + xlab("Dependents") +
                             geom_bar(aes(y = 100*(..count..)/sum(..count..)), width = 0.5) + ylab("Percentage") + coord_flip() + theme_minimal())
  output$Etab2p5<-renderPlot(pie(t,main="Tensure Chart"))

  output$Mtab<-renderPrint(print(LogModel))
  output$Tree<-renderPlot(plot(tree))
  output$treeCM<-renderPrint(table(Predicted = pred_tree, Actual = testing$Churn))
  output$Accuracy <- renderValueBox({
   valueBox(
      format(round((sum(diag(tab2))/sum(tab2))*100,2)), "Decision Tree Accuracy", icon = icon("Accuracy"),
      color = "purple")
    
  })
  
  output$approvalBox <- renderValueBox({
   valueBox(
     format(round((1-misClasificError)*100,2)), "Logistic Regression Accuracy", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow"
    )
  })
  #output$Evtab2<-renderPlot(varImpPlot(rfModel_new, sort=T, n.var = 10, main = 'Top 10 Feature Importance'))
  }
