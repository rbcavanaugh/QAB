# next:

# construct a dataframe that has the possible options for data entry to programmatically display an input
library(here)
library(shiny)
library(shinyWidgets)
library(shinysense)
source('www/english.R')
source('www/english_qs.R')


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
                                          "3" = "form3")
                              # ,
                                          # "1A" = "form1a",
                                          # "2A" = "form2a",
                                          # "3A" = "form3a")
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
                         ),
                        br(), br(),
                        citation, a("Link to PDF", href = "https://aphasialab.org/papers/wilson18plosone.pdf", target = "_blank"),

                  )

         ),
         tabPanel(title = tabtitle1,
                  column(width = 2),
                  column(width = 8, align = "center",
                      fluidRow(uiOutput("slide")),
                      fluidRow(
                              div(align = "center", style = "width: 50%;",
                                  actionButton("back", backbutton),
                                  actionButton("nxt", nextbutton)
                                  
                              )
                      )
                  ),
                  column(width = 2, align = "left",
                         uiOutput("discourse")
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
        if(values$i > values$n+4){
            values$i = values$n
            updateNavbarPage(session, "mainpage",
                             selected = tabtitle2)
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
    })
    
    output$slide <- renderUI({
        
        if(values$i==0){
            section1
        } else if (values$i == 1){
            section2
        } else if (values$i == 2){
            share_div
        } else if (values$i == 3){
            div(align = "center", style = "padding: 0; margin:0;",
                       tags$img(src = paste0(input$form, "/", input$language, "-page-", "2", ".jpg")),
                       textAreaInput("pic1_sample", "Transcribe:", width = "50%", height = "35px")
            )
        } else if (values$i == 4){
          stop_share_div
        } else if (values$i == 5){
          section4
          
          
        } else if (values$i == 4){
            div(align = "center", style = "padding: 0; margin:0;",
                tags$img(src = paste0(input$form, "/", input$language, "-page-", "3", ".jpg")),
                textAreaInput("pic2_sample", "Transcribe:", width = "50%", height = "35px")
            )
        } else if (values$i == 5){
          div(align = "center", style = "padding: 0; margin:0;",
              tags$img(src = paste0(input$form, "/", input$language, "-page-", "2", ".jpg")),
              textAreaInput("pic1_sample", "Transcribe:", width = "50%", height = "35px")
          )
          
          
          } else{
        tmp = paste0(input$form, "/", input$language, "-page-", values$i-4, ".jpg")
        print(tmp)
        tags$img(src = tmp)
        }
    })
    
    output$discourse <- renderUI({
        if(values$i > 0 & values$i < 4){
            actionButton("discourse", "Rate Discourse")
        }
    })
    
    observeEvent(input$discourse, {
      showModal(modalDialog(
        title = "Rate Discourse",
        score_discourse_div,
        size= "l",
        easyClose = T
      ))
    })

    
}

# Run the application 
shinyApp(ui = ui, server = server)







