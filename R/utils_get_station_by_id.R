#' @import dplyr
getStationById = function(search_id) {
  store$data$stations %>% filter(id == search_id)
}