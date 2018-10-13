# Prepare flights data
# install.packages('nycflights13')
flights <- read.csv('./_datasets/flights.csv')
flights <- as.tbl(flights)

glimpse( flights)

#### Challenge find TOP10 airline in September ####
filter_flight <- flights %>%
  filter(month == 9) %>%
  group_by(carrier) %>%
  summarise(n = n() ) %>%
  arrange(-n) %>%
  head(10)


# Prepare airline name
airline <- read.csv('./_datasets/airlines.csv')
airline <- as.tbl(airline)

# Join table
# inner_join # join only "matched key"
# left_join  # prepare left-table and join right-table if "matched key"
# full_join  # join every "key" in left-right "will facing amount of NA"
# right_join # opposite of left join
filter_flight %>%
  left_join( airline, by = "carrier" )
