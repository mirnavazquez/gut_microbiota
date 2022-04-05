library(tidyverse)
# Read the table ----------------------------------------------------------####
insetrions<-read_delim("0118A1023.contigs.fa.tsv", delim = "\t")
# How many families -------------------------------------------------------####
familia<-insetrions %>%
  count(family) %>%
  arrange(n)
# How many types ----------------------------------------------------------####
tipo<-insetrions %>%
  count(type) %>%
  arrange(n)
# Which elements are complete or partial?  --------------------------------####
insetrions %>%
  filter(type == "c") #%>%
  #count(family) %>%
  #arrange(-n)


