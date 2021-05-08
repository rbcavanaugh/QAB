section1 <- div(align = "left", style = "padding: 0; margin:0;",
  h3(loc), 
  
  column(width = 6,
    approachable_q,
    div(style = "padding-left: 30px;",
    radioButtons("approach", approachable, choices = c(0,1,2,3,4), inline = T)
    ),
    
    rousable_q,
    div(style = "padding-left: 30px;",
    radioButtons("roused", rousable, choices = c(0,1,2,3,4), inline = T)
    ),
    
    orientable_q,
    div(style = "padding-left: 30px;",
    radioButtons("oriented1", orientable1, choices = c(0,1,2,3,4), inline = T), 
    radioButtons("oriented2", orientable2, choices = c(0,1,2,3,4), inline = T), 
    radioButtons("oriented3", orientable2, choices = c(0,1,2,3,4), inline = T)
    )
  ),
  column(width = 6,
    commands_q,
    div(style = "padding-left: 30px;",
    radioButtons("command1", commands1, choices = c(0,1,2,3,4), inline = T), 
    radioButtons("command1", commands1, choices = c(0,1,2,3,4), inline = T),
    ),
    
    impression_q,
    div(style = "padding-left: 30px;",
    radioButtons("impression", impressionable, choices = c(0,1,2,3,4), inline = T)
    )
  )
)

section2 <- div(align = "left", style = "padding: 0; margin:0;",
                h3(connectedspeech), 
                column(width = 4,
                conversation, br(), br(),
                htmltools::HTML(examples)
                ),
                column(width = 8,
                       textAreaInput("conversational_sample", "Transcribe:", width = "90%", height = "400px"
                                      )
                       )
)

#section3 <- 
#section4 <-







