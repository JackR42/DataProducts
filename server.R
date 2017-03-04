library(shiny)

bmi <- function(weight, height) {
  return ( weight / height^2 )
}

shinyServer(function(input, output) {

  output$result <- renderText({
    bmi = bmi(weight = input$weight, height = input$height/100)
    
    if      (bmi <  15.0) info = "<span style='color: red'>Very severely underweight</span>"
    else if (bmi <= 16.0) info = "<span style='color: red'>Severely underweight</span>"
    else if (bmi <= 18.5) info = "<span style='color: orange'>Underweight</span>"
    else if (bmi <= 25.0) info = "<span style='color: green'>Normal (healthy weight)</span>"
    else if (bmi <= 30.0) info = "<span style='color: orange'>Overweight</span>"
    else if (bmi <= 35.0) info = "<span style='color: red'>Obese Class I (Moderately obese)</span>"
    else if (bmi <= 40.0) info = "<span style='color: red'>Obese Class II (Severely obese)</span>"
    else                  info = "<span style='color: red'>Obese Class III (Very severely obese)</span>"
    
    paste0("Weight: ", input$weight, " kg<BR>Length: ", input$height, " cm<BR>BMI: ", "<code>", round(bmi, 2), "</code>", "<BR>Category: ", info)
  })
  
  output$graph <- renderText({
#    "<img style='width: 40em; margin-top: 1em' src='https://upload.wikimedia.org/wikipedia/commons/e/e9/Body_mass_index_chart.svg' title='Body mass index chart (Wikipedia)' />"  
#    "<img style='width: 40em; margin-top: 1em' src='https://upload.wikimedia.org/wikipedia/commons/2/2c/Body_mass_index.png' title='Body mass index chart' />"  
    "<img style='width: 40em; margin-top: 1em' src='https://afvallen.digi-aanbieding.nl/files/2011/05/bmi-tabel.png' title='Body mass index chart'/>"  
#    "<img style='width: 40em; margin-top: 1em' src='https://medanth.wikispaces.com/file/view/bmi-chart2.jpg/425387882/bmi-chart2.jpg' />"  
    })  
})

