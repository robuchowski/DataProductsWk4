#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$yearlySavings <- renderText({calculateyearlySavings(input$income, input$investments, input$monthlyRent, input$monthlyUtilities, input$monthlyCar, input$monthlyInsurance, input$monthlyFood)})
    output$yearlyIncome <- renderText({calculateyearlyIncome(input$income, input$investments)})
    output$yearlyCosts <- renderText({calculateyearlyCosts(input$monthlyRent, input$monthlyUtilities, input$monthlyInsurance, input$monthlyCar, input$monthlyFood)})
    })

calculateyearlySavings <- function(income, investments, monthlyRent, monthlyUtilities, monthlyInsurance, monthlyCar, monthlyFood){
    result <- ((income * 12) + (investments * 12)) + ((-monthlyRent * 12) + (-monthlyUtilities * 12) + (-monthlyInsurance * 12) + (-monthlyCar * 12) + (-monthlyFood *12))
    return(round(result, digits = 2))
}

calculateyearlyIncome <- function(income, investments){
    result <- (income * 12) + (investments * 12)
    return(round(result, digits = 2))
}

calculateyearlyCosts <- function(monthlyRent, monthlyUtilities, monthlyInsurance, monthlyCar, monthlyFood){
    result <- ((monthlyRent * 12) + (monthlyUtilities * 12) + (monthlyInsurance * 12) + (monthlyCar * 12) + (monthlyFood * 12))
    return(round(result, digits = 2))
}

