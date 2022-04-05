library(tidyverse)
# Read Operon Mapper ------------------------------------------------------####
Operon_mapper<-read_delim("data/417647/list_of_operons_417647", delim="\t") %>%
  fill(Operon) # Fill NA values with the previous value in a column
# Explore the transposase -------------------------------------------------####
COG2826<-read_delim("data/417647/list_of_operons_417647", delim="\t") %>%
  fill(Operon) %>%
  drop_na(Type) %>%
  filter(COGgene == "COG2826")
# Explore the up/down operons ---------------------------------------------####
operons_to_look<-c("7", "9")
neighbour_genes<-read_delim("data/417647/list_of_operons_417647", delim="\t") %>%
  fill(Operon) %>%
  drop_na(Type) %>%
  filter(Operon %in% operons_to_look)

