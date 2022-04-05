library(tidyverse)
# Read Integron Finder ----------------------------------------------------####
integrons<-read_delim("data/0118A1023.contigs.integrons", delim = "\t",
                      skip = 1)
# Explore Integron Finder --------------------------------------------------####
integrons