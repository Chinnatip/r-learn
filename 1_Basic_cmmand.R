# essential package
# installed.packages('tidyverse') # install pkg
# library(tidyverse) # use tidyverse


# Shortcut key
# cmd + enter //  run function in this line ( Debugging mode )
# ctrl + l // clear log
# ctrl + 1 // goto text view
# ctrl + shft + c // comment

# View shortcut
# ctrl + 2 // goto console view
# ctrl + 3 // goto help mode
# ctrl + 4 // goto history mode
# View( file_path ) # to open file !!

# Import - Export CSV
# read.csv('import_file_name.csv')
# write.csv(df, 'export_file_name.csv')

# get working directory
getwd()

# print directory
dir()

#### Wokshop 1 > normal operation ####
1000 * 25  # multiply
10.5 %% 1  # modulus
2 ^ 4      # powered
2 ** 4     # powered too ..
1000 + 2*5 - 400 # complex operation

#### Workshop 2 > var "_" to connect string of var ####
# R will collect evrey variable in GLOBAL ENVIRONMENT 
# we can inspect dynamic changed in this section
total_money  = 50000
stuff_to_buy = 3000
left_over    = ( total_money - stuff_to_buy)
#
rm(stuff_to_buy)
rm(total_money)
rm(left_over)

#### Workshop 3 > Data types ####
# [numeric]   > 1.2345 > number , float
test_num  <- 1.2345

# [character] > "chinnatip" > string
test_char <- "kohlife.com"

# [logical]   > TRUE > boolean
test_log  <- TRUE

# [factor]    > male/female > Group of variable that can run in switch-case
test_animals <- c('dog', 'cat', 'rabbit', 'cat')
animal_genre <- factor(test_animals)
class(animal_genre)

##### Workshop 4 > Data structure ####
# vector > c(100,200,300) > behave like Array
gangs <- c('Tryn','MMW','Mon',"Klam","Mikey")
length(gangs)
class(gangs)
gangs[2]

# list > list(A,B,C)  > behave like single Object
y <- list(500,600)

# matrix    > matrix( 1:9 , ncol = , ncol = , ncol = 3, byrow = T) , byrow = T)
z <- matrix( 1:9 , ncol = ,  3, byrow = T )

# dataframe > behave like Object or Hash in RUBY
customer_names <- c('Tryn','MMW','Mon',"Klam","Mikey")
customer_ages  <- c(31,32,24,56,7)
food_allergy   <- c(T,T,F,F,F)
df <- data.frame(customer_names , customer_ages , food_allergy)

##### Workshop 5 > Create Flight DataFrame ####
flights <- read.csv("flights.csv")
boston  <- read.csv('Boston.csv', sep = ',') # import with config "seperator" = ","
airline <- read.csv("airlines.csv")
# View(boston)

#### Workshop 6 > Subsetting ####
# subset > like index array [:index] or find by Hash [:key]
boston[3]   # get hashKey 3 
boston['X'] # get hash 'X'
customer_ages[c(1,2,3)] # subsetting by vestor set

#### Workshop 7 > Operan on subsetting (map) #### 
# ** we use this operation to 'filter' DataFrame **
x        # check X
x > 100  # check X member that more than '100' log 'logical'
x[x>100] # filter X member that more than '100' log 'vector' <3

#### Workshop 8 > Play with built-in R-data (mtcars) ####
# init built-in mtcars
data(mtcars)
# bind it to 'df'
df <- mtcars
# get 'first 6 row' of DF
head(df)
# get 'last 6 row' of DF
tail(df)
# analyse DF
summary(df)
# Data subsetting
df[2,6]       # get 'wt' from 'Mazda RX4 Wag' > column 6 of row 2
df[1:5 , 1:4] # get 'first 5 row' with 'first 4 column'
df[1:5 , ]    # get 'first 5 row'
df[ , 1:3]    # get 'first 3 column' of every row
df[1:5 , c('mpg','wt','am','hp')] # get 'mpg','wt','am','hp' of every row


#### Workshop 9 > Play with tidyverse tbl ####
data(mtcars)
# use tbl > better df
df <- as.tbl(mtcars)
# show data structure - skimming
# we usually watch both head-tail of our DF 
# to see 'what happened with our data'
glimpse(df)
# glimpse(head(df))
# glimpse(tail(df))

#### Workshop 10 > Calculte mean & quadrant & median & summary of each column ####
# get 'xxxx' of DF by column 'yyy'
mean(df$hp) # mean
sd(df$hp)   # sd
sum(df$hp)  # summary
min(df$hp)  # min
max(df$hp)  # max
# everything finish with this !
summary(df$wt) # summary everything of this column

#### Workshop 11 > Correlation ####
# find correlation 'mile per gasolene' and 'weight'
# corellation = '-' cuz more weight will drop mpg
cor(df$mpg,df$wt)
cor(df$mpg,df$hp)
# automate find corellation
cor(df)
# write new correlation file
result <- cor(df)
write.csv(result, 'correlation_matrix.csv')

#### Wokrshop 12 > cleansing data #1  > clean mission value ####
# create mission value vector
null <- c(1,2,4,7,NA,455,32,454,2,58,NA,NA)

# fix mission in null then calc mean
mean(null , na.rm = TRUE)

# check mission value
null_val <- is.na(null)
sum(null_val)
mean(null_val)

# Inspect each data for check MISSING OR NOT
complete.cases(df)
mean(complete.cases(df))

#### cleansing for real df
# find mean of msleep 'ignore missing value'
mean(msleep$sleep_rem, na.rm = T)

# calculate missing ratio
mean(complete.cases(msleep))
