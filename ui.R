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
  titlePanel("Car Selector"),
  
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("mpg",
                   "What is the the gaz consumpion you want, as a minimum miles per galon?",
                   min = floor(min(mtcars$mpg)),
                   max = ceiling(max(mtcars$mpg)),
                   value = median(mtcars$mpg)),
    
    sliderInput("hp",
                "What is the power range you want, in horsepower?",
                min = floor(min(mtcars$hp)),
                max = ceiling(max(mtcars$hp)),
                value = c(median(mtcars$hp)*0.75,median(mtcars$hp)*1.25)),
    
    numericInput("wt",
             "What is the maximum wheight you want, in lbs?",
             value = 1.5*1000*median(mtcars$wt)),
    
    selectInput("am",
                "What kind of transmission do you what?",
                c("Automatic","Manual"))
   
    ),
    

    
    # Show a plot of the generated distribution
    mainPanel(
          p("This tools allows you to find the perfect car you've always wanted. Just indicate your selection criteria on the left planel and the results of your request will be displayed below. Do not be too resctrictive on the creteria!"),
          
          h3("Here are the best cars for you"),
          
          fluidRow(
                column(12,
                       tableOutput("Table")
                )
          ),
          
          h3("Documentation"),
          p("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models)."),
          h4("Settings"),
          p("Gaz consumption: Please what is the minimul miles per gallon in mpg"),
          p("Horse power: Please indicate the range in horse power in hp"),
          p("Weight: Please indicate the maximum weight in lbs"),
          p("Transmission: please indicate whetere you want a automatic or manual transmission")
    )
  )
))
