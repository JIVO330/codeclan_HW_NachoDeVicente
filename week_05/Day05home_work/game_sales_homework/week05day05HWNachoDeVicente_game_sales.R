

#homework_game_sales



library(shiny)
library(tidyverse)
library(ggplot2)
library(bslib)
library(CodeClanData)

CodeClanData::game_sales



view(game_sales)






ui <- fluidPage(
  # Application title
  titlePanel("Who Win?"),
  theme = bs_theme(bootswatch ="superhero", version = 5 ),  
  # creation of 3 spaces/tables
  tabsetPanel(
    tabPanel(
      "PLAY",
      (fluidRow
       (
         
         column(4,
                selectInput("genre_input", label = h3("Genre"), #h3 size phrase()
                            choices = game_sales$genre)
         ),
         # column(4,
         #        selectInput("platform_input", label = h3("Platform"), #h3 size phrase()
         #                    choices = game_sales$platform)
         # ),
         column(4,
                selectInput("developer_input", label = h3("Developer"),
                            choices = game_sales$developer)
         )
         
        )
      )
    ),
  
  
  # This is the plot to show games_sales
  mainPanel(
    plotOutput("play_plot")
    
      )
     )
    )

  
server <- function(input, output) {

    output$play_plot <- renderPlot({
      # know the   user score to any developer in any genre
      game_sales %>% 
        filter(genre == input$genre_input) %>% 
        #filter(user_score == input$score_input) %>% 
        filter(developer == input$developer_input) %>% 
        ggplot(aes(x = developer, y = genre , fill = user_score))+
        geom_col()
      
      
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
