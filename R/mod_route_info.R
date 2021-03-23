#' route_info UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_route_info_ui <- function(id){
  ns <- NS(id)
  tagList(
    grid(
      boxesGridTemplate,
      container_style = "grid-gap: 1vh",
      box1 =     card(style="width:100%",
        div(class = "content", 
            div(class = "header", 
                grid(
                  boxGridTemplate,
                  title = HTML(paste0(icon("route"), " Od startu")),
                  value = p(textOutput(ns("dist_from_start"), inline = TRUE), style="text-align: end"),
                  container_style = "justify-content: space-between"
                )
            )
        )
      ),
      box2 =  card(style="width:100%",
        div(class = "content", 
            div(class = "header", 
                grid(
                  boxGridTemplate,
                  title = HTML(paste0(icon("route"), " Następna stacja ")),
                  value = p(textOutput(ns("next_station_dist"), inline = TRUE), style="text-align: end"),
                  container_style = "justify-content: space-between"
                )
            )
        )
      ),
      box3 =    card(style="width:100%",
        div(class = "content", 
            div(class = "header", 
                grid(
                  boxGridTemplate,
                  title = HTML(paste0(icon("route"), " Ostatnia stacja")),
                  value = p(textOutput(ns("dist_to_last_station"), inline = TRUE), style="text-align: end"),
                  container_style = "justify-content: space-between"
                )
            )
        )
      )
    )
    
    
  )
}

#' route_info Server Function
#'
#' @noRd 
mod_route_info_server <- function(input, output, session){
  ns <- session$ns
  
  
  observeEvent(store$selectedStation(), {
    station = getStationById(store$selectedStation())
    num_format = function(num) {
      paste0(format(num, digits=3, decimal.mark=",",big.mark=" ", small.interval=3)," km")
    }
    
    output$dist_from_start = renderText(station$cumdist %>% num_format())
    output$next_station_dist = renderText(station$dist_to_station %>% num_format())
    output$dist_to_last_station = renderText(station$dist_to_last_station %>% num_format())
  })
  
  
}

## To be copied in the UI
# mod_route_info_ui("route_info_ui_1")

## To be copied in the server
# callModule(mod_route_info_server, "route_info_ui_1")

