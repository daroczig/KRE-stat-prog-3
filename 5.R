## #############################################################################
## 1. We have 0.42 Bitcoin -- let's report on the value in USD
## #############################################################################

## install package
library(devtools)
install_github('daroczig/binancer')

library(binancer)
coin_prices <- binance_ticker_all_prices()

library(data.table)
coin_prices[from == 'BTC' & to == 'USDT']

coin_prices <- binance_coins_prices()
coin_prices[symbol == 'BTC', usd]

coin_prices[symbol == 'BTC', usd * 0.42]

## #############################################################################
## 2. Let's report on the value in HUF (new script)
## #############################################################################

## How to get USD/HUF rate?
## See eg https://exchangerate.host for free API access

## NOTE the need to set base, as it's EUR by default
readLines('https://api.exchangerate.host/latest?base=USD')

library(httr)
response <- GET('https://api.exchangerate.host/latest?base=USD')
response
str(response)

headers(response)
content(response)
str(content(response))
content(response, as = 'text')

library(jsonlite)
fromJSON(content(response, as = 'text'))

exchange_rates <- content(response)
str(exchange_rates)

usdhuf <- exchange_rates$rates$HUF
coin_prices[symbol == 'BTC', usd * 0.42 * usdhuf]

## clean up script
library(binancer)
coin_prices <- binance_coins_prices()
btcusdt <- coin_prices[symbol == 'BTC', usd]

library(httr)
exchange_rates <- content(response)
usdhuf <- exchange_rates$rates$HUF

btcusdt * 0.42 * usdhuf

## document, log, clean-up script

library(binancer)
library(httr)
library(data.table)
library(logger)

BITCOINS <- 0.42

coin_prices <- binance_coins_prices()
log_info('Found {coin_prices[, .N]} coins on Binance')
btcusdt <- coin_prices[symbol == 'BTC', usd]
log_info('The current Bitcoin price is ${btcusdt}')

response <- GET('https://api.exchangerate.host/latest?base=USD&symbols=HUF')
exchange_rates <- content(response)$rates
log_info('Found {length(exchange_rates)} exchange rates for USD')
usdhuf <- exchange_rates$HUF
log_info('1 USD currently costs {usdhuf} Hungarian Forints')

log_info('{BITCOINS} Bitcoins now worth {round(btcusdt * usdhuf * BITCOINS)} HUF')
round(btcusdt * usdhuf * BITCOINS)
format(btcusdt * usdhuf * BITCOINS, big.mark = ',', digits = 10)
format(btcusdt * usdhuf * BITCOINS, big.mark = ',', digits = 6)

library(scales)
dollar(btcusdt * BITCOINS)
dollar(btcusdt * usdhuf * BITCOINS, prefix = '', suffix = ' HUF')

## #############################################################################
## 3. Let's report on the value in HUF for the past 30 days (new script)
## #############################################################################

library(binancer)
library(httr)
library(data.table)
library(logger)

BITCOINS <- 0.42

coin_prices <- binance_klines('BTCUSDT', interval = '1d', limit = 30)

balance <- coin_prices[, .(date = as.Date(close_time), btcusdt = close)]

exchange_rates <- content(response)$rates
balance[, btchuf := btcusdt * exchange_rates$HUF]
balance[, btc := 0.42]
balance[, value := btc * btchuf]

library(ggplot2)
ggplot(balance, aes(date, value)) + geom_line()
library(scales)
ggplot(balance, aes(date, value)) + geom_line() + ylab('') + scale_y_continuous(labels = dollar)
huf <- function(x) dollar(x, prefix = '', suffix = ' HUF')
ggplot(balance, aes(date, value)) + geom_line() + ylab('') + scale_y_continuous(labels = huf)

ggplot(balance, aes(date, value)) +
    geom_line(color = 'blue', size = 2) +
    ylab('') + scale_y_continuous(labels = huf) +
    xlab('') +
    theme_bw() +
    ggtitle('My crypto fortune', subtitle = paste(BITCOINS, 'Bitcoin'))

## #############################################################################
## 4. Let's report on the value in HUF for the past 30 days
##    keeping in mind that USDHUF rate also changed
## #############################################################################

## d'uh
response <- GET('https://api.exchangerate.host/timeseries?start_date=2019-04-01&end_date=2019-04-28&base=USD&symbols=HUF')

