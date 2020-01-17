#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Personal Finances"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h4('Income'),
            numericInput('income', 'Monthly Income ($)', 5000000000),
            numericInput('investments', 'Monthly Vested Investments ($)', 1000000000),
            h4('Costs'),
            numericInput('monthlyRent', 'Monthly Rent ($)', 100000),
            numericInput('monthlyUtilities', 'Monthly Utilities ($)', 10000),
            numericInput('monthlyInsurance', 'Monthly Insurance ($)', 10000),
            numericInput('monthlyCar', 'Monthly Car Payment($)', 8000),
            numericInput('monthlyFood', 'Monthly Food Costs($)', 10000)
        ),

        # Show a plot of the generated distribution
        mainPanel(
         h4('Yearly Income ($)'),
         textOutput("yearlyIncome"),
         h4('Yearly Costs ($)'),
         textOutput(("yearlyCosts")),
         h4('Yearly Savings ($)'),
         textOutput("yearlySavings"),
         br(),
         h4('Instructions'),
         helpText("This application is designed to allow people to calculate their potential yearly savings from one month of their income and costs."),
         code("Yearly Savings")
        )
    )
))
