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
                 box(
                   "Box content here", br(), "More box content",
                   sliderInput("slider", "Slider input:", 1, 100, 50
                               )
                   )
                 
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
                           plotOutput("Etab2p5")
                           ),
                  tabPanel("Tab3", "Tab content 3",
                           plotOutput("Etab1")),
                  width = 20
                )
              )),
      
      tabItem(tabName = "widget2",
              fluidRow(
                tabBox(
                  title = "Model Data",
                  id = "tabet2",height = "1000px",
                  tabPanel("Logistic Regression Model",
                           verbatimTextOutput("Mtab")),
                  tabPanel("Decision Tree",
                           plotOutput("Tree")),
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
                  tabPanel("Tab1",
                           
                           tabPanel("Decision Tree Confussion MAtrix",
                                    verbatimTextOutput("treeCM")),
                           
                          # Dynamic valueBoxes
                           valueBoxOutput("Accuracy"),
                           valueBoxOutput("approvalBox")),
                  tabPanel("Tab2", "Tab content 2",
                           plotOutput("Evtab2")),
                  width = 20
                )
              )
      )
    )
    
  )
)

