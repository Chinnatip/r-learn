# install.packages("MASS")
# library(MASS)
library(tidyverse)

# Home price in Boston
df <- read.csv('./_datasets/Boston.csv')
df <- as.tbl(df)
glimpse(df)

# Dictoinary various of parameter in house faction
# medv  <medean valule price>
# crim  <crime ratio>
# rad   
# black <black people ratio>
# tax   <tax rate>
# indus <near industry area>
# lstat
# dis 

# STEP 1 > Split data 
total_n <- nrow(df)
set.seed(99)
index   <- sample(1:total_n , 0.7*total_n)

# training data 70%
train_data <- df[index, ]
# dim(train_data) # show DF dimension

# testing data 30%
test_data <- df[-index, ]
# dim(test_data) # show DF dimension


# STEP 2 > Training model
# lm    > lenear regression modeller 
# x ~ y >  X is anonymous function of Y
lm_fit    <- lm( medv ~ (crim + tax + black), train_data)

# STEP 3 > Test model
prediction <- predict(lm_fit , test_data)
error_pow  <- (test_data$medv - prediction) ** 2

# Root Mean Sqrt Error > efficiency of these model
rmse <- sqrt(mean(error_pow))
rmse 

# STEP 4 > Optimization
# 
lm_fit_2 <- lm( medv ~ (crim + tax + black + lstat + nox + indus + age + ptratio + zn), train_data)
prediction <- predict(lm_fit_2 , test_data)
error_pow  <- (test_data$medv - prediction) ** 2
rmse_2 <- sqrt(mean(error_pow))
rmse_2

# compare rmse - rmse_2
rmse - rmse_2 
# you will see it greater increase performance 
# when add more variable in lenear regression model
# cheers!

