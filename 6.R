## #############################################################################
## basic decision tress
## #############################################################################

set.seed(100)
mysample <- sample(1:150, 100)
str(mysample)

train <- iris[mysample, ]
test  <- iris[setdiff(1:150, mysample), ]

library(rpart)
ct <- rpart(Species ~ ., data = train)
summary(ct)

plot(ct); text(ct)

library(partykit)
plot(as.party(ct))

predict(ct, newdata = test)
predict(ct, newdata = test, type = 'class')

## confusion matrix
table(test$Species,
      predict(ct, newdata = test,
              type = 'class'))

ct <- rpart(Species ~ ., data = train,
            minsplit = 1, cp = 0.001)
## ?rpart.control
plot(ct); text(ct)
plot(as.party(ct))

table(test$Species,
      predict(ct, newdata = test,
              type = 'class'))

## rerun with below seed to see an actual example of overfitting
## set.seed(22222)

## #############################################################################
## H2O
## #############################################################################

## start and connect to H2O
library(h2o)
h2o.init()
## in a browser check http://localhost:54321

?rpart()
?h2o.randomForest()

## demo data
library(hflights)
rm(hflights)
str(hflights)

## copy to H2O
hflights.hex <- as.h2o(hflights, 'hflights')
## check in UI (0 sigma for year, click on month to see distribution)

str(hflights.hex)
str(head(hflights.hex))
head(hflights.hex, 3)
summary(hflights.hex)
## check flight number: numeric?
## check on H2O web interface as well (enum vs factor)
## convert in UI to enum then check summary again

summary(hflights.hex)

## convert numeric to factor/enum
hflights.hex[, 'FlightNum'] <- as.factor(hflights.hex[, 'FlightNum'])
summary(hflights.hex)

## boring
for (v in c('Month', 'DayofMonth', 'DayOfWeek', 'DepTime', 'ArrTime', 'Cancelled')) {
    hflights.hex[, v] <- as.factor(hflights.hex[, v])
}

summary(hflights.hex)

## feature engineering: departure time? is it OK? hour of the day?
## redo everything... just use the R script
library(data.table)
hflights <- data.table(hflights)
hflights[, hour := substr(DepTime, 1, 2)]
hflights[, .N, by = hour]

## oh no, no leading zeros
hflights[1:50, DepTime]

hflights[, hour := substr(DepTime, 1, nchar(DepTime) - 2)]
hflights[, .N, by = hour][order(hour)]
hflights[hour == '']
## good enough ... although what does "22" or "111" mean?

hflights[, hour := cut(as.numeric(hour), seq(0, 24, 4))]
hflights[, .N, by = hour]

hflights[is.na(hour)]
hflights[, .N, by = .(is.na(hour), Cancelled == 1)]

## drop columns
hflights <- hflights[, .(Month, DayofMonth, DayOfWeek, Dest, Origin,
                         UniqueCarrier, FlightNum, TailNum, Distance,
                         Cancelled = factor(Cancelled))]


## re-upload to H2O
h2o.ls()
hflights.hex <- as.h2o(as.data.frame(hflights), 'hflights')

## split the data
h2o.splitFrame(data = hflights.hex , ratios = 0.75,
               destination_frames = paste0('hflights', 0:1))
h2o.ls()

## build the first model
hflights.rf <- h2o.randomForest(
    model_id = 'hflights_rf',
    x = setdiff(names(hflights), 'Cancelled'),
    y = 'Cancelled',
    training_frame = 'hflights0',
    validation_frame = 'hflights1')
hflights.rf

## more trees
hflights.rf <- h2o.randomForest(
    model_id = 'hflights_rf500',
    x = setdiff(names(hflights), 'Cancelled'),
    y = 'Cancelled',
    training_frame = 'hflights0',
    validation_frame = 'hflights1', ntrees = 500)
hflights.rf

## change to UI and check ROC curve & AUC

## GBM
hflights.gbm <- h2o.gbm(
    x = setdiff(names(hflights), 'Cancelled'),
    y = 'Cancelled',
    training_frame = 'hflights0',
    validation_frame = 'hflights1',
    model_id = 'hflights_gbm')
hflights.gbm

## more trees should help, again !!!
hflights.gbm <- h2o.gbm(
    x = setdiff(names(hflights), 'Cancelled'),
    y = 'Cancelled',
    training_frame = 'hflights0',
    validation_frame = 'hflights1',
    model_id = 'hflights_gbm2', ntrees = 500)
hflights.gbm

## but no: although higher training AUC, lower validation AUC => overfit

## more trees should help, again !!!
hflights.gbm <- h2o.gbm(
    x = setdiff(names(hflights), 'Cancelled'),
    y = 'Cancelled',
    training_frame = 'hflights0',
    validation_frame = 'hflights1',
    model_id = 'hflights_gbm2',
    ntrees = 2000,
    ## learn_rate = 0.01,
    stopping_metric = 'AUTO', stopping_rounds = 3)

## bye
h2o.shutdown()
