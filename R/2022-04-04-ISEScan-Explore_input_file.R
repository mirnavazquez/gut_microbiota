library(tidyverse)
# Read the table ----------------------------------------------------------####
insetrions<-read_delim("0118A1023.contigs.fa.tsv", delim = "\t") # Reading the output file of ISEScan using tabular format.
# How many families -------------------------------------------------------####
familia<-insetrions %>%
  count(family) %>% # Count the number of elements in the family column
  arrange(-n) # Arrange the number from the from largest to smallest
# How many types ----------------------------------------------------------####
tipo<-insetrions %>%
  count(type) %>%
  arrange(n)
# Which elements are complete or partial?  --------------------------------####
insetrions %>%
  filter(type == "c") %>% # Here I am filtering the output table to extract the "complete" hits.
  count(family) %>%
  arrange(-n)