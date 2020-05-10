library(shiny)
shinyUI(
  runApp(list(
    ui = bootstrapPage(
      textInput(inputId="xlimitsmin", label="minimum", value = 0.0),
      textInput(inputId="xlimitsmax", label="maximum", value = 0.0)
    ),
    server = function(input, output) {}
  ))
)
#select everything and run to run in the window  
 
  
