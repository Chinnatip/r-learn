# Install PKG
# install.packages("ggplot2")
library(ggplot2)
library(tidyverse)

# cheatsheet
# ggplot styles >> https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
# shape of plot point >> http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r

# Prepare DataFrame
data(mtcars)
df <- mtcars
df <- as.tbl(df)
glimpse(df)

# Understand GGplot
# ggplot( df , aes() , geometry_point )

# Single Variable plot
# plot 'mpg' of df (dataframe)
basic_mpg <- ggplot(data = df , 
                    mapping = aes( x=mpg))
# styling plot
basic_mpg + geom_histogram() # histogram
basic_mpg + geom_density()   # dense
basic_mpg + geom_dotplot()   # dot plot

# Double Variable 
# [_point] compare numeric X numeric
compare_wt_mpg <- ggplot(df , aes(wt, mpg)) 
compare_wt_mpg + geom_point()

# [_boxplot] compare numerix X factor > see stability of data
compare_am_mpg <- ggplot(df , aes(am, mpg)) 
compare_am_mpg + geom_boxplot()

# [_violin] see density of data
compare_cyl_mpg <- ggplot(df , aes(cyl, mpg)) 
compare_cyl_mpg + geom_violin()

# Complex Visualization
# convert [member vector] to [factor]
df$cyl <- factor(df$cyl)
df$am  <- factor(df$am , labels = c("Auto","Manual"))
# See how does it updated <3
# table(df$cyl)
# table(df$am)
# summary(df)
ggplot(df , aes(am)) + geom_bar()


