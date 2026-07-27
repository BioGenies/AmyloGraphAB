source("prepare-data.R")
file.copy("./data/amyloids-additional-data.csv", "./docs/amyloids-additional-data.csv")

quarto::quarto_preview()
quarto::quarto_preview_stop()
