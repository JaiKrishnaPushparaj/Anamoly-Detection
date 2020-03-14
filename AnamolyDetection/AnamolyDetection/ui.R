library(shiny)
library(shinydashboard)
library(shinyjqui)
library(shinyjs)
library(dplyr)
library(digest)
library(formattable)

ui <- dashboardPage(
  dashboardHeader(title = "Anomaly Detection "
                  
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("What is it", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Data Exploration", tabName = "widget1", icon = icon("th")),
      menuItem("Model", tabName = "widget2", icon = icon("th")),
      menuItem("Model Evaluvation", tabName = "widget3", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              h1("hi all, welcome",
                 )),
              
      
      # Second (tab content
      tabItem(tabName = "widget1",
              fluidRow(
                tabBox(
                  title = "Exploratory Data",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset1", height = "1000px",
                  tabPanel("Churn Relation",
                           plotOutput("Etab2p2"),
                           plotOutput("Etab2p4")
                  ),
                  tabPanel("Tab2", "Tab content 2",
                           plotOutput("Etab2p6"),
                           plotOutput("Etab2p5")
                           ),
                  tabPanel("Charges Relation",
                           sliderInput("slider", "Slider input:", 1, 100, 50
                             ),
                             plotOutput("Etab3p1"),plotOutput("Etab3p2"),
                             plotOutput("Etab3p3"),plotOutput("Etab3p4")
                           
                           
                           
                           ),
                  width = 20
                )
              )),
      
      tabItem(tabName = "widget2",
              fluidRow(
                tabBox(
                  title = "Model Data",
                  id = "tabet2",height = "1000px",
                  tabPanel("Logistic Regression ",
                           verbatimTextOutput("Mlr")),
                  tabPanel("Decision Tree",
                           plotOutput("MTree")),
                  tabPanel("Random Forest",
                           verbatimTextOutput("Mrf"),
                           plotOutput("Mrfp")),
                  width = 20
                )
              )
      ),
      
      tabItem(tabName = "widget3",
              fluidRow(
                tabBox(
                  title = "Evaluation",
                  # The id lets us use input$tabset1 on the server to find the current tab
                  id = "tabset3", height = "1000px",
                  tabPanel("Logistic Regression",
                           
                           tabPanel("Logistic Regresssion Confussion Matrix",
                                    verbatimTextOutput("MElrCM")),
                           
                           # Dynamic valueBoxes
                           valueBoxOutput("MElrAccuracy"),
                           valueBoxOutput("MElrPrecision"),
                           valueBoxOutput("MElrRecall"),
                           valueBoxOutput("MElrFscore")
                  ),
                  tabPanel("Decision Tree",
                           
                           tabPanel("Decision Tree Confussion Matrix",
                                    verbatimTextOutput("MEtreeCM")),
                           
                          # Dynamic valueBoxes
                           valueBoxOutput("MEtreeAccuracy"),
                           valueBoxOutput("MEtreePrecision"),
                           valueBoxOutput("MEtreeRecall"),
                           valueBoxOutput("MEtreeFscore")
                           ),
                  tabPanel("Random Forest",
                           
                           tabPanel("Random Forest Confussion Matrix",
                                    verbatimTextOutput("MErfCM")),
                           
                           # Dynamic valueBoxes
                           valueBoxOutput("MErfAccuracy"),
                           valueBoxOutput("MErfPrecision"),
                           valueBoxOutput("MErfRecall"),
                           valueBoxOutput("MErfFscore")
                  ),
                  width = 20
                )
              )
      )
    )
    
  )
)

