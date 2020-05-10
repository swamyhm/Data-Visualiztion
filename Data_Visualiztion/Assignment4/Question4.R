shiny::runApp(list(
  ui = bootstrapPage(
    
    tabsetPanel(id = "mainTab",
                tabPanel("Condition1", tabsetPanel(id = "subTab1", 
                                                   tabPanel("High",value=1),
                                                   tabPanel("medium",value=2),
                                                   tabPanel("low",value=3),
                                                   selected = 1
                )),
                tabPanel("Condition2", tabsetPanel(id = "subTab2", 
                                                   tabPanel("high",value=1),
                                                   tabPanel("medium",value=2),
                                                   tabPanel("low",value=3),
                                                   selected = 1
                ))
    )
    
  ),
  server = function(input, output,session) {
    
    current_subtab<-reactiveValues(selected=1)
    
    
    observeEvent(c(input$subTab1,input$subTab2),{
      if(input$mainTab=="Condition1"){
        current_subtab$selected<-input$subTab1
      }else if(input$mainTab=="Condition2"){
        current_subtab$selected<-input$subTab2
      }
    })
    
    observeEvent(input$mainTab,{
      if(input$mainTab=="Condition1"){
        updateTabsetPanel(session,"subTab1",selected = current_subtab$selected)
      }else if(input$mainTab=="Condition2"){
        updateTabsetPanel(session,"subTab2",selected = current_subtab$selected)
      }
    })
  }
))




