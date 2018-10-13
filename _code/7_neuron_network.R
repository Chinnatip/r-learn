# install.packages('nnet')
# install.packages('NeuralNetTools')
library(nnet)
library(NeuralNetTools)
library(tidyverse)

# Prepare dataset
df <- iris
glimpse(df)

# STEP 1 > Split data 

total_n <- nrow(df)
set.seed(123)
index   <- sample(1:total_n , 0.7*total_n)

# training data 70%
train_data <- df[index, ]
# dim(train_data) # show DF dimension

# testing data 30%
test_data <- df[-index, ]
# dim(test_data) # show DF dimension

# STEP 2 > Training model
# nnet     > neuron network model
# classify > Species from train_data-set
# plotnet  > plot graph node
set.seed(99)
nn_model <- nnet( Species ~ . , data=train_data , size=4 )
plotnet(nn_model) 

# STEP 3 > Testing model
prediction    <- predict(nn_model , newdata=test_data, type="class")
check_predict <- prediction == test_data$Species 
mean(check_predict)

