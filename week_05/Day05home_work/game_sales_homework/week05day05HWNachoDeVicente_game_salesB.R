

#homework_game_sales
# I spent several hours on Friday and Saturday on my personal project but I got nothing.
# So from the skeleton of the Romans I did this small app.
# Basically, the idea is that any user can decided with developer is better according with genre.
# The second "page" should be a distribution between platform and genre.But  no works.


library(shiny)
library(tidyverse)
library(ggplot2)
library(bslib)
library(CodeClanData)
library(shinyjs)

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
         
         br(),
         br(),
           # the variables choosen
         column(6,
                selectInput("genre_input", label = h3("Genre"), #h3 size phrase()
                            choices = game_sales$genre)
         ),
         column(6,
                selectInput("developer_input", label = h3("Developer"),
                            choices = game_sales$developer)
         ),
         
        
        )
      )
    ),      
          #second panel, I was fail to obtain the result I wanted 
         tabPanel( 
           "MORE GAME",
           column(6,
                  selectInput("platform_input", label = h3("Platform"), #h3 size phrase()
                                                 choices = game_sales$platform)
           ),
           column(6,
                  selectInput("genre_input", label = h3("Genre"), #h3 size phrase()
                              choices = game_sales$genre)
           ),
      )
           
  ),      
    
  
  
  # These are the plots to show ALL plots from games_sales
  mainPanel(
    plotOutput("genre_plot"),
    plotOutput("platform_plot")
      )
     )


  
server <- function(input, output) {

      # We would like to know the perception between genre and developer fill by user_score
         output$genre_plot <- renderPlot({
        game_sales %>% 
        filter(genre == input$genre_input) %>% 
        filter(developer == input$developer_input) %>% 
        ggplot(aes(x = developer, y = genre , fill = user_score))+
        geom_col()
      })
      
      # Now we wants to know the distribution between platforms and genres
        output$platform_plot <- renderPlot({
        game_sales %>%
            filter(platform ==input$platform) %>%
            filter(genre == input$genre_input) %>%
            ggplot(aes(x = platform , y = genre))+
            geom_point()
        })


   
    
}

# Run the application 
shinyApp(ui = ui, server = server)
