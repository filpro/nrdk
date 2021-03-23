gridTemplate <- grid_template(
  default = list(
    areas = rbind(
      c("info"),
      c("route_info"),
      c("map")
    ),
    cols_width = c("100%"),
    rows_height = c("auto","60px", "50%")
  ),
  mobile = list(
    areas = rbind(
      "info",
      "map",
      "route_info"
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

boxGridTemplate <- grid_template(
  default = list(
    areas = rbind(
      c("title","value")
    ),
    cols_width = c("50%", "50%"),
    rows_height = c("auto")
  ),
  mobile = list(
    areas = rbind(
      "title",
      "value"
    ),
    rows_height = c("auto", "auto"),
    cols_width = c("100%")
  )
)


boxesGridTemplate = grid_template(
  default = list(
    areas = rbind(
      c("box1","box2", "box3")
    ),
    cols_width = c("auto","auto","auto"),
    rows_height = c("auto")
  ),
  mobile = list(
    areas = rbind(
      "box1",
      "box2",
      "box3"
    ),
    rows_height = c("auto", "auto"),
    cols_width = c("100%")
  )
)