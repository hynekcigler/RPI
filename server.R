library(shiny)
library(psych)


shinyServer(function(input, output, session) {

  test <- reactive({input$vlastni})
  

    output$RPI <- renderText({ ## if TIM test is used
      if (test() == "tim") {
        
        if (input$ROC == 3) {
          M <- 490.4843591 ## mean for grade 3
        } else if (input$ROC == 4) {
          M <- 499.3864715 ## mean for grade 4
        } else {
          M <- 507.7411568 ## mean for grade 5
        }
        x <- input$x/100 ## percent correct to probability
        
        RPI <- round(1/(1+exp(-(log(3)/10*(input$W1-M)-log((1-x)/x))))*100, digits=0) ## RPI estimation
        paste(RPI, input$x, sep="/") ## format RPI
      } else {
        output$RPI <- renderText({ ## if user test is used
          if (input$skala=="logit") {
            a <- 1 ## discrimination parameter for logit scale
          } else if (input$skala=="wscore") {
            a <- log(3)/10 ## discrimination parameter for W-score scale
          } else {
            a <- input$a ## user discrimination parameter
          }
          x <- input$x/100
          RPI <- round(1/(1+exp(-(a*(input$W1-input$M)-log((1-x)/x))))*100, digits=0) ## RPI estimation
          paste(RPI, input$x, sep="/") ## format RPI
        })
      }
      
      
    })


  
})