#' map UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_map_ui <- function(id){
  ns <- NS(id)
  tagList(
    leafletOutput(ns("map"))
  )
}

#' map Server Function
#'
#' @noRd 
#'  @import leaflet.extras
mod_map_server <- function(input, output, session){
  ns <- session$ns
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("Stamen.Watercolor") %>% 
      addPolylines(data = store$track) %>%
      addMarkers(
        lat = store$data$stations$station_lat, 
        lng = store$data$stations$station_lon, 
        label = paste0(store$data$stations$name, " - ",store$data$stations$title),
        icon = store$crossIcon,
        layerId = store$data$stations$id
      ) %>%
      addControlGPS()
  })
  
  observeEvent(input[[paste0("map","_marker_click")]], {
    station_id = input[[paste0("map","_marker_click")]]$id
    store$setSelectedStation(station_id)
  })
  
  observeEvent(store$selectedStation(), {
    station = getStationById(store$selectedStation())
    
    leafletProxy('map', session) %>%
      flyTo(lng = station$station_lon,lat = station$station_lat, zoom = 14)
  }, ignoreInit = TRUE)
  
}

## To be copied in the UI
# mod_map_ui("map_ui_1")

## To be copied in the server
# callModule(mod_map_server, "map_ui_1")

