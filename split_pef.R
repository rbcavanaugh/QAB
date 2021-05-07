
library(here)
library(tibble)
library(pdftools)
library(dplyr)

pdf_names = tibble(
  slide = 'slide',
  num = seq(1,165,1)
) %>%
  mutate(slide_names = paste0(slide, num, ".pdf"))

for(i in 1:165){
  pdf_subset(here('www','QAB-remote-slides.pdf'), pages = i, output = here('www', pdf_names$slide_names[i]))
}


files = list.files(path = here('www'), pattern = "slide*")

setwd(here('www'))
for (x in files){
  pdf_convert(x, format = "jpeg", dpi = 100)
}
