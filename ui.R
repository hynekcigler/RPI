library(shiny)
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Rozšířená interpretace testu TIM"),
  
  sidebarPanel(
    h3("Zadání"),
    selectInput(
      "vlastni", "Jaký test chcete zadat?",
      c(TIM="tim",
        vlastní = "muj")),
    
    conditionalPanel(condition = "input.vlastni == 'tim'",
                     
      numericInput("W1", "Dosažené W-skóre žáka", 500, step=1, width="300px"),
      numericInput("ROC", "Ročník", 3, min=3, max= 5, step=1, width="300px"),
      numericInput("x", "Základ pro RPI index (v %)", 10, min=1, max= 99, width="300px")
      ),
    conditionalPanel(condition = "input.vlastni == 'muj'",
                     numericInput("W1", "Dosažené IRT skóre", 500, step=1, width="300px"),
                     numericInput("M", "Průměrné skóre v kategorii", 490, width="300px"),
                     numericInput("x", "Základ pro RPI index (v %)", 10, min=1, max= 99, width="300px"),
                     selectInput(
                       "skala", "škála Raschova modelu",
                       c(logitová="logit",
                         W_škála = "wscore",
                         jiná = "jine")),
                     conditionalPanel(condition = "input.skala == 'jine'",
                                      numericInput("a", "Diskriminační parametr", 1, width="300px")
                                      )
                     
    )
    ), 
  
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    h3("Výsledný RPI index:", textOutput("RPI", inline=T))
    
    
    
    

)))