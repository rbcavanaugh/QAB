# next:

# construct a dataframe that has the possible options for data entry to programmatically display an input

library(shiny)
library(shinyWidgets)

# Define UI for application that draws a histogram
ui <- navbarPage(title = "Remote Quick Aphasia Battery", id = "mainpage",
         tabPanel("Home",
                  br(), br(),
                  "Information about the app",
                  br(), br(),
                  "Also information to enter for creating a downloadable record",
                  br(), br(),
                  selectInput("form", "Choose a form", selected = "Form 1", 
                              choices = c("Form 1" = "form1",
                                          "Form 2" = "form2",
                                          "Form 3" = "form3",
                                          "Form 1A" = "form1a",
                                          "Form 2A" = "form2a",
                                          "Form 3a" = "form3a")
                  ),
                  br(), br(),
                  actionButton("start", "Start Assessment")

         ),
         tabPanel(title = "Assessment", 
                  column(width = 12, align = "center",
                  uiOutput("slide"),
                  br(),
                  br(),
                  br(),
                      div(align = "center", style = "width: 40%;",
                          actionButton("back", "Back"), actionButton("nxt", "Next"), br(), br(),
                        progressBar(id = "progress_bar", value = 0, display_pct = F, size = "xs")
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
    
    observe({
        values$n <- length(list.files(here('www', input$form)))-1
        print(values$n)
        print(values$i)
    })
    
    observeEvent(input$nxt, {
        values$i = values$i+1
        if(values$i > values$n){
            values$i = values$n
            updateNavbarPage(session, "mainpage",
                             selected = "Results")
            } else {
        updateTabsetPanel(session, "tabsetp",
                          selected = paste0("Task", values$i))
        updateProgressBar(session = session, id = "progress_bar", value = (values$i/(values$n+1))*100, total = 100)
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
        updateProgressBar(session = session, id = "progress_bar", value = 0, total = 100)
    })
    
    output$slide <- renderUI({
        tmp = paste0(input$form, "/page-", values$i, ".jpg")
        tags$img(src = tmp)
    })

    
}

# Run the application 
shinyApp(ui = ui, server = server)
