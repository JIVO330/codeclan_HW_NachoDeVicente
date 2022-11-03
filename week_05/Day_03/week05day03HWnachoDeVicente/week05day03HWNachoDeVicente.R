

library(shiny)
library(tidyverse)
library(bslib)
library(here)

decathlon <- read_csv(here::here("clean_data/decathlon_clean.csv"))



ui <- fluidPage(

    # Application title
    titlePanel(tags$h1("How Many Points", align = "center")),
    theme = bs_theme(bootswatch = "solar"),
    tabsetPanel(
      tabPanel(
        "Points Comparison",
        sidebarLayout(
          sidebarPanel(
                   radioButtons(
              "competition",
              "Decastar or Olympics Games",
              choices = c ("Decastar", "Olympics")
            ),
          ),
          mainPanel(
            plotOutput("pointsPlot")
          )
        )
      ),
      tabPanel(
        "Comments about the games",
        " Decastar is a french competition where the juges are drinking red wine and eating smelling cheese at the same time that the athletes compete against them.", 
        br(),
        " However,Olympics games are celebrating in rich counties that want to be poor after the celebration or in dictatorship nations in order to wash their lack of emphaty with people.",
        "If you want to know more ",
        br(),
        tags$a("The Olympics website", href = "https:www.Olympic.org/"),
        br(),
        tags$a("Decastar games website", href = "https://decastar.fr/en/"),
        plotOutput("namesPlot")
      ),
      tabPanel(
        "Photos", # No work
        imageOutput("decastar_img"),
        imageOutput("olympics_img")
        
      )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$pointsPlot <- renderPlot(
      decathlon %>%
         distinct( competition, points) %>%
          group_by(competition) %>% 
        ggplot(aes(x= competition, y = points, fill = competition))+
        geom_col()+
        scale_fill_manual(values = c("Decastar" =  "Pink", "Olympics" = "Blue")),
        )
      output$namesPlot <- renderPlot(
       decathlon %>%
        distinct(surname, competition, points) %>%
          group_by(surname) %>%
            ggplot(aes(x= surname, y = points, fill = competition))+
              geom_col()+
         theme(axis.text.x = element_text(angle = 45, hjust = 1))+
              scale_fill_manual(values = c("Decastar" =  "Pink", "Olympics" = "Blue")),
      )
      # output$decastar_img <- renderImage({
      #   list(src = "www/header_img.png", width = "50%", height = 400)
      # # }, deleteFile = F)
      
}

shinyApp(ui, server)



      