## better!
response <- GET(
    'https://api.exchangerate.host/timeseries',
    query = list(start_date = '2019-04-01', end_date = '2019-04-28', base = 'USD', symbols = 'HUF'))

response <- GET(
    'https://api.exchangerate.host/timeseries',
    query = list(start_date = Sys.Date() - 30, end_date = Sys.Date(),
                 base = 'USD', symbols = 'HUF'))
# nob boi nbu boc rba
exchange_rates <- content(response)$rates

str(exchange_rates)
as.numeric(unlist(exchange_rates))
names(exchange_rates)

usdhufs <- data.table(
    date = as.Date(names(exchange_rates)),
    usdhuf = as.numeric(unlist(exchange_rates)))

usdhufs

balance <- coin_prices[, .(date = as.Date(close_time), btcusdt = close)]

balance <- merge(balance, usdhufs, by = 'date')
balance[, btchuf := btcusdt * usdhuf]
balance[, btc := 0.42]
balance[, value := btc * btchuf]

ggplot(balance, aes(date, value)) +
    geom_line(color = 'blue', size = 2) +
    ylab('') + scale_y_continuous(labels = huf) +
    xlab('') +
    theme_bw() +
    ggtitle('My crypto fortune', subtitle = paste(BITCOINS, 'Bitcoin'))

## compare with static usd/huf exchange rate
ggplot(usdhufs, aes(date, usdhuf)) + geom_line() + geom_hline(yintercept = usdhuf, color = 'red')

## #############################################################################
## 5. Now We have 0.42 Bitcoin and 1.2 Ethereum, let's report on the value
##    in HUF for the past 30 days (eg stacked barchart)
## #############################################################################

## wide VS long tables
btc_prices <- binance_klines('BTCUSDT', interval = '1d', limit = 30)
eth_prices <- binance_klines('ETHUSDT', interval = '1d', limit = 30)

balance <- rbind(
    btc_prices[, .(date = as.Date(close_time), symbol = 'BTC', usdt = close)],
    eth_prices[, .(date = as.Date(close_time), symbol = 'ETH', usdt = close)])
balance[, amount := switch(symbol, 'BTC' = 0.42, 1.2), by = symbol]
setorder(balance, date, symbol)
balance

## DRY
balance <- rbindlist(lapply(c('BTC', 'ETH'), function(s) {
    binance_klines(paste0(s, 'USDT'), interval = '1d', limit = 30)[
      , .(date = as.Date(close_time), symbol = s, usdt = close)]
}))
balance[, amount := switch(symbol, 'BTC' = 0.42, 1.2), by = symbol]

## merge & plot
setkey(balance, date)
setkey(usdhufs, date)
balance <- usdhufs[balance, roll = TRUE]

balance <- merge(balance, usdhufs, by = 'date')

balance[, amount := switch(symbol, 'BTC' = 0.42, 1.2), by = symbol]
balance[, value := usdt * amount * usdhuf]

ggplot(balance, aes(date, value, fill = symbol)) +
    geom_col() +
    ylab('') + scale_y_continuous(labels = huf) +
    xlab('') +
    theme_bw() +
    ggtitle(
        'My crypto fortune',
        subtitle = balance[date == max(date), paste(paste(amount, symbol), collapse = ' + ')])

## #############################################################################
## 6. Instead of using 0.42 Bitcoin and 1.2 Ethereum,
##    let's read the assets from a database
## #############################################################################

## Create a MySQL database using AWS RDS and
## don't forget to set an "inital database name".
## Configure a database connection via dbr's YAML format!

library(dbr)
options('dbr.db_config_path' = '/path/to/database.yaml')
options('dbr.output_format' = 'data.table')

db_config('remotemysql')

db_query('CREATE TABLE coins (symbol VARCHAR(3) NOT NULL, amount DOUBLE NOT NULL DEFAULT 0)', 'remotemysql')
db_query('TRUNCATE TABLE coins', 'remotemysql')
db_query('INSERT INTO coins VALUES ("BTC", 0.42)', 'remotemysql')
db_query('INSERT INTO coins VALUES ("ETH", 1.2)', 'remotemysql')

balance <- db_query('SELECT * FROM coins', 'remotemysql')
balance <- rbindlist(lapply(balance$symbol, function(s){
    binance_klines(paste0(s, 'USDT'), interval = '1d', limit = 30)[
      , .(date = as.Date(close_time), symbol = s, usdt = close, amount = balance[symbol == s, amount])]
}))

