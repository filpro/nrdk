#' info UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_info_ui <- function(id){
  ns <- NS(id)
  tagList(
    grid(
      infoGridTemplate,
      title = uiOutput(ns("title")),#,
      details = uiOutput(ns("details"))
    )
  )
}

#' info Server Function
#'
#' @noRd 
mod_info_server <- function(input, output, session){
  ns <- session$ns
  
  
  
  observeEvent(store$selectedStation(), {
    station = getStationById(store$selectedStation())
    
    output$title <- renderUI({

        div(class = "ui horizontal divider", station$name)

    })
    
    output$details <- renderUI({
      card(style="width: 100%",
           div(class="content",
               div(class="title", strong(station$title)),
               div(class="description", HTML(station$description))
           )
      )
    })
  })
}

## To be copied in the UI
# mod_info_ui("info_ui_1")

## To be copied in the server
# callModule(mod_info_server, "info_ui_1")

