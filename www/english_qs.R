
#section3 <- 
#section4 <-

share_div <- 
  div(
    align = "center",
    h2("Share your screen with the participant")
  )

stop_share_div <- 
  div(
    align = "center",
    h2("Stop sharomg your screen with the participant")
  )

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

section2 <- 
  div(align = "left", style = "padding: 0; margin:0;",
      column(width = 3, offset = 1,
             h5("Say ‘Answer yes or no...’ Score as follows: 4 = correct. Nodding and shaking the head, other contextually appropriate alternatives to yes/no, e.g. ‘sometimes’, ‘I don’t think so’, or idiosyncratic responses that demonstrate understanding are acceptable; 3 = correct, but delayed >3 seconds, self-corrected, or repeated; 2 = idiosyncratic response where it is unclear whether or not patient understands; 1 = incorrect, but response suggests some partial comprehension; 0 = incorrect/no response within 6 seconds."),
      column(width = 5,
             (a) Are you a [man/woman]? (Y)
             (b) Am I a [man/woman]? (N)
             (c) Do you cut the grass with an axe? (N)
             (d) Are babies watched by babysitters? (Y)
             (e) Do you open your door with a key? (Y)
             (f) If you’re about to leave, have you left yet? (N) 
             (g) Are witnesses questioned by police? (Y)
             (h) If I tell you I used to smoke, do you think I smoke now? (N) 
             (i) Are doctors treated by patients? (N) 
             (j) If I was at the park when you arrived, did I get there first? (Y) 
             (k) If you’re about to go upstairs, are you still downstairs (Y)
             (l) Are cats chased by mice? (N) 
             6. Repetition
             [0] [1] [2] [3] [4] [0] [1] [2] [3] [4] [0] [1] [2] [3] [4] [0] [1] [2] [3] [4] [0] [1] [2] [3] [4] [0] [1] [2] [3] [4] [0] [1] [2] [3] [4] [0] [1] [2] [3] [4] [0] [1] [2] [3] [4] [0] [1] [2] [3] [4] [0] [1] [2] [3] [4] [0] [1] [2] [3] [4]
      ),
)

section4 <- 
  div(align = "left", style = "padding: 0; margin:0;",
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









choiceValues = c(0,1,2,3,4)
score_discourse_div <-
  div(
    radioGroupButtons("phrase_length",
                         "Reduced length and complexity of utterances", 
                         choiceNames = c("single words (0)", "MLU 2 words (1)", "MLU 3-4 words (2)", "MLU 5-7 words (3)", "normal (4)"),
                         choiceValues = choiceValues),
    radioGroupButtons("speech_rate",
                         "Reduced speech rate", 
                         choiceNames = c("0-24 WPM (0)", "25-49 WPM (1)", "50-75 WPM (2)", "75-99 WPM (3)", "100+ WPM (4)"),
                         choiceValues = choiceValues),
    radioGroupButtons("agrammatism",
                         "Agrammatism: omission of words and morphemes, especially closed class; “telegraphic speech”", 
                         choiceNames = c("severe (0)", "marked (1)", "moderate (2)", "mild (3)", "normal (4)"),
                         choiceValues = choiceValues),
    radioGroupButtons("paragrammatism",
                         "Paragrammatism: substitution of closed class items; inappropriate juxtaposition of words and phrases; garbled syntax", 
                         choiceNames = c("severe (0)", "marked (1)", "moderate (2)", "mild (3)", "normal (4)"),
                         choiceValues = choiceValues),
    radioGroupButtons("anomia",
                         "Anomia: word-finding pauses, word-finding failures, abandoned utterances, effective circumlocution", 
                         choiceNames = c("severe (0)", "marked (1)", "moderate (2)", "mild (3)", "normal (4)"),
                         choiceValues = choiceValues),
    radioGroupButtons("empty_speech",
                         "Empty speech: vague words, overabundance of closed class words, ineffective circumlocution, utterances unclear in meaning and/or tangential", 
                         choiceNames = c("severe (0)", "marked (1)", "moderate (2)", "mild (3)", "normal (4)"),
                         choiceValues = choiceValues),
    radioGroupButtons("semantic_paraphasias",
                         "Semantic paraphasias: substitution of open class items (including perseverations)", 
                         choiceNames = c("severe (0)", "marked (1)", "moderate (2)", "mild (3)", "normal (4)"),
                         choiceValues = choiceValues),
    radioGroupButtons("phonemic_paraphasias",
                         "Phonemic paraphasias and neologisms", 
                         choiceNames = c("severe (0)", "marked (1)", "moderate (2)", "mild (3)", "normal (4)"),
                         choiceValues = choiceValues),
    radioGroupButtons("self_correction",
                         "Self-correction: false starts, retraced sequences, conduite d’approche", 
                         choiceNames = c("severe (0)", "marked (1)", "moderate (2)", "mild (3)", "normal (4)"),
                         choiceValues = choiceValues),
    radioGroupButtons("overall_impairment",
                         "Overall communication impairment", 
                         direction = "vertical",
                         justified = T,
                         choiceNames = c("communication fragmentary; examiner carries burden (0)",
                                     "communication limited; participant shares burden (1)",
                                     "can discuss everyday topics; limited beyond thats (2)", 
                                     "impairment evident, but can discuss all topics (3)", 
                                     "no impairment evident (4)"),
                         choiceValues = choiceValues), 
    br(),hr(),
    
    radioGroupButtons("not_possible",
                         "If not possible:", 
                         choiceNames = c("No spontaneous speech", "Only incomprehensive muttering", "Only stereotypies", "Fewer than 10 wpm, typically mainly 'yes', 'no', a few single words or attempts"),
                         choiceValues = c("nospeech", "muttering", "stereo", "fewer")
  )
  
  )


