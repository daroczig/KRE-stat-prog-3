## #############################################################################
## _potential_ homework solutions for the 1st week
## #############################################################################

## 1. Load `bookings` data from http://bit.ly/CEU-R-hotels-2018-prices and the hotel `features` from http://bit.ly/CEU-R-hotels-2018-features
library(data.table)
bookings <- fread('http://bit.ly/CEU-R-hotels-2018-prices')
features <- fread('http://bit.ly/CEU-R-hotels-2018-features')

## 2. Count the number of 4 stars hotels in Hungary
features[stars == 4 & country == 'Hungary', .N]
nrow(features[stars == 4 & country == 'Hungary'])

## 3. Compute the average rating of 4 and 5 star hotels in Hungary and Germany
features[stars >= 4 & country %in% c('Hungary', 'Germany'), mean(rating, na.rm = TRUE)]
features[stars >= 4 & country %in% c('Hungary', 'Germany') & !is.na(rating), mean(rating)]

## 4. Round up the previously computed average rating to 2 digits
features[stars >= 4 & country %in% c('Hungary', 'Germany') & !is.na(rating), round(mean(rating), 2)]

## 5. Do we have any bookings in unknown hotels (as per the features dataset)?
bookings[!hotel_id %in% unique(features$hotel_id)]
features

## 6. Clean up the bookings dataset from bookings from unknown hotels and print the number of remaining bookings
bookings <- bookings[hotel_id %in% unique(features$hotel_id)]

## 7. What's the average distance of hotels from the city central in Budapest
features[city_actual == 'Budapest', mean(distance)]

## 8. List all neighbourhoods in Budapest
features[city_actual == 'Budapest', unique(neighbourhood)]
features[city_actual == 'Budapest', mean(distance), by = neighbourhood][, neighbourhood]

## 9. Compute the average distance from the city center for the neighbourhoods in Budapest
features[city_actual == 'Budapest', mean(distance), by = neighbourhood]

## 10. Count the number of bookings in Hungary
bookings[hotel_id %in% features[country == 'Hungary', hotel_id], .N]

## 11. Count the number of nights booked in Hungary
merge(bookings, features, by = 'hotel_id')[country == 'Hungary'][, sum(nnights)]

## 12. Compute the average number of nights per booking in Hungary
merge(bookings, features, by = 'hotel_id')[country == 'Hungary'][, mean(nnights)]
<<<<<<< HEAD

## TODO push to git, create PR to merge homework
## TODO comment on PR, get some updates, merge, then fix locally (overwrite with copy/paste)

## #############################################################################
## back to dataviz ... why? let's see Anscombe's quartett
## #############################################################################

## dirty data
anscombe

## select 1st set
anscombe[, c(1, 5)]

## using base R to see the 1st set
plot(anscombe[, c(1, 5)])

## add linear model
lm(anscombe[, c(5, 1)])
## note to change 5 and 1 (estimating y based on x)
abline(lm(anscombe[, c(5, 1)]))

ggplot(anscombe[, c(1, 5)], aes(x1, y1)) + geom_point() + geom_smooth(method = 'lm', se = TRUE)
ggplot(anscombe[, c(2, 6)], aes(x2, y2)) + geom_point() + geom_smooth(method = 'lm', se = TRUE)

## intro to loops
lapply(1:4, function(i) mean(anscombe[, c(i)]))
lapply(1:4, function(i) sd(anscombe[, c(i)]))
lapply(1:4, function(i) cor(anscombe[, c(i, i+4)]))

## loop to create separate & tidy dataset for each set
lapply(1:4, function(i) anscombe[, c(i, i+4)])

## use data.table to merge into one single data frame
library(data.table)
rbindlist(lapply(1:4, function(i) anscombe[, c(i, i+4)]))
## add a "set" column so that we know which set the row belongs to
rbindlist(lapply(1:4, function(i) cbind(set = i, anscombe[, c(i, i+4)])))

## save in a variable for future use
df <- rbindlist(lapply(1:4, function(i) cbind(set = i, anscombe[, c(i, i+4)])))
setnames(df, c('set', 'x', 'y'))

## let's switch from base R to ggplot and show all 4 sets in subplots
library(ggplot2)
ggplot(df, aes(x, y)) + geom_point() + facet_wrap(~set)
ggplot(df, aes(x, y)) + geom_point() + facet_wrap(~set) + geom_smooth()
ggplot(df, aes(x, y)) + geom_point() + facet_wrap(~set) + geom_smooth(method = 'lm')

