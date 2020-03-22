## #############################################################################
## 6. Instead of using 0.42 Bitcoin and 1.2 Ethereum,
##    let's read the assets from a database
## #############################################################################

## Create a new account at https://remotemysql.com
## Check out PhpMyAdmin

## example-remotemysql-config:
##   host: remotemysql.com
##   port: 3306
##   dbname: ***
##   user: ***
##   drv: !expr RMySQL::MySQL()
##   password: ***

devtools::install_github('daroczig/dbr')
library(dbr)

options('dbr.db_config_path' = '~/projects/KRE-stat-prog-3/database.yaml')
options('dbr.output_format' = 'data.table')

library(dbr)
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
    'https://api.exchangeratesapi.io/history',
    query = list(start_at = Sys.Date() - 30, end_at = Sys.Date(),
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
