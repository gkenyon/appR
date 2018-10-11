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
library(htmltools)
library(htmlwidgets)
#Data

edanR <- readRDS("edanR.rds")
img <- edanR$IDS_URL

# Define UI for application that draws a histogram
ui <- fluidPage(theme = "bootstrap.css",
                 titlePanel
                ("Mappable"),
  leafletOutput("mymap",height = 1000)
)
  
# Define server logic required to draw a map
server <- function(input,output, session){
  
  # Create the map
  output$mymap <- renderLeaflet({
    m <- leaflet(data = edanR) %>%
      addTiles() %>%
      addEasyButton(easyButton(
        icon="fa-globe", title="Zoom to Level 1",
        onClick=JS("function(btn, map){ map.setZoom(1); }"))) %>%
      addEasyButton(easyButton(
        icon="fa-crosshairs", title="Locate Me",
        onClick=JS("function(btn, map){ map.locate({setView: true}); }")))%>%
      setView(lng=-77.009305, lat=38.885611 , zoom=10)%>%
      addCircleMarkers(~lat, ~lng, color = "Green", radius = 6, fillOpacity= .6, stroke = FALSE, clusterOptions = markerClusterOptions(freezeAtZoom = 18),
                       popup = popupImage(img, src="remote")
      )
m
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

