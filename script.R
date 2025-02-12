library(cowsay)
say("I am a cow.", by = "cow")
cat("\n")

library(memer)
meme_list()

meme_get("DistractedBf") %>% 
  meme_text_distbf("tidyverse", "new R users", "base R")