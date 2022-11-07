

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
  titlePanel("Who Win"),
  #theme = bs_theme(bootswatch =" " ),  
  # creation of 3 spaces/tables
  tabsetPanel(
    tabPanel(
      "SPQR",
      (fluidRow
       (
         
         column(4,
                selectInput("genre_input", label = h3("Genre"), #h3 size phrase()
                            choices = list("Germania" = 1, "Panonia" = 2, "Judea" = 3), 
                            selected = 1)
         ),
         column(4,
                selectInput("score_input", label = h3("User Score"), #h3 size phrase()
                            choices = list("Spain" = 1, "Tunisia" = 2, "Egipt" = 3), 
                            selected = 1)
         ),
         column(4,
                selectInput("developer_input", label = h3("Developer"),
                            choices = list("StatusA" = 1, "StatusB"= 2, "StatusC" = 3),
                            selected = 1)
                
         )
       )
       
       
      )),
    
    
    
    
    
    tabPanel(
      "About",# About the app
      br(),
      br(),
      h3("This shiny dashboar have been created with the intention of fun, enjoy and expand the knowledge over the base of the work of Jack Hanson."),
      br(),
      h4("As we said, the core of this Database are the monograph of Jack Hanson and his own database - try to be thankfully homenage-"),
      br(),
      h4("Hanson, J. W. (2016a). An Urban Geography of the Roman World, 100 B.C. to A.D. 300. University of Oxford D.Phil."),
      br(),
      h4("Hanson, J. W. (2016b). An Urban Geography of the Roman World, 100 B.C. to A.D. 300. Oxford: Archaeopress."),
      br(),
      h4("Hanson, J. W. (2016). Cities Database (OXREP databases). Version 1.0. Accessed (date): <http://oxrep.classics.ox.ac.uk/databases/cities/>. DOI: <https://doi.org/10.5287/bodleian:eqapevAn8>"),
      br(),
      br(),
      h4("Also, you can visit the website :"),
      br(), 
      br(),
      h3 (tags$a("The Oxford Roman Economy Project", href = "http://oxrep.classics.ox.ac.uk/"  ))
    )
    
  ), 
  
  
  
  
  
  # This is the plot to show the cities of the Empire
  mainPanel(
    plotOutput("city_plot")
    
  )
)

    
  
  
  
  
  
  
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
