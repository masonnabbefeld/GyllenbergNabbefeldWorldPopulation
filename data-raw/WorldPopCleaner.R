library(readxl)
library(tidyverse)
my.worldpop <- read_excel('/Users/mason/Desktop/NAU/24/STA444:5/445/GyllenbergNabbefeldWorldPopulation/data-raw/World_Population.xlsx',
                          sheet = 'ESTIMATES', range = 'A17:BZ306')

my.worldpop.clean <- my.worldpop[,-c(1,2,4,5,7)] %>% filter(my.worldpop$Type == 'Country/Area') %>%
  pivot_longer(3:73, names_to = 'Year', values_to = 'Population')
WorldPopulation <- my.worldpop.clean[,-c(2)]
WorldPopulation$Population <- as.numeric(WorldPopulation$Population)
WorldPopulation$Year <- as.numeric(WorldPopulation$Year)
colnames(WorldPopulation)[1] <- "Country"
usethis::use_data(WorldPopulation, overwrite = TRUE)
