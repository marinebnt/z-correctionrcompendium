library(targets)
library(tarchetypes)

tar_source()

list(
  tar_target(datajoined, returndata()),
  tar_target(dataecoregion, nombreecoregions()),
  tar_target(histspecoreg, plotspecoreg()),
  tar_target(callfunctioncountecor, c(datajoined, dataecoregion, histspecoreg)),
  tar_target(rmarkdown::render("index.Rmd"), callfunctioncountecor.R)
)