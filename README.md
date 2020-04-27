This is the R script repository of the "Statisztikai programozás III." course in the 2019/2020 Spring term, part of the [Szociológia MA, "Big Data elemézés" specializáció](https://btk.kre.hu/index.php/szociologia-ma) at [KRE](http://www.kre.hu/english). 

## Table of Contents

* [Syllabus](https://github.com/daroczig/KRE-stat-prog-3#syllabus)
* [Technical Prerequisites](https://github.com/daroczig/KRE-stat-prog-3#technical-prerequisites)
* [Class Schedule](https://github.com/daroczig/KRE-stat-prog-3#class-schedule)

    * [Week 1](https://github.com/daroczig/KRE-stat-prog-3#week-1)
    * [Week 2](https://github.com/daroczig/KRE-stat-prog-3#week-2)
    * [Week 3](https://github.com/daroczig/KRE-stat-prog-3#week-3)
    * [Week 4](https://github.com/daroczig/KRE-stat-prog-3#week-4)

* [Contact](https://github.com/daroczig/KRE-stat-prog-3#contacts)

## Schedule

5 x 3 x 90 mins on February 17, March 2, March 16, April 27 and May 11:

* 10:00 - 11:30 session 1
* 11:30 - 12:00 lunch break
* 12:00 - 13:20 session 2
* 13:20 - 13:40 coffee break
* 13:40 - 15:00 session 3

## Syllabus

Please find in the `syllabus` folder of this repository.

## Technical Prerequisites

Please bring your own laptop and make sure to install the below items **before** attending the first class:

1. Install `R` from https://cran.r-project.org
2. Install `RStudio Desktop` (Open Source License) from https://www.rstudio.com/products/rstudio/download
3. Register an account at https://github.com
4. Enter the following commands in the R console (bottom left panel of RStudio) and make sure you see a plot in the bottom right panel and no errors in the R console:

```r
install.packages(c('ggplot2', 'gganimate', 'transformr', 'gifski'))
library(ggplot2)
library(gganimate)
ggplot(diamonds, aes(cut)) + geom_bar() +
    transition_states(color, state_length = 0.1)
```

Optional steps I highly suggest to do as well before attending the class if you plan to use `git`:

4. Bookmark, watch or star this repository so that you can easily find it later
5. Install `git` from https://git-scm.com/
6. Verify that in RStudio, you can see the path of the `git` executable binary in the Tools/Global Options menu's "Git/Svn" tab -- if not, then you might have to restart RStudio (if you installed git after starting RStudio) or installed git by not adding that to the PATH on Windows. Either way, browse the "git executable" manually (in some `bin` folder look for thee `git` executable file).
7. Create an RSA key (optionally with a passphrase for increased security -- that you have to enter every time you push and pull to and from GitHub). Copy the public key and add that to you SSH keys on your GitHub profile.
8. Create a new project choosing "version control", then "git" and paste the SSH version of the repo URL copied from GitHub in the pop-up -- now RStudio should be able to download the repo. If it asks you to accept GitHub's fingerprint, say "Yes".
9. If RStudio/git is complaining that you have to set your identity, click on the "Git" tab in the top-right panel, then click on the Gear icon and then "Shell" -- here you can set your username and e-mail address in the command line, so that RStudio/git integration can work. Use the following commands:

    ```sh
    $ git config --global user.name "Your Name"
    $ git config --global user.email "Your e-mail address"
    ```
    Close this window, commit, push changes, all set.

Find more resources in Jenny Bryan's "[Happy Git and GitHub for the useR](http://happygitwithr.com/)" tutorial if in doubt or [contact me](#contact).

## Class Schedule

Will be updated from week to week.

### Week 1

1. Warm-up exercise and security reminder: [1.R](1.R#L1)
2. Intro / recap on R and ggplot2 from previous courses by introducing MDS: [1.R](1.R#L22)
3. Scaling / standardizing variables: [1.R](1.R#L107)
4. Simpson's paradox: [1.R](1.R#L150)
5. Intro to `data.table`: [1.R](1.R#L194)

Suggested reading:

* [Introduction to `data.table`](https://rdatatable.gitlab.io/data.table/articles/datatable-intro.html)
* [`data.table` FAQ](https://rdatatable.gitlab.io/data.table/articles/datatable-faq.html)
* [Database-like ops benchmark](https://h2oai.github.io/db-benchmark/)

Optional homework:

1. Load `bookings` data from http://bit.ly/CEU-R-hotels-2018-prices and the hotel `features` from http://bit.ly/CEU-R-hotels-2018-features
2. Count the number of 4 stars hotels in Hungary
3. Compute the average rating of 4 and 5 star hotels in Hungary and Germany
4. Round up the previously computed average rating to 2 digits
5. Do we have any bookings in unknown hotels (as per the features dataset)?
6. Clean up the bookings dataset from bookings from unknown hotels and print the number of remaining bookings
7. What's the average distance of hotels from the city central in Budapest?
8. List all neighbourhoods in Budapest
9. Compute the average distance from the city center for the neighbourhoods in Budapest
10. Count the number of bookings in Hungary
11. Count the number of nights booked in Hungary
12. Compute the average number of nights per booking in Hungary

### Week 2

1. Git and GitHub: commits, branches, forking, RStudio projects, pushing and pulling, pull requests, merging
2. Solutions to the 1st week's homeworks [2.R](2.R#L1)
3. R markdown [2.Rmd](2.Rmd)
4. Anscombe's quartett [2.R](2.R#50)
5. Datasaurus [2.R](2.R#115)
6. Tweaking `ggplot2` themes [2.R](2.R#161)

Optional homework:

1. Create an R markdown document visualizing the association between the variables of http://bit.ly/CEU-R-numbers
2. Create an R markdown document with at least 5 different approaches on visualizing the association between the variables of http://bit.ly/CEU-R-numbers-set

### Week 3

1. Alternatives to boxplot [3.R](3.R#1)
2. Interactive plots [3.R](3.R#54)
3. Introduction to Shiny [3.R](3.R#97)
3. Processing data loaded from the Internet:

    * We have 0.42 Bitcoin -- let's report on the value in USD [3.R](3.R#210)
    * Let's report on the value in HUF [3.R](3.R#220)
    * Let's report on the value in HUF for the past 30 days [3.R](3.R#210)
    * Let's report on the value in HUF for the past 30 days (keeping in mind that USDHUF rate also changed) [3.R](3.R#323)
    * Now We have 0.42 Bitcoin and 1.2 Ethereum, let's report on the value in HUF for the past 30 days (eg stacked barchart) [3.R](3.R#394)

Optional homework:

1. Create an account at https://remotemysql.com
2. Create a database and check out via the PhpMyAdmin app
3. Note the database name, username, password and create a database config YAML file to be used by the `dbr` package, eg something like

    ```yaml
    remotemysql:
      host: remotemysql.com
      port: 3306
      dbname: ***
      user: ***
      drv: !expr RMySQL::MySQL()
      password: ***
    ```

4. Read the number of Bitcoin and Ethereum from the database and report on the value of those in the past 30 days [3-homework.R](3-homework.R#1)
5. Instead of reading a static balance, fetch the cryptocurrency exchange transactions to do the above report [3-homework.R](3-homework.R#73)

Preparations for the next week:

* please ensure that Java is installed on your computer
* install the `h2o` R package from CRAN

### Week 4

We have 0.42 Bitcoin. Let's write an R script reporting on the current value of this asset in USD.

<details>
  <summary>Click here for a potential solution ...</summary>

```r
library(devtools)
install_github('daroczig/binancer')

library(binancer)
coin_prices <- binance_ticker_all_prices()

library(data.table)
coin_prices[from == 'BTC' & to == 'USDT', to_usd]

## alternative solution
coin_prices <- binance_coins_prices()
coin_prices[symbol == 'BTC', usd]

## don't forget that we need to report on the price of 0.42 BTC instead of 1 BTC
coin_prices[symbol == 'BTC', usd * 0.42]
```

</details>

Let's do the same report as above, but instead of USD, now let's report in Hungarian Forints.

<details>
  <summary>Click here for a potential solution ...</summary>

```r
## How to get USD/HUF rate?
## See eg https://exchangeratesapi.io for free API access

## Loading data without any dependencies
https://api.exchangeratesapi.io/latest
https://api.exchangeratesapi.io/latest?base=USD

readLines('https://api.exchangeratesapi.io/latest?base=USD')

## Parse JSON
library(jsonlite)
fromJSON(readLines('https://api.exchangeratesapi.io/latest?base=USD'))
fromJSON('https://api.exchangeratesapi.io/latest?base=USD')

## Extract the USD/HUF exchange rate from the list
usdhuf <- fromJSON('https://api.exchangeratesapi.io/latest?base=USD&symbols=HUF')$rates$HUF
coin_prices[symbol == 'BTC', 0.42 * usd * usdhuf]
```

</details>

<details>
  <summary>Click here for a potential solution ... after cleaning up</summary>

```r
## loading requires packages on the top of the script
library(binancer)
library(httr)

## constants
BITCOINS <- 0.42

## get Bitcoin price in USD
coin_prices <- binance_coins_prices()
btcusdt <- coin_prices[symbol == 'BTC', usd]

## get USD/HUF exchange rate
usdhuf <- fromJSON('https://api.exchangeratesapi.io/latest?base=USD&symbols=HUF')$rates$HUF

## report
BITCOINS * btcusdt * usdhuf
```

</details>

<details>
  <summary>Click here for a potential solution ... with logging</summary>

```r
library(binancer)
library(httr)
library(data.table)
library(logger)

BITCOINS <- 0.42

coin_prices <- binance_coins_prices()
log_info('Found {coin_prices[, .N]} coins on Binance')
btcusdt <- coin_prices[symbol == 'BTC', usd]
log_info('The current Bitcoin price is ${btcusdt}')

usdhuf <- fromJSON('https://api.exchangeratesapi.io/latest?base=USD&symbols=HUF')$rates$HUF
log_info('1 USD currently costs {usdhuf} Hungarian Forints')

log_eval(forint(BITCOINS * btcusdt * usdhuf), level = INFO)
log_info('{BITCOINS} Bitcoins now worth {round(btcusdt * usdhuf * BITCOINS)} HUF')
```

</details>

<details>
  <summary>Click here for a potential solution ... with validating values received from the API</summary>

```r
library(binancer)
library(httr)
library(data.table)
library(logger)
library(checkmate)

BITCOINS <- 0.42

coin_prices <- binance_coins_prices()
log_info('Found {coin_prices[, .N]} coins on Binance')
btcusdt <- coin_prices[symbol == 'BTC', usd]
log_info('The current Bitcoin price is ${btcusdt}')
assert_number(btcusdt, lower = 1000)

usdhuf <- fromJSON('https://api.exchangeratesapi.io/latest?base=USD&symbols=HUF')$rates$HUF
log_info('1 USD currently costs {usdhuf} Hungarian Forints')
assert_number(usdhuf, lower = 250, upper = 500)

log_info('{BITCOINS} Bitcoins now worth {round(btcusdt * usdhuf * BITCOINS)} HUF')
```

</details>

<details>
  <summary>Click here for a potential solution ... with auto-retries for API errors</summary>

```r
library(binancer)
library(httr)
library(data.table)
library(logger)
library(checkmate)

BITCOINS <- 0.42

get_bitcoin_price <- function() {
  tryCatch(
    binance_coins_prices()[symbol == 'BTC', usd],
    error = function(e) get_bitcoin_price())
}

btcusdt <- get_bitcoin_price()
log_info('The current Bitcoin price is ${btcusdt}')
assert_number(btcusdt, lower = 1000)

usdhuf <- fromJSON('https://api.exchangeratesapi.io/latest?base=USD&symbols=HUF')$rates$HUF
log_info('1 USD currently costs {usdhuf} Hungarian Forints')
assert_number(usdhuf, lower = 250, upper = 500)

log_info('{BITCOINS} Bitcoins now worth {round(btcusdt * usdhuf * BITCOINS)} HUF')
```

</details>

<details>
  <summary>Click here for a potential solution ... with auto-retries for API errors with exponential backoff</summary>

```r
library(binancer)
library(httr)
library(data.table)
library(logger)
library(checkmate)

BITCOINS <- 0.42

get_bitcoin_price <- function(retried = 0) {
  tryCatch(
    binance_coins_prices()[symbol == 'BTC', usd],
    error = function(e) {
      ## exponential backoff retries
      Sys.sleep(1 + retried^2)
      get_bitcoin_price(retried = retried + 1)
    })
}

btcusdt <- get_bitcoin_price()
log_info('The current Bitcoin price is ${btcusdt}')
assert_number(btcusdt, lower = 1000)

usdhuf <- fromJSON('https://api.exchangeratesapi.io/latest?base=USD&symbols=HUF')$rates$HUF
log_info('1 USD currently costs {usdhuf} Hungarian Forints')
assert_number(usdhuf, lower = 250, upper = 500)

log_info('{BITCOINS} Bitcoins now worth {round(btcusdt * usdhuf * BITCOINS)} HUF')
```

</details>

<details>
  <summary>Click here for a potential solution ... with better currency formatter</summary>

```r
round(btcusdt * usdhuf * BITCOINS)
format(btcusdt * usdhuf * BITCOINS, big.mark = ',', digits = 10)
format(btcusdt * usdhuf * BITCOINS, big.mark = ',', digits = 6)

library(scales)
dollar(btcusdt * usdhuf * BITCOINS)
dollar(btcusdt * usdhuf * BITCOINS, prefix = '', suffix = ' HUF')

forint <- function(x) {
  dollar(x, prefix = '', suffix = ' HUF')
}
forint(btcusdt * usdhuf * BITCOINS)
```

</details>

To move the helper function into their own package:

1. Click File / New Project / New folder and create a new R package (maybe call it `btc`, also create a git repo for it) -- that will fill in your newly created folder with a package skeleton delivering the `hello` function in the `hello.R` file.

2. Get familiar with:

    * the `DESCRIPTION` file

        * semantic versioning: https://semver.org
        * open-source license, see eg http://r-pkgs.had.co.nz/description.html#license or https://rstats-pkgs.readthedocs.io/en/latest/licensing.html

    * the `R` subfolder
    * the `man` subfolder
    * the `NAMESPACE` file

3. Install the package (in the Build menu), load it and try `hello()`, then `?hello`
4. Create a git repo (if not done that already) and add/commit this package skeleton
5. Add a new function called `forint` in the `R` subfolder:

    <details>
      <summary><code>forint.R</code></summary>

    ```r
    forint <- function(x) {
      dollar(x, prefix = '', suffix = ' HUF')
    }
    ```

    </details>

6. Install the package, re-load it, and try running `forint` eg calling on `42` -- realize it's failing
7. After loading the `scales` package (that delivers the `dollar` function), it works ... we need to prepare our package to load `scales::dollar` without user interventation
8. Also, look at the docs of `forint` -- realize it's missing, so let's learn about `roxygen2` and update the `forint.R` file to explicitely list the function to be exported and note that `dollar` is to be imported from the `scales` package:

    <details>
      <summary><code>forint.R</code></summary>

    ```r
    #' Formats Hungarian Forint
    #' @param x number
    #' @return string
    #' @export
    #' @importFrom scales dollar
    #' @examples
    #' forint(100000)
    #' forint(10.3241245125125)
    forint <- function(x) {
      dollar(x, prefix = '', suffix = ' HUF')
    }
    ```

    </details>

9. Run `roxygen2` on the package by enabling it in the "Build" menu's "Configure Build Tools", then "Document" it (if there's no such option, probably you need to install the `roxygen2` package first), and make sure to check what changes happened in the `man`, `NAMESPACE` (you might need to delete the original one) and `DESCRIPTION` files. It's also a good idea to automatically run `roxygen2` before each install, so I'd suggests marking that option as well. The resulting files should look something like:

    <details>
      <summary><code>DESCRIPTION</code></summary>

    ```
    Package: btc
    Type: Package
    Title:  functions for Bitcoin
    Version: 0.1.0
    Author: Gergely <***@***.***>
    Maintainer: Gergely <***@***.***>
    Description:  functions for Bitcoin
    License: GPL-3
    Encoding: UTF-8
    LazyData: true
    RoxygenNote: 7.1.0
    Imports: scales
    ```

    </details>

    <details>
      <summary><code>NAMESPACE</code></summary>

    ```
    # Generated by roxygen2: do not edit by hand

    export(forint)
    importFrom(scales,dollar)
    ```

    </details>

10. Keep committing to the git repo
11. Delete `hello.R` and rerun `roxygen2` / reinstall the package
12. Add a new function that gets the most recent price of a Bitcoin and HUF in USD with retries:

    <details>
      <summary><code>get_bitcoin_price.R</code></summary>

    ```r
    #' Get BTC price
    #' @param retried number of times previously retried (and failed) the API query
    #' @return number
    #' @export
    #' @importFrom binancer binance_coins_prices
    #' @importFrom checkmate assert_number
    #' @importFrom logger log_info log_error
    get_bitcoin_price <- function(retried = 0) {
      tryCatch({
        ## fall back to data.frame syntax not to load data.table
        btcusd <- subset(binance_coins_prices(), symbol == 'BTC')$usd
        assert_number(btcusd, lower = 3000, upper = 10000)
        log_info('Current price of a BTC is {dollar(btcusd)}')
        btcusd
      },
      error = function(e) {
        log_error(e$message)
        if (retried > 5) {
          stop('gave up')
        }
        Sys.sleep(1 + retried^2)
        get_bitcoin_price(retried = retried + 1)
      }
      )
    }
    ```

    </details>

    <details>
      <summary><code>get_usdhuf.R</code></summary>

    ```r
    #' Get USD/HUF rate
    #' @return number
    #' @importFrom httr GET content
    #' @importFrom logger log_info
    #' @export
    get_usdhuf <- function() {
      usdhuf <- content(GET('https://api.exchangeratesapi.io/latest?base=USD'))$rates$HUF
      log_info('Current USD/HUF rate is {usdhuf}')
      usdhuf
    }
    ```

    </details>

13. Now you can run the original R script hitting the Binance and ExchangeRatesAPI by using these helper functions:

```r
library(binancer)
library(jsonlite)
library(logger)
library(checkmate)
library(scales)
log_threshold(TRACE)
library(btc)

BITCOINS <- 0.42
log_info('Number of Bitoins: {BITCOINS}')

btcusd <- get_bitcoin_price()
usdhuf <- get_usdhuf()
log_eval(forint(BITCOINS * btcusd * usdhuf))
```

Introduction to time-series modeling and forecasting: [4.R](4.R)

Suggested reading:

* http://happygitwithr.com
* https://otexts.org/fpp2

### Week 5

To be uploaded after the class.


## Home Assignment

1. Create an R package with an open-source license and push to a public GitHub repo
2. Add a function called `usd_rate` that looks up the most recent USD exchange rate for the provided `currency` parameter (defaults to `EUR`) via an exchangeratesapi.io API call and returns the rate as a number
3. Add `convert_usd_to_eur` function that calls `usd_rate` to compute and return the provided USD `amount` in EUR (as a number)
4. Add `eur` function to the package, similar to `scales::dollar`, that formats a number to a string using the Euro sign, rounding up to 2 digits and using the comma as the `big.mark` (every 3 decimals)
5. Write a function that reverses `eur`, eg call it `uneur`, so it takes a string (eg `"-€0.10"`) and transforms to a number (eg `-0.10` in this case). Make sure it works with the "big mark" as well (eg for `"€100,000"`)
6. Read http://r-pkgs.had.co.nz/tests.html and write unit tests for `uneur` to make sure it can parse `€4`, `-€2`, `€0.00`, `-€42`, `€3,423.42`
7. Create a screenshot on the results of running the unit tests and share along with the GitHub repo URL on Neptun

## Contact

File a [GitHub ticket](https://github.com/daroczig/KRE-stat-prog-3/issues).
