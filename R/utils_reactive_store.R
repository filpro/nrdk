#' @import modules
#' @import shiny
#' @import sf
#' @import tidyr
#' @import readxl
#' @import leaflet
store = module({
  data = list(
    route = readRDS('inst/data.RDS'),
    stations = read_xlsx('inst/stations.xlsx')
  )
  track = read_sf("inst/NRDK-2021.gpx", layer = "track_points") %>%
    separate(col = time, into = c("date", "timepoint"), sep = " ", remove = FALSE) %>%
    st_combine() %>%
    st_cast(to = "LINESTRING") %>%
    st_sf()
  crossIcon <- iconList(makeIcon("inst/cross.png", iconWidth = 30))
  
  .selectedStation = reactiveVal(data$stations$id[1])
  selectedStation = function() .selectedStation()
  setSelectedStation = function(id) .selectedStation(id)
  
  
})




