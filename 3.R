## #############################################################################
## alternatives to boxplot
## #############################################################################

## TODO someone share the screen and let's review

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

## TODO do similar exploratory data analysis on the below dataset
df <- read.csv('http://bit.ly/CEU-R-numbers')
## generated at https://gist.github.com/daroczig/23d1323652a70c03b27cfaa6b080aa3c

ggplot(df, aes(x, y)) + geom_point()
ggplot(df, aes(x, y)) + geom_point(alpha = 0.05)
ggplot(df, aes(x, y)) + geom_point(size = 0.2, alpha = 0.1)
ggplot(df, aes(x, y)) + geom_hex(binwidth = 25)

## ###############################################################################################
## interactive plots
## ###############################################################################################

## plot weight and acceleration of cars on a scatterplot
## colored by transmission again
ggplot(mtcars, aes(wt, qsec, color = factor(am))) + geom_point()

p <- last_plot()

library(ggiraph)
?girafe
girafe(ggobj = p)
## not much change, only an extra export feature?
## although can highlight, also shows up in the Viewer (where the anims went as well)

p <- ggplot(mtcars, aes(
  x = wt,
  y = qsec,
  color = factor(am),
  ## paste('Number of gears:', gear))
  tooltip = paste('Number of gears:', gear))) +
  geom_point_interactive()
girafe(ggobj = p)

p <- ggplot(mtcars, aes(
  x = wt,
  y = qsec,
  color = factor(am),
  data_id = factor(gear),
  ## paste('Number of gears:', gear))
  tooltip = rownames(mtcars))) +
  geom_point_interactive()
girafe(ggobj = p)
girafe(ggobj = p, options = list(opts_hover(css = "fill:black;")))

girafe(ggobj = p, options = list(
  opts_hover(css = "fill:black;"),
  opts_zoom(max = 2)
))

## see more at https://www.htmlwidgets.org

## ###############################################################################################
## basic shiny app
## ###############################################################################################

library(shiny)

## define the User Interface
ui <- shinyUI(fluidPage(

    ## title of the app
    titlePanel("The great mtcars analysis engine"),

    ## setting up the layout of the app: we will use a sidebar + a main panel
    sidebarLayout(

        sidebarPanel(
            selectInput('var', 'Variable', names(mtcars), selected = 'wt'),
            sliderInput('breaks', label = 'Breaks', min = 1, max = 10, value = 3, step = 1)
        ),

        mainPanel(
            plotOutput("plot")
        )
    )
))

## define the back-end
server <- shinyServer(function(input, output) {

    ## this is the default tab in the main tab
    output$plot <- renderPlot({
        hist(mtcars[, input$var], breaks = as.numeric(input$breaks))
    })

})

## start the Shiny app
shinyApp(ui = ui, server = server)

## note on splitting into two files

## ###############################################################################################
## a more complex shiny app
## ###############################################################################################

library(shiny)
library(ggplot2)

## define the User Interface
ui <- shinyUI(fluidPage(

    ## title of the app
    titlePanel("The great mtcars analysis engine"),

    ## setting up the layout of the app: we will use a sidebar + a main panel
    sidebarLayout(

        sidebarPanel(
            selectInput('var1', 'X', names(mtcars), selected = 'wt'),
            selectInput('var2', 'Y', names(mtcars), selected = 'mpg'),
            sliderInput("poly",
                        "Polynomial:", min = 1, max = 16, value = 1),
            selectInput('col', 'Color', c('gear', 'am', 'cyl')),
            checkboxInput('se', 'Conf intervals?')
        ),

        mainPanel(
            tabsetPanel(
                tabPanel("gglot", plotOutput("ggplot")),
                tabPanel("Model", verbatimTextOutput("model")),
                tabPanel("Coefficients", htmlOutput("coeff"))
            )
        )
    )
))

## define the back-end
server <- shinyServer(function(input, output) {

    ## this is the default tab in the main tab
    output$ggplot <- renderPlot({
        df <- mtcars
        df[, input$col] <- factor(df[, input$col])
        ggplot(df, aes_string(x = input$var1, y = input$var2, col = input$col)) +
            geom_point() +
            geom_smooth(method = 'lm', formula = y ~ poly(x, as.numeric(input$poly)),
                        se = input$se)
    })

    output$model <- renderPrint({
        fit <- lm(mtcars[, input$var2] ~ poly(mtcars[, input$var1], input$poly))
        summary(fit)
    })

    output$coeff <- renderTable({
        fit <- lm(mtcars[, input$var2] ~ poly(mtcars[, input$var1], input$poly))
        summary(fit)$coeff
    })

})

