library(shiny)
shinyUI(
  pageWithSidebar(
    # application title
    headerPanel("test01"),
    sidebarPanel(
      tags$head(
        tags$style(type="text/css", "select { max-width: 360px; }"),
        tags$style(type="text/css", ".span4 { max-width: 360px; }"),
        tags$style(type="text/css",  ".well { max-width: 360px; }")
      ),
      wellPanel(
        p(strong("Side Panel:"))
      )
    ),
    
    mainPanel(
      
      div(id="XXmin",textInput(inputId="xlimitsmin", label="x-min", value = 0.0)),
      tags$head(tags$style(type="text/css", "#XXmin {display: inline-block}")),
      tags$head(tags$style(type="text/css", "#xlimitsmin {max-width: 50px}")),
      
      div(id="XXmax",textInput(inputId="xlimitsmax", label="x-max", value = 0.5)),
      tags$head(tags$style(type="text/css", "#XXmax {display: inline-block}"),
                tags$head(tags$style(type="text/css", "#xlimitsmax {max-width: 50px}"))
                
      ))
  ))