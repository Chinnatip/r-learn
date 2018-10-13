library(tidyverse)

# install.packages('nycflights13')
flights <- read.csv('./_datasets/flights.csv')
flights <- as.tbl(flights)

glimpse( flights)

#### Challenge find TOP10 airline in September ####
flights %>%
  filter(month == 9) %>%
  group_by(carrier) %>%
  summarise(n = n() ) %>%
  arrange(-n) %>%
  head(10)
