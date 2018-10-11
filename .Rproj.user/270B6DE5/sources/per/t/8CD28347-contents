#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(dplyr)
library(tidyr)
library(mapview)
#Data

edanR <- readRDS("edanR.rds")

# Define UI for application that draws a histogram
ui <- fluidPage(
  leafletOutput("mymap",height = 1000)
)
  
# Define server logic required to draw a map
server <- function(input,output, session){
  
  # Create the map
  output$mymap <- renderLeaflet({
    m <- leaflet(data = edanR) %>%
      addTiles() %>%
      setView(lng=-77.009305, lat=38.885611 , zoom=10)%>%
      addCircleMarkers(~lat, ~lng, color = "Green", radius = 6, fillOpacity= .6, stroke = FALSE, clusterOptions = markerClusterOptions(freezeAtZoom = 18)
      )
m
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

