#' stations_list UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_stations_list_ui <- function(id){
  ns <- NS(id)
  tagList(
      uiOutput(ns("list"))
  )
}
    
#' stations_list Server Function
#'
#' @noRd 
#' @import purrr
mod_stations_list_server <- function(input, output, session){
  ns <- session$ns

  output$list <- renderUI({
    store$data$stations %>% pmap(function(id, name, description, title, station_lat, station_lon){
      id = paste0(id)
      
      observeEvent(input[[id]], {
        store$setSelectedStation(id)
      })
      
      tagList(
        actionButton(ns(id), label = name, width = '100%', style='font-size:100%'),
        hr()
      )
    })
  })
  
  

 
}
    
## To be copied in the UI
# mod_stations_list_ui("stations_list_ui_1")
    
## To be copied in the server
# callModule(mod_stations_list_server, "stations_list_ui_1")
 
