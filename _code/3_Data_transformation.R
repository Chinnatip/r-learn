library(tidyverse) # use tidyverse

# Prepare dataFrame
df <- as.tbl(mtcars)
df # LOGS

#### Data transformation ####
# select( data , ..col_name.. , ..col_name.. , ..)
select(df, cyl , vs, am) # select 'cyl','vs','am'
select(df, 2:4 ,10)      # select col2 -> 4 ,for 10 rows
select(df, -mpg , -wt)   # select everythong except 'wt' , 'mpg'
select(df, starts_with("m")) # select coloum_name start with "a"
select(df, ends_with("p"))   # select coloum_name end with "a"
select(df, contains('a'))    # select coloum_name contain with "a"

# filter(df, condition1 & condition2 & conditionX ...)
filter(df, hp < 80)            # basic filter
filter(df, hp < 80 & mpg > 30) # and
filter(df, hp < 80 | am == 0)  # or
filter(df, hp %in% 0:100)      # between

# arrange(df, column_nameN , coloum_name1 ) # sort_by
arrange(df, hp)
arrange(df, desc(hp))
arrange(df, -hp)

# pipe operator # complex transformation
df %>%
  select(mpg,hp,wt) %>%
  filter(hp > 100 & wt < 3) %>%
  arrange(-hp) %>%
  head(3)

# create new column in df
df %>% 
  select(hp , wt) %>% 
  mutate(new_column = hp + wt , 
         col_2  = hp/100 ,
         wt_sqt = sqrt(hp))

# summarise
df %>% 
  summarise(avg_mpg = mean(mpg),
            sd_mpg  = sd(mpg),
            n       = n())

# inspect in column and group dataset by "KEY"
df %>% 
  group_by(am , cyl) %>%
  summarise(avg_mpg = mean(mpg),
            sd_mpg  = sd(mpg),
            n       = n())

# write result transformation
result <- df %>%
  select(mpg,hp,wt) %>%
  filter(hp > 100 & wt < 3) %>%
  arrange(-hp) %>%
  head(3)
write.csv(result , './_datasets/transformation.csv')

