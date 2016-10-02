library(shiny)
library(psych)


shinyServer(function(input, output, session) {
  

  output$RPI <- renderText({
    if (input$ROC == 3) {
      M <- 490.4843591
    } else if (input$ROC == 4) {
      M <- 499.3864715
    } else {
      M <- 507.7411568
    }
    x <- input$x/100
    
    RPI <- round(1/(1+exp(-(log(3)/10*(input$W1-M)-log((1-x)/x))))*100, digits=0)
    paste(RPI, input$x, sep="/")
  })
  
})