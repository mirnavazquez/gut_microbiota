library(tidyverse)
# Read ISEScan ------------------------------------------------------------####
Insertion<-read_delim("0118A1023.contigs.fa.tsv", 
                      delim = "\t") # Reading the output file of ISEScan using tabular format.
# Extract IDs -------------------------------------------------------------####
list_partial<-Insertion %>%
  filter(type == "p") %>% # Here I am filtering the output table to extract the "partial" hits.
  select(seqID, orfBegin, orfEnd, strand) %>% # Select certain columns on the table
  unite("seq_name", c("seqID", "orfBegin", "orfEnd", "strand"), sep="_") %>% # The output of ISEScan uses as sequence ID the name of the scaffold so I create a new colum merging the information from the start and end of the sequence to be able to match the results with InterproScan
  distinct() %>% # Remove duplicated
  pull() # Create a vector
# Read Interpro -----------------------------------------------------------####
interpro<-read_delim("0118A1023.contigs.fa.orf_interpro.faa.tsv", 
                     delim="\t", col_names = F) %>%
  filter(X1 %in% list_partial) %>% # Filter the table using the IDs extracted previously
  filter(X4 == "Pfam") %>% # Filter the output to get the PFAM domains
  select(X1, X5, X6) %>%
  filter(str_detect(X6, "Transposase")) # Search for elements annotated as transposases