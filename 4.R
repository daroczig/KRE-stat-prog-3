## #############################################################################
## intro to time-series analysis

library(binancer)
prices <- binance_klines('BTCUSDT', interval = '1h')

## create a time-series (ts) with a frequency of 24,
## where the 24 hours in a day refers to the daily seasonality that we expect in the data
plot(ts(prices$close, frequency = 24))

## extended time-series object
library(xts)
plot(xts(prices$close, order.by = prices$close_time))

## decompose time-series into trend + seasonal + irregular components
plot(decompose(ts(prices$close, frequency = 24)))

## loading daily data and setting the frequency to 7 for weekly seasonality
prices <- binance_klines('BTCUSDT', interval = '1d')
prices <- ts(prices$close, frequency = 7)
plot(prices)

plot(decompose(prices))
str(decompose(prices))
## the effects of weekdays
decompose(prices)$seasonal[1:7]

library(forecast)
plot(prices)

## naïve forecasting: using the most recent value as a forecast
fit <- naive(prices)
fit

plot(forecast(fit))

## visualize raw data and values used in the forecast
plot(fit)
lines(fitted(fit), col = 'red')

## in-sample accuracy metrics of the prediction
accuracy(fit)

## above ... was about autoregressive
## moving averages
lines(ma(prices, 2), col = 'red')
lines(ma(prices, 7), col = 'blue')
lines(ma(prices, 4*7), col = 'green')

## using exponential smoothing for forecasting
fit <- ses(prices)
fit

plot(forecast(fit))

plot(fit)
lines(fitted(fit), col = 'red')

accuracy(fit)

## Autoregressive integrated moving average with auto-tuned parameters
## I -> nem stacionarius idosorokat
fit <- auto.arima(prices)
fit

plot(forecast(fit))

plot(prices)
lines(fitted(fit), col = 'red')

accuracy(fit)

## what's happening?
fit <- Arima(prices, order = c(0, 1, 1)) # exponential smoothing model
fit <- Arima(prices, seasonal = c(0, 1, 1))

## other forecasting methods
plot(forecast(ets(prices)))
plot(forecast(tbats(prices)))
plot(forecast(nnetar(prices)))

## #############################################################################
## analyzing the amount of gasoline products supplied between 1991 and 2017

library(fpp2)
gasoline
?gasoline

plot(gasoline)
autoplot(gasoline)
autoplot(gasoline) + theme_bw() + xlab('')

## forecasts with default options
forecast(gasoline)
autoplot(forecast(gasoline))

## using different forecasting methods and checking on the resulting forecasts and accuracy

naive(gasoline)
autoplot(forecast(naive(gasoline)))

## forecasting 52 weeks (1 year)
autoplot(forecast(naive(gasoline, h = 52)))

## check accuracy metrics when forecasting the next 4 weeks
accuracy(forecast(naive(gasoline, 4)))

ma(gasoline, 4)
ses(gasoline)

autoplot(forecast(ses(gasoline)))
autoplot(forecast(ses(gasoline, h = 52)))

accuracy(forecast(ses(gasoline, 4)))

?hw
?ets

fit <- ets(gasoline)
fit <- ets(ts(gasoline, frequency = 4))
autoplot(forecast(fit, h = 52))

accuracy(forecast(fit, h = 4))

## other, much slower methods
auto.arima(gasoline)
tbats(gasoline)
nnetar(gasoline)

## putting all the above together to print the in-sample accuracy metrics when forecasting 4 weeks
rbindlist(list(
    data.table(method = 'naive', as.data.frame(accuracy(forecast(naive(gasoline))))),
    data.table(method = 'ses', as.data.frame(accuracy(forecast(ses(gasoline, 4))))),
    data.table(method = 'ets', as.data.frame(accuracy(forecast(ets(gasoline), 4)))),
    data.table(method = 'ets4', as.data.frame(accuracy(forecast(ets(ts(gasoline, frequency = 4)), 4)))),
    data.table(method = 'arima', as.data.frame(accuracy(forecast(auto.arima(gasoline), 4)))),
    data.table(method = 'tbats', as.data.frame(accuracy(forecast(tbats(gasoline), 4)))),
    data.table(method = 'nnetar', as.data.frame(accuracy(forecast(nnetar(gasoline), 4))))))

## see also
?tsCV
