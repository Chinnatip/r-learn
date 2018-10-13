# Install PKG
# install.packages("ggplot2")
library(ggplot2)
library(tidyverse)

# cheatsheet
# ggplot styles >> https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf
# shape of plot point >> http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r

###
df <- diamonds
glimpse(df)
table(df$cut)
class(df$cut)

# use sampling to SIMPLIFY if amount of data is too much
# use 'seed' to comtrol sample running
set.seed(99) 
sample_diamond <- sample_n(df, 2000)
# glimpse(sample_diamond)

# [point] compare carat to price
compare_carat_price <- ggplot(sample_diamond , aes(carat , price, color=clarity))
compare_carat_price +  geom_point( size=1.2 , 
                                   alpha=0.8 ,
                                   shape=2)

compare_carat <- ggplot(sample_diamond , aes(carat , price))
plot_style    <- geom_point( size=1.2, alpha=0.8, shape=2 )
compare_carat + plot_style + geom_smooth()
compare_carat + plot_style + geom_smooth(method="loess")
compare_carat + plot_style + geom_smooth(method='gam')
compare_carat + plot_style + geom_smooth(method='loess') + theme_minimal()
compare_carat + plot_style + geom_smooth(method='loess') + theme_minimal() + facet_wrap(~ cut)
