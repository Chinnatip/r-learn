library(tidyverse) # use tidyverse

#### Workshop 13 > function ####
# create function
sum_two_num <- function(a = 0 ,b = 0){
  total <- a + b
  print(total)
}
# user function
sum_two_num(20,3)
sum_two_num(,100)
sum_two_num(b=200)


#### Workshop 14 > rolling dice ####
# Sample <- Ramdom index by sampling data
# sample(1:6,1)
# sample(c('Red','Blue','Green'),1)
# create function

source('./_method/roll_dice.R')

# let's roll!
roll_dice(2)
# extra and sum roll N dice!
# roll_dice <- function(n){
#   total <- sum( sample(1:6, n , replace= T) )
#   print(total)
# }
