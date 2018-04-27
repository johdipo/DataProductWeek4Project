#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
      
      ## Processing dataframe
      mtcars2 <- data.frame(Name = rownames(mtcars),
                           MilesPerGallon = mtcars$mpg,
                           Weight = mtcars$wt,
                           HorsePower = mtcars$hp,
                           Transmission = mtcars$am)
      mtcars2$Weight <- mtcars2$Weight*1000
      mtcars2$Transmission <- ifelse(mtcars2$Transmission == 0, "Automatic", "Manual")
      
      
      ## Selecting upon filters
      selection <- reactive(
            mtcars2 %>%
                  select(Name, Weight, HorsePower, Transmission, MilesPerGallon) %>%
                  filter(MilesPerGallon > input$mpg) %>%
                  filter(HorsePower > input$hp[1]) %>%
                  filter(HorsePower < input$hp[2]) %>%
                  filter(Weight < input$wt) %>%
                  filter(Transmission == input$am)
      )
      
      output$Table <- renderTable({
            selection()
      })
      
      
})
