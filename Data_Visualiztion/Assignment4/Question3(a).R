library(shiny)

app <- shinyApp(
  ui = fluidPage(fluidRow(h1('Split Layout')),
                 fluidRow(
                   
                   column(
                     4,
                     splitLayout(
                       cellWidths = c('50%', '35%', '25%'),
                       textInput('High', label = 'condition'),
                       selectInput('letter', 'option1', LETTERS),
                       selectInput('letter', 'option2', letters)
                     ),
                     splitLayout(
                       cellWidths = c('50%', '35%', '25%'),
                       textInput('high', label = 'condition'),
                       selectInput('letter', 'option3', LETTERS),
                       selectInput('letter', 'option4', letters)
                     ),
                     splitLayout(
                       cellWidths = c('50%', '35%', '25%'),
                       textInput('high', label = 'condition'),
                       selectInput('letter', 'option5', LETTERS),
                       selectInput('letter', 'option6', letters)
                     )
                   )
                   
                 )),
  
  server = function(input, output) {
  }
)