## merge usd/huf
library(httr)
response <- GET(
    'https://api.exchangerate.host/timeseries',
    query = list(start_date = Sys.Date() - 30, end_date = Sys.Date(),
                 base = 'USD', symbols = 'HUF'))
exchange_rates <- content(response)$rates

usdhufs <- data.table(
    date = as.Date(names(exchange_rates)),
    usdhuf = as.numeric(unlist(exchange_rates)))
setorder(usdhufs, date)

setkey(balance, date)
setkey(usdhufs, date)
balance <- usdhufs[balance, roll = TRUE]
balance[, value := usdt * amount * usdhuf]

forint <- function(x) {
  scales::dollar(x, prefix = '', suffix = ' HUF')
}

library(ggplot2)
ggplot(balance, aes(date, value, fill = symbol)) +
    geom_col() +
    ylab('') + scale_y_continuous(labels = forint) +
    xlab('') +
    theme_bw() +
    ggtitle(
        'My crypto fortune',
        subtitle = balance[date == max(date), paste(paste(amount, symbol), collapse = ' + ')])

## add a new coin and rerun
db_query('INSERT INTO coins VALUES ("NEO", 100)', 'remotemysql')
db_query('INSERT INTO coins VALUES ("LTC", 25)', 'remotemysql')

## #############################################################################
## 7. No static portfolio ... we have been trading in the past 30 days,
##    so let's look at the transactions data (cumsum)
## #############################################################################

db_query('
  CREATE TABLE transactions (
    date TIMESTAMP NOT NULL,
    symbol VARCHAR(3) NOT NULL,
    amount DOUBLE NOT NULL DEFAULT 0)',
  db = 'remotemysql')

db_query('TRUNCATE TABLE transactions', 'remotemysql')
db_query('INSERT INTO transactions VALUES ("2019-01-01 10:42:02", "BTC", 1.42)', 'remotemysql')
db_query('INSERT INTO transactions VALUES ("2019-01-01 10:45:20", "ETH", 1.2)', 'remotemysql')
db_query('INSERT INTO transactions VALUES ("2019-02-28", "BTC", -1)', 'remotemysql')
db_query('INSERT INTO transactions VALUES ("2019-04-13", "NEO", 100)', 'remotemysql')
db_query('INSERT INTO transactions VALUES ("2019-04-20 12:12:21", "LTC", 25)', 'remotemysql')

transactions <- db_query('SELECT * FROM transactions', 'remotemysql')

balance <- transactions[, .(date = as.Date(date), amount = cumsum(amount)), by = symbol]
balance

library(data.table)
balance <- dcast(balance, date ~ symbol)
balance

dates <- data.table(date = seq(from = Sys.Date() - 30, to = Sys.Date(), by = '1 day'))
balance <- merge(balance, dates, by = 'date', all.x = TRUE, all.y = TRUE)
balance

library(zoo)
## Last Observation Carried Forward
## balances <- as.data.table(apply(balances, 2, na.locf))
for (v in c(names(balance))) {
    balance[, (v) := na.locf(get(v), na.rm = FALSE)]
}
balance

balance[is.na(balance)] <- 0
balance

balance <- melt(balance, id.vars = 'date', variable.name = 'symbol', value.name = 'amount')
balance

library(binancer)
prices <- rbindlist(lapply(as.character(unique(balance$symbol)), function(s) {
    binance_klines(paste0(s, 'USDT'), interval = '1d', limit = 30)[
      , .(date = as.Date(close_time), symbol = s, usdt = close)]
}))

## merge crypto prices
balance <- merge(balance, prices, by = c('date', 'symbol'), all.x = TRUE, all.y = FALSE)

## merge USD/HUF rate
setkey(balance, date)
setkey(usdhufs, date)
balance <- usdhufs[balance, roll = TRUE]
balance[, value := usdt * amount * usdhuf]

library(ggplot2)
ggplot(balance, aes(date, value, fill = symbol)) +
    geom_col() +
    ylab('') + scale_y_continuous(labels = forint) +
    xlab('') +
    theme_bw() +
    ggtitle(
        'My crypto fortune',
        subtitle = balance[date == max(date), paste(paste(amount, symbol), collapse = ' + ')])

