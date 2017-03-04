library(shiny)

shinyUI(fluidPage(
  titlePanel("Body Mass Index - BMI"),
  sidebarLayout(sidebarPanel(
    p('Your BMI will be calculated according to the following formula: Height / Weight ^ 2'),

    numericInput(
      inputId = "weight",
      label = strong("What is your weight in Kilograms?"),
      value = 78
    ),
    
    numericInput(
      inputId = "height",
      label = strong("What is your height in Centimeters?"),
      value = 178
    )
  ),
    
  mainPanel(
      uiOutput("input"),
      uiOutput("result"),
      uiOutput("graph")
    ))
  ))

# http://srikanthkamineni.github.io/Developing-Data-Products/index.html#5
# https://github.com/ramnathv/slidify