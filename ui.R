
#load libraries
library(shiny)
library(ggplot2)
library(plotly)
library(tidyr)
library(EpiModel)

dcm_widget <- radioButtons(inputId =  "dcm_widget", label = h5("Mandatory Mask-Wearing"),
                           choices = list("No Mask" = 1, "Mask" = 2))
icm_widget <- radioButtons(inputId =  "icm_widget", label = h5("Mandatory Mask-Wearing"),
                           choices = list("No Mask" = 1, "Mask" = 2))

dcm_page <- tabPanel(
  "Deterministic Models",
  sidebarLayout(       
    sidebarPanel( 
      dcm_widget,
    ),           
    mainPanel(                
      plotOutput(outputId ="dcm"),
    )))

icm_page <- tabPanel(
  "Stochastic Models",
  sidebarLayout(             
    sidebarPanel( 
      icm_widget
    ),           
    mainPanel(
      plotOutput(outputId ="icm"),
    )))

introduction_page <- tabPanel(
  title="Introduction", id="Intro",
  img(
    src = "https://media.istockphoto.com/vectors/face-masks-required-vector-id1256389612?k=20&m=1256389612&s=612x612&w=0&h=rTvqapUJxvoQUt-kChlAzdIg-ObEHgN-XJfXufg_6Ng=",
    width = "200px", height = "200px"
  ),
  h4("Introduction"),
  p("The intention of this assignment is to look at how real world interventions affected Covid-19 over time.
    In this case, the focus is on the effectiveness of mask mandates on Covid-19 rates.
    The models show how masking versus no masking affects those who are susceptible, infected, and recovered over time.")
)

interpretation_page <- tabPanel(
  title="Interpretations", id="Inter",
  h4("Interpretation for Stochastic Model"), br(),
  p("In the stochastic model, we can see a slight shift in the number of people susceptible. With no masks, it started from 1500 people being susceptible
        before droping to around 900 and flattening out. With masks, the number of susceptible started at 1000 before rising a little to around 1200 and flattening out."),
  p("We can also see that there is a significant gap between those that are susceptible and those that are infected."),
  h4("Interpretation for Deterministic Model"), br(),
  p("In the deterministic model, we can see that wearing masks helps bring down the number of infected people. This is
        encouraging to see as it is what has been told to us by the government."),
  p("On the other hand the number of people susceptible and the the number of recoveries lessen in this sample size."),
  h4("Differences between DCM and ICM"), br(),
  p("Because of the randomness and variability, stochastic models take a while to load. There were not that many differences based on the similar datasets used."),
  p("Deterministic models are a general overview of the health trend, while stochastic models can be more attributed to a singular cause using a smaller sample size.")
)

ui <- navbarPage(
  "Disease Modeling",
  introduction_page,
  dcm_page,
  icm_page,
  interpretation_page
)