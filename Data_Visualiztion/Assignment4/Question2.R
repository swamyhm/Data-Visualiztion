library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  headerPanel(title = ""),
  sidebarPanel(
    sliderInput("size",
                "Number of Observations",
                min = 10,
                max = 200,
                value = 95),
    
    sliderInput("mu",
                "Mean",
                min = -100, 
                max = 100,
                value = 0),
    
    sliderInput("sd",
                "Standard Deviation",
                min = 1,
                max = 6,
                value = 3),
    
    checkboxInput(inputId = "indiv_obs",
                  label = "Show individual observations",
                  value = FALSE),
    
    checkboxInput(inputId = "density",
                  label = "Show density estimate",
                  value = FALSE),
    
    conditionalPanel(condition = "input.density == true",
                     sliderInput(inputId = "bw_adjust",
                                 label = "Bandwidth Adjustment",
                                 min = 0.2,
                                 max = 2,
                                 value = 1,
                                 step = 0.2))
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", 
               plotOutput(
                 outputId = "histogram", 
                 height = "400px",
                 width = "400px")),
      tabPanel("Summary",
               verbatimTextOutput(outputId = "datsummary"))
    ))
)
)
server <- function(input, output){}


