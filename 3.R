## #############################################################################
## alternatives to boxplot
## #############################################################################

## TODO exploratory data analysis on the below dataset
df <- read.csv('http://bit.ly/CEU-R-numbers')
library(data.table)
df <- fread('http://bit.ly/CEU-R-numbers')
## generated at https://gist.github.com/daroczig/23d1323652a70c03b27cfaa6b080aa3c

library(ggplot2)
n <- 100
ggplot(df[, .N, by = .(x = cut(x, n), y = cut(y, n))], aes(x, y, fill = N)) + geom_tile()

ggplot(df, aes(x, y)) + geom_point()
ggplot(df, aes(x, y)) + geom_point(alpha = 0.05)
ggplot(df, aes(x, y)) + geom_point(size = 0.2, alpha = 0.1)
ggplot(df, aes(x, y)) + geom_hex(binwidth = 25)

## #############################################################################
## alternatives to boxplot
## #############################################################################

## df <- rbind(
##     data.table(x = 1, y = rbeta(1e3, 0.1, 0.1)),
##     data.table(x = 2, y = rnorm(1e3, 0.5, 0.75)),
##     data.table(x = 3, y = runif(1e3) * 2 - 0.5),
##     data.table(x = 4, y = rnorm(1e3, 0.5, 0.75)))

library(data.table)
df <- fread('http://bit.ly/CEU-R-numbers-set')

summary(df)
lapply(df, summary)
lapply(unique(df$x), function(set) summary(df[x == set]))

ggplot(df,aes(x, y)) + geom_point()
ggplot(df,aes(x, y)) + geom_point(alpha = .25)
ggplot(df,aes(x, y)) + geom_point(alpha = .25) + geom_smooth(method = 'lm')

ggplot(df,aes(x, y)) + geom_jitter()

ggplot(df,aes(x, y)) + geom_hex()

ggplot(df,aes(x, y)) + geom_boxplot()
ggplot(df,aes(factor(x), y)) + geom_boxplot()

ggplot(df,aes(factor(x), y)) + geom_violin()
ggplot(df,aes(factor(x), y)) + geom_violin() + geom_jitter()
ggplot(df,aes(factor(x), y)) + geom_violin() + geom_jitter(height = 0, width = 0.1)

ggplot(df,aes(y)) + geom_histogram() + facet_wrap(~x)

ggplot(df,aes(y, fill = x)) + geom_density()
ggplot(df,aes(y, fill = factor(x))) + geom_density()
ggplot(df,aes(y, fill = factor(x))) + geom_density(alpha = 0.25) + theme(legend.position = 'top')

## let's do a heatmap on the mean and standard deviation of the sets!
ggplot(melt(df[, .(mean = mean(y),sd = sd(y)), by = x], id = 'x'),
       aes(x, variable, fill = value)) + geom_tile()
