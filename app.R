# next:

# construct a dataframe that has the possible options for data entry to programmatically display an input

library(shiny)
library(shinyWidgets)
source('www/english.R')

# Define UI for application that draws a histogram
ui <- navbarPage(title = pagetitle, id = "mainpage",
         tabPanel(tabtitle0,
                  column(width = 4,
                         h2(welcome),
                  intro1,
                  intro2,
                  br(), br(),
                  textInput("name", nameinput),
                  textAreaInput("other", otherinput),
                  airDatepickerInput(
                      inputId = "date",
                      label = dateinput,
                      multiple = FALSE,
                      value = Sys.time(),
                      timepicker = TRUE,
                      timepickerOpts = timepickerOptions(
                          dateTimeSeparator = " at ",
                          minutesStep = 10,
                          hoursStep = 1
                      )
                  ),
                  selectInput("form", "Choose a form", selected = "1", 
                              choices = c("1" = "form1",
                                          "2" = "form2",
                                          "3" = "form3",
                                          "1A" = "form1a",
                                          "2A" = "form2a",
                                          "3A" = "form3a")
                  ),
                  selectInput("language", "Choose a Language", choices = c("English" = "english")),
                  "(Only english current set up)"
                  ),
                  column(width = 1),
                  column(width = 6,
                         h3("Instructions:"), br(),
                         instruction1,
                         br(),
                        instruction2,
                         br(),
                        instruction3, 
                        br(),
                        instruction4,
                         br(), br(), br(),
                         div(align = "center",
                         actionButton("start", inputstart)
                         )
                         
                  )

         ),
         tabPanel(title = tabtitle1, 
                  column(width = 12, align = "center",
                  uiOutput("slide"),
                  br(),
                  br(),
                  br(),
                      div(align = "center", style = "width: 40%;",
                          actionButton("back", backbutton), actionButton("nxt", nextbutton), br(), br(),
                        progressBar(id = "progress_bar", value = 0, display_pct = F, size = "xs")
                      )
                  )
         ),
         tabPanel(title = tabtitle2, 
                  
                  resultstext

                  
         )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

    values = reactiveValues()
    values$i = 0
    
    observe({
        # if regular form, its going to be = 19, if extended, then 36. can use these two numbers to detech which form. 
        values$n <- length(list.files(here('www', input$form)))-1
        print(values$n)
        print(values$i)
    })
    
    observeEvent(input$nxt, {
        values$i = values$i+1
        if(values$i > values$n){
            values$i = values$n
            updateNavbarPage(session, "mainpage",
                             selected = tabtitle2)
            } else {
        updateProgressBar(session = session, id = "progress_bar", value = (values$i/(values$n+1))*100, total = 100)
            }
    })
    
    observeEvent(input$back, {
        values$i = values$i-1
        if(values$i < 0){
            values$i = 1
            updateNavbarPage(session, "mainpage",
                             selected = tabtitle0)
        } else {
        }
    })
    
    observeEvent(input$start, {
        values$i = 0
        updateNavbarPage(session, "mainpage",
                          selected = tabtitle1)
        updateProgressBar(session = session, id = "progress_bar", value = 0, total = 100)
    })
    
    output$slide <- renderUI({
        tmp = paste0(input$form, "/", input$language, "-page-", values$i, ".jpg")
        print(tmp)
        tags$img(src = tmp)
    })

    
}

# Run the application 
shinyApp(ui = ui, server = server)
