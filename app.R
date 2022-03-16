# load libraries
library(shiny)
require(EpiModel)


source("ui.r")
source("server.r")


shinyApp(ui = ui, server = server)