## instead of 4 facets, let's make an animation .. transitioning between sets
library(gganimate)
ggplot(df, aes(x, y)) +
    geom_point() +
    transition_states(set)

## add linear trend line -- requires the transformr package if not installed
## as that can compute transition of lines
library(transformr)
ggplot(df, aes(x, y)) +
    geom_point() + geom_smooth(method = 'lm') +
    transition_states(set)

## add title recording the closest "set" + custom transitions between sets
ggplot(df, aes(x, y)) +
    geom_point() + geom_smooth(method = 'lm') +
    transition_states(set) +
    labs(title = "{closest_state}") +
    ease_aes('bounce-in-out')

## #############################################################################
## another example: the Datasaurus
## via https://www.meetup.com/rladies-budapest/events/266577128/
## #############################################################################

library(datasauRus)

datasaurus_dozen_wide
str(datasaurus_dozen_wide)

## transforming the wide table into tidy data
library(data.table)
rbindlist(lapply(1:13, function(i) cbind(
    set = sub('_y$', '', names(datasaurus_dozen_wide)[i*2]),
    setnames(
        datasaurus_dozen_wide[, c((i-1)*2 + 1:2)],
        c('x', 'y')))))

## or just be open-eyed
datasaurus_dozen

library(ggplot2)
ggplot(datasaurus_dozen, aes(x, y)) +
    geom_point() + facet_wrap(~dataset)

library(gganimate)
ggplot(datasaurus_dozen, aes(x, y)) +
    geom_point() + geom_smooth(method = 'lm') +
    transition_states(dataset)

subtitle <- function(df, digits = 4) {
    paste0(
        'mean(x)=', round(mean(df$x), digits), ', ', 'sd(x)=', round(sd(df$x), digits), '\n',
        'mean(y)=', round(mean(df$y), digits), ', ', 'sd(y)=', round(sd(df$y), digits), '\n',
        'cor(x,y)=', round(cor(df$x, df$y), digits)
    )
}
subtitle(datasaurus_dozen)

ggplot(datasaurus_dozen, aes(x, y)) +
    geom_point() + geom_smooth(method = 'lm') +
    transition_states(dataset) +
    labs(
        title = paste("{closest_state}"),
        subtitle = '{subtitle(subset(datasaurus_dozen, dataset == closest_state))}')

## ###############################################################################################
## tweaking ggplot2 themes
## ###############################################################################################

## plot the weight and acceleration of cars colored by transmission
(p <- ggplot(mtcars, aes(wt, qsec, color = factor(am))) + geom_point())

## themes
library(ggthemes)
p + theme_economist() + scale_color_economist()
p + theme_stata() + scale_color_stata()
p + theme_excel() + scale_color_excel()
p + theme_wsj() + scale_fill_wsj('colors6', '')
p + theme_gdocs() + scale_fill_gdocs()

## create a custom theme for future usage
?theme
theme_custom <- function() {
    theme(
        axis.text = element_text(
            family = 'Times New Roman',
            color  = "orange",
            size   = 12),
        axis.title = element_text(
            family = 'Times New Roman',
            color  = "orange",
            size   = 16,
            face   = "bold"),
        axis.text.y = element_text(angle = 90, hjust = 0.5),
        panel.background = element_rect(
            fill = "orange",
            color = "white",
            size = 2)
    )
}

p + theme_custom()
p + theme_custom() + theme(panel.background = element_rect(
  fill = "#242323",
  color = "white",
  size = 2))

library(ggthemr)
?ggthemr
## https://github.com/cttobin/ggthemr

ggthemr(
  'pale',
  layout = 'scientific',
  spacing = 2,
  type = 'inner')
p

ggthemr(
    palette = structure(
        list(
            background = 'papayawhip',
            text = c(inner = 'orange', outer = 'black'),
            line = c(inner = 'orange', outer = 'black'),
            gridline = 'white',
            swatch = structure(RColorBrewer::brewer.pal(8, 'Dark2'),
                class = 'ggthemr_swatch'),
            gradient = c(low = 'white', high = 'red')),
        class = 'ggthemr_palette'),
    layout = structure(
        list(
            panel.grid.major = function(...) element_line(...),
            panel.grid.minor = function(...) element_line(size = 0.25, ...)
        ), class = 'ggthemr_layout'),
    text_size = 12, spacing = 0.5)
p

## drop back to the default colors and layout
ggthemr_reset()
