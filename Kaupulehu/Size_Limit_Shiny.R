# Size Limit Comparison App

#Data
library(tidyverse)
library(here)
library(janitor)
library(LBSPR)
library(dplyr)
library(kableExtra)

# Read in CSV
species <- read_csv(here::here("Kaupulehu", "Species_List.csv"))

#Shiny
library(shiny)

ui <- fluidPage(
  headerPanel('Size Limit Comparison Tool'),
sidebarPanel(
  selectInput('species', 'Species', names(species))))

server <- function(input, output) {
  selectedData <- reactive({
    species[, c(in)]
  })
}

shinyApp(ui = ui, server = server)
