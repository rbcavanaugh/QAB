# next:

# construct a dataframe that has the possible options for data entry to programmatically display an input

library(shiny)
library(shinyWidgets)

# Define UI for application that draws a histogram
ui <- navbarPage(title = "Remote Quick Aphasia Battery", id = "mainpage",
         tabPanel("Home",
                  br(),
                  "Information about the app",
                  br(),
                  "Also information to enter for creating a downloadable record",
                  br(),
                  actionButton("start", "Start Assessment")

         ),
         tabPanel(title = "Assessment", 
                  column(width = 1,
                         div(align = "center",
                         actionButton("back", "Back")
                         )
                         ),
                  column(width = 10, align = "center",
                  uiOutput("slide"),
                  br(),
                  br(),
                  br(),
                      div(align = "center", style = "width: 40%;",
                        progressBar(id = "progress_bar", value = 0, display_pct = F, size = "xs")
                      )

                  ),
                  column(width = 1,
                         div(align = "center",
                         actionButton("nxt", "Next")
                         )
                  )

         ),
         tabPanel(title = "Results", 
                  
                  "This page has the results"

                  
         )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

    values = reactiveValues()
    values$i = 0
    
    observeEvent(input$nxt, {
        values$i = values$i+1
        if(values$i > 19){
            values$i = 19
            updateNavbarPage(session, "mainpage",
                             selected = "Results")
            } else {
        updateTabsetPanel(session, "tabsetp",
                          selected = paste0("Task", values$i))
        updateProgressBar(session = session, id = "progress_bar", value = (values$i/19)*100, total = 100)
            }
    })
    
    observeEvent(input$back, {
        values$i = values$i-1
        if(values$i < 0){
            values$i = 1
            updateNavbarPage(session, "mainpage",
                             selected = "Home")
        } else {
        updateTabsetPanel(session, "tabsetp",
                          selected = paste0("Task", values$i))
        }
    })
    
    observeEvent(input$start, {
        values$i = 0
        updateNavbarPage(session, "mainpage",
                          selected = "Assessment")
    })
    
    output$slide <- renderUI({
        tmp = paste0("page-", values$i, ".jpg")
        tags$img(src = tmp)
    })

    
}

# Run the application 
shinyApp(ui = ui, server = server)