## start the Shiny app
shinyApp(ui = ui, server = server)

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
## 2. Let's report on the value in HUF
## #############################################################################

## How to get USD/HUF rate?
## See eg https://exchangeratesapi.io for free API access

readLines('https://api.exchangeratesapi.io/latest?base=USD')

library(httr)
response <- GET('https://api.exchangeratesapi.io/latest?base=USD')
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

## document, log , clean-up script

library(binancer)
library(httr)
library(data.table)
library(logger)

BITCOINS <- 0.42

coin_prices <- binance_coins_prices()
log_info('Found {coin_prices[, .N]} coins on Binance')
btcusdt <- coin_prices[symbol == 'BTC', usd]
log_info('The current Bitcoin price is ${btcusdt}')

response <- GET('https://api.exchangeratesapi.io/latest?base=USD')
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
## 3. Let's report on the value in HUF for the past 30 days
## #############################################################################

library(binancer)
library(httr)
library(data.table)
library(logger)

BITCOINS <- 0.42

coin_prices <- binance_klines('BTCUSDT', interval = '1d', limit = 30)
## ERROR [2019-04-28 14:43:22] Query to https://api.binance.com/api/v1/klines failed for the NAst/nd/rd/th time, retrying

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

response <- GET('https://api.exchangeratesapi.io/history?start_at=2019-04-01&end_at=2019-04-28&base=USD&symbols=HUF')

response <- GET(
    'https://api.exchangeratesapi.io/history',
    query = list(start_at = '2019-04-01', end_at = '2019-04-28', base = 'USD', symbols = 'HUF'))

response <- GET(
    'https://api.exchangeratesapi.io/history',
    query = list(start_at = Sys.Date() - 30, end_at = Sys.Date(),
                 base = 'USD', symbols = 'HUF'))
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

## is it indeed OK? weekends?

ggplot(balance, aes(date, value)) +
    geom_point(size = 3) +
    geom_line(color = 'blue', size = 2) +
    ylab('') + scale_y_continuous(labels = huf) +
    xlab('') +
    theme_bw() +
    ggtitle('My crypto fortune', subtitle = paste(BITCOINS, 'Bitcoin'))

balance <- coin_prices[, .(date = as.Date(close_time), btcusdt = close)]
setkey(balance, date)
setkey(usdhufs, date)
balance <- usdhufs[balance, roll = TRUE]

balance[, btchuf := btcusdt * usdhuf]
balance[, btc := 0.42]
balance[, value := btc * btchuf]

ggplot(balance, aes(date, value)) +
    geom_point(size = 3) +
    geom_line(color = 'blue', size = 2) +
    ylab('') + scale_y_continuous(labels = huf) +
    xlab('') +
    theme_bw() +
    ggtitle('My crypto fortune', subtitle = paste(BITCOINS, 'Bitcoin'))

## #############################################################################
## 5. Now We have 0.42 Bitcoin and 1.2 Ethereum, let's report on the value
##    in HUF for the past 30 days (eg stacked barchart)
## #############################################################################

balance

## QQ should we add a new column for eth and another for ethusdt?
## QQ what if we later buy some other cryto as well?
## wide VS long tables!!!

btc_prices <- binance_klines('BTCUSDT', interval = '1d', limit = 30)
eth_prices <- binance_klines('ETHUSDT', interval = '1d', limit = 30)

balance <- rbind(
    btc_prices[, .(date = as.Date(close_time), symbol = 'BTC', usdt = close)],
    eth_prices[, .(date = as.Date(close_time), symbol = 'ETH', usdt = close)])
balance[, amount := switch(symbol, 'BTC' = 0.42, 1.2), by = symbol]
setorder(balance, date, symbol)
balance

## DRY
balance <- rbindlist(lapply(c('BTC', 'ETH'), function(s){
    binance_klines(paste0(s, 'USDT'), interval = '1d', limit = 30)[
      , .(date = as.Date(close_time), symbol = s, usdt = close)]
}))
balance[, amount := switch(symbol, 'BTC' = 0.42, 1.2), by = symbol]

## merge & plot
setkey(balance, date)
setkey(usdhufs, date)
balance <- usdhufs[balance, roll = TRUE]

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

