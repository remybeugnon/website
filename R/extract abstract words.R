library(easyPubMed)
library(scholar)
??easyPubMed

dami_query_string <- "'Remy Beugnon' [AU]"
dami_on_pubmed <- get_pubmed_ids(dami_query_string)
dami_papers <- fetch_pubmed_data(dami_on_pubmed, format = "abstract")

try({
  ## Example 01: retrieve data in TXT format
  dami_query_string <- "Remy Beugnon [AU]"
  dami_on_pubmed <- get_pubmed_ids(dami_query_string)
  dami_papers <- fetch_pubmed_data(dami_on_pubmed, format = "abstract")
  dami_papers[dami_papers == ""] <- "\n"
  cat(paste(dami_papers[1:65], collapse = ""))
  #
}, silent = TRUE)


??scholar
library(tidyverse)

df = 
  data.frame(
    word = 
      paste(
      get_publications('fEd4WGYAAAAJ&hl', cstart = 0, cstop = Inf, pagesize = 100, flush = FALSE, sortby = "citation") %>% 
        filter(!is.na(cid)) %>% 
        select(title)) %>% 
      stringr::str_split(., pattern = ' ' ) %>%
      unlist(), 
    try = NA
  ) %>%
  group_by(word) %>%
  summarise(n = n())
  
library(ggwordcloud)

ggplot(df, aes(label = word, size = n)) +
  geom_text_wordcloud() +
  scale_size_area(max_size = 20) +
  theme_minimal()
