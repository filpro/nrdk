#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {

  
  callModule(mod_stations_list_server, "stations_list_ui_1")
  callModule(mod_map_server, "map_ui_1")
  callModule(mod_info_server, "info_ui_1")
}
