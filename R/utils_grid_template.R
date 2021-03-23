gridTemplate <- grid_template(
  default = list(
    areas = rbind(
      c("info", "info", "info"),
      c("map", "map", "map")
    ),
    cols_width = c("400px", "auto", "auto"),
    rows_height = c("auto", "50%")
  ),
  mobile = list(
    areas = rbind(
      "info",
      "info",
      "map"
    ),
    rows_height = c("auto", "auto","100px"),
    cols_width = c("100%")
  )
)

infoGridTemplate <- grid_template(
  default = list(
    areas = rbind(
      c("title"),
      c("details")
    ),
    cols_width = c("auto"),
    rows_height = c("auto", "auto")
  ),
  mobile = list(
    areas = rbind(
      "title",
      "details"
    ),
    rows_height = c("auto", "auto"),
    cols_width = c("100%")
  )
)