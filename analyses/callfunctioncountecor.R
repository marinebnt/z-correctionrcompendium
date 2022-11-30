# dir.create("R")
# usethis::use_r("importdata") # créer nouveau fichier

remotes::install_deps(upgrade = "never")
pkgload::load_all()

source(here::here("R", "nombreecoregions.R"))


Family = "Felidae"
returndata= returndata() #name = Family)
nombreecoregions = nombreecoregions(returndata)
plotspecoreg = plotspecoreg(nombreecoregions)

rmarkdown::render("index.rmd")
