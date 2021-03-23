#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shiny.semantic
#' @import semantic.dashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    dashboardPage(
      dashboardHeader(title = "NRDK 2021"),
      dashboardSidebar(sidebarMenu(mod_stations_list_ui("stations_list_ui_1"))),
      dashboardBody(
        grid(
          gridTemplate,
          map = mod_map_ui("map_ui_1"),
          info = mod_info_ui("info_ui_1"),
          container_style = "grid-gap: 1vh"
        ),
        width = 11
      )
      
    )
  )
}
#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'NRDK 2021'
    )
  )
}
