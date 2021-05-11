This is the R script repository of the "Statisztikai programozás III." course in the 2020/2019 Spring term, part of the [Szociológia MA, "Big Data elemézés" specializáció](https://btk.kre.hu/index.php/szociologia-ma) at [KRE](http://www.kre.hu/english).

## Table of Contents

* [Syllabus](https://github.com/daroczig/KRE-stat-prog-3#syllabus)
* [Technical Prerequisites](https://github.com/daroczig/KRE-stat-prog-3#technical-prerequisites)
* [Class Schedule](https://github.com/daroczig/KRE-stat-prog-3#class-schedule)

    * [Week 1](https://github.com/daroczig/KRE-stat-prog-3#week-1)
    * [Week 2](https://github.com/daroczig/KRE-stat-prog-3#week-2)
    * [Week 3](https://github.com/daroczig/KRE-stat-prog-3#week-3)
    * [Week 4](https://github.com/daroczig/KRE-stat-prog-3#week-4)
    * [Week 5](https://github.com/daroczig/KRE-stat-prog-3#week-5)
    * [Week 6](https://github.com/daroczig/KRE-stat-prog-3#week-6)

* [Contact](https://github.com/daroczig/KRE-stat-prog-3#contacts)

## Schedule

6 x 3 x 90 mins on February 15, March 1, March 22, April 12, April 26 and May 10:

* 12:00 - 13:30 session 1
* 13:30 - 14:30 lunch break
* 14:30 - 16:00 session 2
* 16:00 - 16:30 coffee break
* 16:30 - 18:00 session 3

Please check Neptun / your email inbox for Google Meet URL.

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
2. Intro / recap on R and ggplot2 from previous courses by introducing MDS: [1.R](1.R#L23)
3. Scaling / standardizing variables: [1.R](1.R#L87)
4. Simpson's paradox: [1.R](1.R#L112)
5. Intro to `data.table`: [1.R](1.R#L156)

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
3. Anscombe's quartett [2.R](2.R#65)
4. Datasaurus [2.R](2.R#116)
5. Tweaking `ggplot2` themes [2.R](2.R#162)
6. Interactive plots [2.R](2.R#237)

#### Welcome to AWS!

1. Use the demo AWS account: https://502337876746.signin.aws.amazon.com/console
2. Secure your access key(s), other credentials and any login information ...

    <details><summary>... because a truly wise person learns from the mistakes of others!</summary>

    > "When I woke up the next morning, I had four emails and a missed phone call from Amazon AWS - something about 140 servers running on my AWS account, mining Bitcoin"
    -- [Hoffman said](https://www.theregister.co.uk/2015/01/06/dev_blunder_shows_github_crawling_with_keyslurping_bots)

    > "Nevertheless, now I know that Bitcoin can be mined with SQL, which is priceless ;-)"
    -- [Uri Shaked](https://medium.com/@urish/thank-you-google-how-to-mine-bitcoin-on-googles-bigquery-1c8e17b04e62)

    So set up 2FA (go to IAM / Users / username / Security credentials / Assigned MFA device): https://console.aws.amazon.com/iam

    PS probably you do not really need to store any access keys, but you may rely on roles (and the Key Management Service, and the Secrets Manager and so on)
    </details>

3. Let's use the `eu-west-1` Ireland region

#### Getting access to EC2 boxes

**Note**: we follow the instructions on Windows, but please find below how to access the boxes from Mac or Linux as well when working with the instances remotely.

1. Create (or import) an SSH key in AWS (EC2 / Key Pairs): https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#KeyPairs:sort=keyName
2. Get an SSH client:

    * Windows -- Download and install PuTTY: https://www.putty.org
    * Mac -- Install PuTTY for Mac using homebrew or macports

        ```sh
        sudo brew install putty
        sudo port install putty
        ```

    * Linux -- probably the OpenSSH client is already installed, but to use the same tools on all operating systems, please install and use PuTTY on Linux too, eg on Ubuntu:

        ```sh
        sudo apt install putty
        ```

3. ~~Convert the generated pem key to PuTTY format~~No need to do this anymore, AWS can provide the key as PPK now.

    * GUI: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html#putty-private-key
    * CLI:

        ```sh
        puttygen key.pem -O private -o key.ppk
        ```

4. Make sure the key is readable only by your Windows/Linux/Mac user, eg

    ```sh
    chmod 0400 key.ppk
    ```

#### Create and connect to an EC2 box

1. Create a tiny EC2 instance

    0. Optional: create an Elastic IP for your box
    1. Go the the Instances overview at https://eu-west-1.console.aws.amazon.com/ec2/v2/home?region=eu-west-1#Instances:sort=instanceId
    2. Click "Launch Instance"
    3. Pick the `Ubuntu Server 20.04 LTS (HVM), SSD Volume Type` AMI
    4. Pick `t3.micro` instance type (see more [instance types](https://aws.amazon.com/ec2/instance-types))
    5. Click "Review and Launch"
    6. Pick a unique name for the security group after clicking "Edit Security Group"
    7. Click "Launch"
    8. Select your AWS key created above and launch

2. Connect to the box

    1. Specify the hostname or IP address

    ![](https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/images/vm-putty-1.png)

    2. Specify the key for authentication

    ![](https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/images/vm-putty-2.png)

    3. Set the username to `ubuntu` on the Connection/Data tab
    4. Save the Session profile
    5. Click the "Open" button
    6. Accept & cache server's host key

Alternatively, you can connect via a standard SSH client on a Mac or Linux, something like:

```sh
chmod 0400 /path/to/your/pem
ssh -i /path/to/your/pem -p 8000 ubuntu@ip-address-of-your-machine
```

#### Install RStudio Server on EC2

1. Look at the docs: https://www.rstudio.com/products/rstudio/download-server
2. Download Ubuntu `apt` package list

    ```sh
    sudo apt update
    ```

3. Install dependencies

    ```sh
    sudo apt install r-base gdebi-core
    ```

4. Try R

    ```sh
    R
    ```

    For example:

    ```r
    1 + 4
    hist(mtcars$hp)
    ```

5. Install RStudio Server

    ```sh
    wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1106-amd64.deb
    sudo gdebi rstudio-server-1.4.1106-amd64.deb
    ```

6. Check process and open ports

    ```sh
    rstudio-server status
    sudo rstudio-server status
    sudo systemctl status rstudio-server
    sudo ps aux| grep rstudio
    sudo netstat -tapen | grep LIST
    sudo netstat -tapen
    ```

7. Look at the docs: http://docs.rstudio.com/ide/server-pro/

#### Connect to the RStudio Server

1. Confirm that the service is up and running and the port is open

    ```console
    ubuntu@ip-172-31-12-150:~$ sudo netstat -tapen | grep LIST
    tcp        0      0 0.0.0.0:8787            0.0.0.0:*               LISTEN      0          49065       23587/rserver
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      0          15671       1305/sshd
    tcp6       0      0 :::22                   :::*                    LISTEN      0          15673       1305/sshd
    ```

2. Try to connect to the host from a browser on port 8787, eg http://foobar.eu-west-1.compute.amazonaws.com:8787
3. Realize it's not working
4. Open up port 8787 in the security group

    ![](https://d2908q01vomqb2.cloudfront.net/b6692ea5df920cad691c20319a6fffd7a4a766b8/2017/10/12/r-update-1.gif)

5. Authentication: http://docs.rstudio.com/ide/server-pro/authenticating-users.html
6. Create a new user:

    ```console
    sudo adduser kre
    ```

7. Login & quick demo:

    ```r
    1+2
    plot(mtcars)
    install.packages('fortunes')
    library(fortunes)
    fortune()
    fortune(200)
    system('whoami')
    ```

8. Reload webpage (F5), realize we continue where we left the browser :)
9. Demo the terminal:

    ```console
    $ whoami
    kre
    $ sudo whoami
    kre is not in the sudoers file.  This incident will be reported.
    ```

8. Grant sudo access to the new user by going back to SSH with `root` access:

    ```sh
    sudo apt install -y mc
    sudo mc
    sudo mcedit /etc/sudoers
    sudo adduser kre admin
    man adduser
    man deluser
    ```

Note 1: might need to relogin / restart RStudio / reload R / reload page
Note 2: you might want to add `NOPASSWD` to the `sudoers` file:

    ```sh
    kre ALL=(ALL) NOPASSWD:ALL
    ```

Although also note (3) the related security risks.

9. Custom login page: http://docs.rstudio.com/ide/server-pro/authenticating-users.html#customizing-the-sign-in-page
10. Custom port: http://docs.rstudio.com/ide/server-pro/access-and-security.html#network-port-and-address

Optional homework:

1. Use `ggplot2` to provide at least 5 different approaches on visualizing the association between the variables of http://bit.ly/CEU-R-numbers
2. Participate in the TidyTuesday project: https://github.com/rfordatascience/tidytuesday

### Week 3

1. Warm-up dataviz exercise on going beyond boxplots [3.R](3.R)
2. Cloud-infra and job scheduling (see below)

#### Installing packages

1. Installing packages as on a desktop:

    ```sh
    ## don't do this at this point!
    ## install.packages('ggplot2')
    ```

2. Use binary packages instead via apt & Launchpad PPA:

    ```sh
    sudo add-apt-repository ppa:marutter/rrutter
    sudo add-apt-repository ppa:marutter/c2d4u

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install r-cran-ggplot2
    ```

3. Ready to use it from R after restarting the session:

    ```r
    library(ggplot2)
    ggplot(mtcars, aes(hp)) + geom_histogram()
    ```

4. Get some real-time data and visualize it:

    1. Install the `devtools` R package and a few others (binary distribution) in the RStudio/Terminal:

        ```sh
        sudo apt-get install r-cran-devtools r-cran-data.table r-cran-httr r-cran-jsonlite r-cran-data.table r-cran-stringi r-cran-stringr r-cran-glue
        ```

    2. Switch back to the R console and install the `binancer`  R package from GitHub to interact with crypto exchanges (note the extra dependency to be installed from CRAN):

        ```r
        install.packages('snakecase')
        devtools::install_github('daroczig/binancer', upgrade_dependencies = FALSE)
        ```

    3. First steps with live data: load the `binancer` package and then use the `binance_klines` function to get the last 3 hours of Bitcoin price changes (in USD) with 1-minute granularity -- resulting in an object like:

        ```r
        > str(klines)
        Classes ‘data.table’ and 'data.frame':  180 obs. of  12 variables:
         $ open_time                   : POSIXct, format: "2020-03-08 20:09:00" "2020-03-08 20:10:00" "2020-03-08 20:11:00" "2020-03-08 20:12:00" ...
         $ open                        : num  8292 8298 8298 8299 8298 ...
         $ high                        : num  8299 8299 8299 8299 8299 ...
         $ low                         : num  8292 8297 8297 8298 8296 ...
         $ close                       : num  8298 8298 8299 8298 8299 ...
         $ volume                      : num  25.65 9.57 20.21 9.65 24.69 ...
         $ close_time                  : POSIXct, format: "2020-03-08 20:09:59" "2020-03-08 20:10:59" "2020-03-08 20:11:59" "2020-03-08 20:12:59" ...
         $ quote_asset_volume          : num  212759 79431 167677 80099 204883 ...
         $ trades                      : int  371 202 274 186 352 271 374 202 143 306 ...
         $ taker_buy_base_asset_volume : num  13.43 5.84 11.74 7.12 15.24 ...
         $ taker_buy_quote_asset_volume: num  111430 48448 97416 59071 126493 ...
         $ symbol                      : chr  "BTCUSDT" "BTCUSDT" "BTCUSDT" "BTCUSDT" ...
         - attr(*, ".internal.selfref")=<externalptr>
        ```

        <details><summary>Click here for the code generating the above ...</summary>

        ```r
        library(binancer)
        klines <- binance_klines('BTCUSDT', interval = '1m', limit = 60*3)
        str(klines)
        summary(klines$close)
        ```
        </details>

    4. Visualize the data, eg on a simple line chart:

        ![](https://raw.githubusercontent.com/daroczig/CEU-R-prod/2019-2020/images/binancer-plot-1.png)

        <details><summary>Click here for the code generating the above ...</summary>

        ```r
        library(ggplot2)
        ggplot(klines, aes(close_time, close)) + geom_line()
        ```
        </details>

    5. Now create a candle chart, something like:

        ![](https://raw.githubusercontent.com/daroczig/CEU-R-prod/2019-2020/images/binancer-plot-2.png)

        <details><summary>Click here for the code generating the above ...</summary>

        ```r
        library(scales)
        ggplot(klines, aes(open_time)) +
            geom_linerange(aes(ymin = open, ymax = close, color = close < open), size = 2) +
            geom_errorbar(aes(ymin = low, ymax = high), size = 0.25) +
            theme_bw() + theme('legend.position' = 'none') + xlab('') +
            ggtitle(paste('Last Updated:', Sys.time())) +
            scale_y_continuous(labels = dollar) +
            scale_color_manual(values = c('#1a9850', '#d73027')) # RdYlGn
        ```
        </details>

    6. Compare prices of 4 currencies (eg ETH, ARK, NEO and IOTA) in the past 24 hours on 15 mins intervals:

        ![](https://raw.githubusercontent.com/daroczig/CEU-R-prod/2019-2020/images/binancer-plot-3.png)

        <details><summary>Click here for the code generating the above ...</summary>

        ```r
        library(data.table)
        klines <- rbindlist(lapply(
            c('ETHBTC', 'ARKBTC', 'NEOBTC', 'IOTABTC'),
            binance_klines,
            interval = '15m', limit = 4*24))
        ggplot(klines, aes(open_time)) +
            geom_linerange(aes(ymin = open, ymax = close, color = close < open), size = 2) +
            geom_errorbar(aes(ymin = low, ymax = high), size = 0.25) +
            theme_bw() + theme('legend.position' = 'none') + xlab('') +
            ggtitle(paste('Last Updated:', Sys.time())) +
            scale_color_manual(values = c('#1a9850', '#d73027')) +
             facet_wrap(~symbol, scales = 'free', nrow = 2)
        ```
        </details>

    7. Some further useful functions:

        - `binance_ticker_all_prices()`
        - `binance_coins_prices()`
        - `binance_credentials` and `binance_balances`

    8. Create an R script that reports and/or plots on some cryptocurrencies, ideas:

        - compute the (relative) change in prices of cryptocurrencies in the past 24 / 168 hours
        - go back in time 1 / 12 / 24 months and "invest" $1K in BTC and see the value today
        - write a bot buying and selling crypto on a virtual exchange

#### Create a user for every member of the team

We'll export the list of IAM users from AWS and create a system user for everyone.

1. Attach a newly created IAM EC2 Role (let's call it `ceudataserver`) to the EC2 box and assign 'Read-only IAM access':

    ![](https://raw.githubusercontent.com/daroczig/CEU-R-prod/master/images/ec2-new-role.png)

    ![](https://raw.githubusercontent.com/daroczig/CEU-R-prod/master/images/ec2-new-role-type.png)

    ![](https://raw.githubusercontent.com/daroczig/CEU-R-prod/master/images/ec2-new-role-rights.png)

2. Install AWS CLI tool:

    ```
    sudo apt update
    sudo apt install awscli
    ```

3. List all the IAM users: https://docs.aws.amazon.com/cli/latest/reference/iam/list-users.html

   ```
   aws iam list-users
   ```

4. Export the list of users from R:

   ```
   library(jsonlite)
   users <- fromJSON(system('aws iam list-users', intern = TRUE))
   str(users)
   users[[1]]$UserName
   ```

5. Create a new system user on the box (for RStudio Server access) for every IAM user:

   ```
   library(logger)
   for (user in users[[1]]$UserName) {
     log_info('Creating {user}')
     system(sprintf("sudo adduser --disabled-password --quiet --gecos '' %s", user))
     log_info('Setting password for {user}')
     system(sprintf("echo '%s:secretpass' | sudo chpasswd", user)) ## note the single quotes + sudo
   }
   ```

Note, you may have to temporarily enable passwordless `sudo` for this user :/

```
kre ALL=(ALL) NOPASSWD:ALL
```

Check users:

```
readLines('/etc/passwd')
```

#### Prepare to schedule R commands

![](https://wiki.jenkins-ci.org/download/attachments/2916393/fire-jenkins.svg)

1. Install Jenkins from the RStudio/Terminal: https://pkg.jenkins.io/debian-stable/

    ```sh
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee -a /etc/apt/sources.list
    sudo apt update
    sudo apt install openjdk-8-jdk-headless jenkins ## installing Java as well
    sudo netstat -tapen | grep java
    ```

2. Open up port 8080 in the related security group
3. Access Jenkins from your browser and finish installation

    1. Read the initial admin password from RStudio/Terminal via

        ```sh
        sudo cat /var/lib/jenkins/secrets/initialAdminPassword
        ```

    2. Proceed with installing the suggested plugins
    3. Create your first user (eg `kre`)

4. Optionally update the security backend to use real Unix users for shared access (if users already created):

    ```sh
    sudo adduser jenkins shadow
    sudo systemctl restart jenkins
    ```

5. Test new user access in an incognito window to avoid closing yourself out :)

#### Schedule R commands

Let's schedule a Jenkins job to check on the Bitcoin prices every hour!

1. Log in to Jenkins using your instance's public IP address and port 8080
2. Use the `kre` username and the secret password
3. Create a "New Item" (job):

    1. Enter the name of the job: `get current Bitcoin price`
    2. Pick "Freestyle project"
    3. Click "OK"
    4. Add a new "Execute shell" build step
    5. Enter the below command to look up the most recent BTC price

        ```sh
        R -e "library(binancer);binance_coins_prices()[symbol == 'BTC', usd]"
        ```

    6. Run the job

    ![](https://raw.githubusercontent.com/daroczig/CEU-R-prod/2019-2020/images/jenkins-errors.png)

4. Debug & figure out what's the problem ...
5. Install R packages system wide from RStudio/Terminal (more on this later):

    ```sh
    sudo Rscript -e "library(devtools);with_libpaths(new = '/usr/local/lib/R/site-library', install_github('daroczig/binancer', upgrade_dependencies = FALSE))"
    ```

6. Rerun the job

    ![](https://raw.githubusercontent.com/daroczig/CEU-R-prod/2018-2019/images/jenkins-success.png)

#### Schedule R scripts

1. Create an R script with the below content and save on the server, eg as `/home/kre/bitcoin-price.R`:

    ```r
    library(binancer)
    prices <- binance_coins_prices()
    sprintf('The current Bitcoin price is: %s', prices[symbol == 'BTC', usd])
    ```

2. Follow the steps from the [Schedule R commands](#schedule-r-commands) section to create a new Jenkins job, but instead of calling `R -e "..."` in shell step, reference the above R script using `Rscript` instead

```shell
Rscript /home/kre/de4.R
```

#### ScheduleR improvements

1. Learn about little R: https://github.com/eddelbuettel/littler
2. Set up e-mail notifications via eg mailjet.com

    1. Sign up, confirm your e-mail address and domain
    2. Take a note on the SMTP settings, eg

        * SMTP server: in-v3.mailjet.com
        * Port: 465
        * SSL: Yes
        * Username: ***
        * Password: ***

    3. Configure Jenkins:

        1. Set up the default FROM e-mail address: jenkins@...
        2. Search for "Extended E-mail Notification" and configure

           * SMTP Server
           * Click "Advanced"
           * Check "Use SMTP Authentication"
           * Enter Password from the above steps from SNS
           * Enter User Name from the above steps from SNS
           * Check "Use SSL"
           * SMTP port: 465

    5. Set up "Post-build Actions" in Jenkins: Editable Email Notification - read the manual and info popups, configure to get an e-mail on job failures and fixes
    6. Configure the job to send the whole e-mail body as the deault body template for all outgoing emails

    ```shell
    ${BUILD_LOG, maxLines=1000}
    ```

3. Look at other Jenkins plugins, eg the Slack Notifier: https://plugins.jenkins.io/slack

#### Intro to redis

We need a persistent storage for our Jenkins jobs ... let's give a try to a key-value database:

1. Install server

   ```
   sudo apt install redis-server
   netstat -tapen | grep LIST
   ```

2. Install client

    ```
    sudo Rscript -e "withr::with_libpaths(new = '/usr/local/lib/R/site-library', install.packages('rredis', repos='https://cran.rstudio.com/'))"
    ```

3. Interact from R

    ```r
    ## set up and initialize the connection to the local redis server
    library(rredis)
    redisConnect()

    ## set/get values
    redisSet('foo', 'bar')
    redisGet('foo')

    ## increment and decrease counters
    redisIncr('counter')
    redisIncr('counter')
    redisIncr('counter')
    redisGet('counter')
    redisDecr('counter')
    redisDecr('counter2')

    ## get multiple values at once
    redisMGet(c('counter', 'counter2'))

    ## list all keys
    redisKeys()
    ```

For more examples and ideas, see the [`rredis` package vignette](https://cran.r-project.org/web/packages/rredis/vignettes/rredis.pdf) or try the interactive, genaral (not R-specific) [redis tutorial](https://try.redis.io).

4. Exercises

    - Create a Jenkins job running every minute to cache the most recent Bitcoin and Ethereum prices in Redis
    - Write an R script in RStudio that can read the Bitcoin and Ethereum prices from the Redis cache

<details><summary>Example solution ...</summary>

```r
library(rredis)
redisConnect()

redisSet('price:BTC', binance_klines('BTCUSDT', interval = '1m', limit = 1)$close)
redisSet('price:ETH', binance_klines('ETHUSDT', interval = '1m', limit = 1)$close)

redisGet('price:BTC')
redisGet('price:ETH')

redisMGet(c('price:BTC', 'price:ETH'))
```
</details>

<details><summary>Example solution using a helper function doing some logging ...</summary>

```r
store <- function(symbol) {
  print(paste('Looking up and storing', symbol))
  redisSet(paste('price', symbol, sep = ':'),
           binance_klines(paste0(symbol, 'USDT'), interval = '1m', limit = 1)$close)
}

store('BTC')
store('ETH')

## list all keys with the "price" prefix and lookup the actual values
redisMGet(redisKeys('price:*'))
```
</details>

#### Amazon Machine Images

Stop the server, create an image, then you can start any number of similar virtual servers based on the snapshot.

### Week 4

#### Background: Example use-case and why to use R to do stream processing?

https://github.com/daroczig/CEU-R-prod/raw/2017-2018/AWR.Kinesis/AWR.Kinesis-talk.pdf (presented at the Big Data Day Los Angeles 2016, EARL 2016 London and useR! 2017 Brussels)

#### Setting up a demo stream

This section describes how to set up a Kinesis stream with 4 shards on the live Binance transactions read from its websocket -- running in a Docker container, then feeding the JSON lines to Kinesis via the Amazon Kinesis Agent.

1. Start a `t3.micro` instance running "Amazon Linux 2 AMI" (where it's easier to install the Kinesis Agent compared to using eg Ubuntu) with a known key. Make sure to **set a name** and enable termination protection (in the instance details)! Use SSH, Putty or eg the browser-based SSH connection.

2. Install Docker (note that we are not on Ubuntu today, but using Red Hat's `yum` package manager):

    ```
    sudo yum install docker
    sudo service docker start
    sudo service docker status
    ```

3. Let's use a small Python app relying on the Binance API to fetch live transactions and store in a local file:

    * sources: https://github.com/daroczig/ceu-de3-docker-binance-streamer
    * docker: https://cloud.docker.com/repository/registry-1.docker.io/daroczig/ceu-de3-docker-binance-streamer

    Usage:

    ```
    screen -RRd streamer
    sudo docker run -ti --rm  daroczig/ceu-de3-docker-binance-streamer > /tmp/transactions.json
    ## "C-a c" to create a new screen, then you can switch with C-a "
    ls -latr /tmp
    tail -f /tmp/transactions.json
    ```

4. Install the Kinesis Agent:

    As per https://docs.aws.amazon.com/firehose/latest/dev/writing-with-agents.html#download-install:

    ```
    sudo yum install -y aws-kinesis-agent
    ```

5. Create a new Kinesis Stream (called `crypto`) at https://eu-west-1.console.aws.amazon.com/kinesis

6. Configure the Kinesis Agent:

    ```
    sudo yum install mc
    sudo mcedit /etc/aws-kinesis/agent.json
    ```

    Running the above commands, edit the config file to update the Kinesis endpoint, the name of the stream on the local file path:

    ```
    {
      "cloudwatch.emitMetrics": true,
      "kinesis.endpoint": "https://kinesis.eu-west-1.amazonaws.com",
      "firehose.endpoint": "",

      "flows": [
        {
          "filePattern": "/tmp/transactions.json",
          "kinesisStream": "crypto",
          "partitionKeyOption": "RANDOM"
        }
      ]
    }
    ```

7. Restart the Agent:

    ```
    sudo service aws-kinesis-agent start
    ```

8. Check the status and logs:

    ```
    sudo service aws-kinesis-agent status
    sudo journalctl -xe
    ls -latr /var/log/aws-kinesis-agent/aws-kinesis-agent.log
    tail -f /var/log/aws-kinesis-agent/aws-kinesis-agent.log
    ```

9. Make sure that the IAM role (eg `kinesis-admin`) can write to Kinesis and Cloudwatch, eg by attaching the `AmazonKinesisFullAccess` policy, then restart the agent

    ```
    sudo service aws-kinesis-agent restart
    ```

10. Check the AWS console's monitor if all looks good there as well
11. Note for the need of permissions to `cloudwatch:PutMetricData` (see example `cloudwatch-putmetrics` policy).

#### A simple stream consumer app in R

Let's install the `botor` package so that we can rely on the power of `boto3` to interact with the Kinesis stream:

```shell
sudo apt install python3-pip
sudo pip3 install boto3
sudo apt install r-cran-reticulate
sudo Rscript -e "library(devtools);withr::with_libpaths(new = '/usr/local/lib/R/site-library', install_github('daroczig/botor', upgrade = FALSE))"
```

The IAM role attached to the node already has the `AmazonKinesisFullAccess` policy attached, so we have permissions to read from the stream.

First we need to create a shard iterator, then using that, we can read the actual records from the shard:

```r
library(botor)
botor(region = 'eu-west-1')
shard_iterator <- kinesis_get_shard_iterator('crypto', '0')
records <- kinesis_get_records(shard_iterator$ShardIterator)
str(records)
```

Let's parse these records:

```r
records$Records[[1]]
records$Records[[1]]$Data

library(jsonlite)
fromJSON(as.character(records$Records[[1]]$Data))
```

#### Parsing and structuring records read from the stream

Exercises:

* parse the loaded 25 records into a `data.table` object with proper column types. Get some help on the data format from the [Binance API docs](https://github.com/binance/binance-spot-api-docs/blob/master/web-socket-streams.md#trade-streams)!
* count the overall number of coins exchanged
* count the overall value of transactions in USD (hint: `binance_ticker_all_prices()` and `binance_coins_prices()`)
* visualize the distribution of symbol pairs

<details><summary>A potential solution that you should not look at before thinking ...</summary>

```shell
library(data.table)
dt <- rbindlist(lapply(records$Records, function(record) {
  fromJSON(as.character(record$Data))
}))

str(dt)
setnames(dt, 'a', 'seller_id')
setnames(dt, 'b', 'buyer_id')
setnames(dt, 'E', 'event_timestamp')
## Unix timestamp / Epoch (number of seconds since Jan 1, 1970): https://www.epochconverter.com
dt[, event_timestamp := as.POSIXct(event_timestamp / 1000, origin = '1970-01-01')]
setnames(dt, 'q', 'quantity')
setnames(dt, 'p', 'price')
setnames(dt, 's', 'symbol')
setnames(dt, 't', 'trade_id')
setnames(dt, 'T', 'trade_timestamp')
dt[, trade_timestamp := as.POSIXct(trade_timestamp / 1000, origin = '1970-01-01')]
str(dt)

for (id in grep('_id', names(dt), value = TRUE)) {
  dt[, (id) := as.character(get(id))]
}
str(dt)

for (v in c('quantity', 'price')) {
  dt[, (v) := as.numeric(get(v))]
}

library(binancer)
binance_coins_prices()

dt[, .N, by = symbol]
dt[symbol=='ETHUSDT']
dt[, from := substr(symbol, 1, 3)]
dt <- merge(dt, binance_coins_prices(), by.x = 'from', by.y = 'symbol', all.x = TRUE, all.y = FALSE)
dt[, value := as.numeric(quantity) * usd]
dt[, sum(value)]
```
</details>

#### Actual stream processing instead of analyzing batch data

Let's write an R function to increment counters on the number of transactions per symbols:

1. Get sample raw data as per above (you might need to get a new shard iterator if expired):

   ```r
   records <- kinesis_get_records(shard_iterator$ShardIterator)$Record
   ```

2. Function to parse and process it

    ```r
    txprocessor <- function(record) {
      symbol <- fromJSON(as.character(record$Data))$s
      log_info(paste('Found 1 transaction on', symbol))
      redisIncr(paste('symbol', symbol, sep = ':'))
    }
    ```

3. Iterate on all records

    ```r
    library(logger)
    library(rredis)
    redisConnect()
    for (record in records) {
      txprocessor(record)
    }
    ```

4. Check counters

    ```r
    symbols <- redisMGet(redisKeys('symbol:*'))
    symbols

    symbols <- data.frame(
      symbol = sub('^symbol:', '', names(symbols)),
      N = as.numeric(symbols))
    symbols
    ```

5. Visualize

    ```r
    library(ggplot2)
    ggplot(symbols, aes(symbol, N)) + geom_bar(stat = 'identity')
    ```

6. Rerun step (1) and (3) to do the data processing, then (4) and (5) for the updated data visualization.

7. 🤦‍♂️

8. Let's make use of the next shard iterator:

    ```r
    ## reset counters
    redisDelete(redisKeys('symbol:*'))

    ## get the first shard iterator
    shard_iterator <- kinesis_get_shard_iterator('crypt', '0')$ShardIterator

    while (TRUE) {

      response <- kinesis_get_records(shard_iterator)

      ## get the next iterator
      shard_iterator <- response$NextShardIterator

      ## extract records
      records <- response$Record
      for (record in records) {
        txprocessor(record)
      }

      ## summarize
      symbols <- redisMGet(redisKeys('symbol:*'))
      symbols <- data.frame(
        symbol = sub('^symbol:', '', names(symbols)),
        N = as.numeric(symbols))

      ## visualize
      print(ggplot(symbols, aes(symbol, N)) + geom_bar(stat = 'identity') + ggtitle(sum(symbols$N)))
    }
    ```

#### Stream processor daemon

0. So far, we used the `boto3` Python module from R via `botor` to interact with AWS, but this time we will integrate Java -- by calling the AWS Java SDK to interact with our Kinesis stream, then later on to run a Java daemon to manage our stream processing application.

    1. First, let's install Java and the `rJava` R package:

    ```shell
    sudo apt install r-cran-rjava
    ```

    2. Then the R package wrapping the AWS Java SDK and the Kinesis client, then update to the most recent dev version right away:

    ```shell
    sudo R -e 'install.packages("AWR", repos = "https://daroczig.gitlab.io/AWR")'
    sudo R -e "withr::with_libpaths(new = '/usr/local/lib/R/site-library', install.packages('AWR.Kinesis', repos='https://cran.rstudio.com/'))"
    sudo R -e "withr::with_libpaths(new = '/usr/local/lib/R/site-library', devtools::install_github('daroczig/AWR.Kinesis', upgrade = FALSE))"
    ```

    3. Note, after installing Java, you might need to run `sudo R CMD javareconf` and/or restart R or the RStudio Server via `sudo rstudio-server restart` :/

    ```shell
    Error : .onLoad failed in loadNamespace() for 'rJava', details:
      call: dyn.load(file, DLLpath = DLLpath, ...)
      error: unable to load shared object '/usr/lib/R/site-library/rJava/libs/rJava.so':
      libjvm.so: cannot open shared object file: No such file or directory
    ```

    4. And after all, a couple lines of R code to get some data from the stream via the Java SDK (just like we did above with the Python backend):

    ```r
    library(rJava)
    library(AWR.Kinesis)
    records <- kinesis_get_records('crypto', 'eu-west-1')
    str(records)
    records[1]

    library(jsonlite)
    fromJSON(records[1])
    ```

1. Create a new folder for the Kinesis consumer files: `streamer`

2. Create an `app.properties` file within that subfolder

```
executableName = ./app.R
regionName = eu-west-1
streamName = crypto
applicationName = my_demo_app_sadsadsa
AWSCredentialsProvider = DefaultAWSCredentialsProviderChain
```

3. Create the `app.R` file:

```r
#!/usr/bin/Rscript
library(logger)
log_appender(appender_file('app.log'))
library(AWR.Kinesis)
library(methods)
library(jsonlite)

kinesis_consumer(

    initialize = function() {
        log_info('Hello')
        library(rredis)
        redisConnect(nodelay = FALSE)
        log_info('Connected to Redis')
    },

    processRecords = function(records) {
        log_info(paste('Received', nrow(records), 'records from Kinesis'))
        for (record in records$data) {
            symbol <- fromJSON(record)$s
            log_info(paste('Found 1 transaction on', symbol))
            redisIncr(paste('symbol', symbol, sep = ':'))
        }
    },

    updater = list(
        list(1/6, function() {
            log_info('Checking overall counters')
            symbols <- redisMGet(redisKeys('symbol:*'))
            log_info(paste(sum(as.numeric(symbols)), 'records processed so far'))
    })),

    shutdown = function()
        log_info('Bye'),

    checkpointing = 1,
    logfile = 'app.log')
```

4. Allow writing checkpointing data to DynamoDB and CloudWatch in IAM

5. Convert the above R script into an executable using the Terminal:

```shell
cd streamer
chmod +x app.R
```

6. Run the app in the Terminal:

```
/usr/bin/java -cp /usr/local/lib/R/site-library/AWR/java/*:/usr/local/lib/R/site-library/AWR.Kinesis/java/*:./ \
    com.amazonaws.services.kinesis.multilang.MultiLangDaemon \
    ./app.properties
```

7. Check on `app.log`

#### Shiny app showing the progress

1. Reset counters

    ```r
    library(rredis)
    redisConnect()
    keys <- redisKeys('symbol*')
    redisDelete(keys)
    ```

2. Install the `treemap` package

    ```
    sudo apt install r-cran-httpuv r-cran-shiny r-cran-xtable r-cran-htmltools r-cran-igraph r-cran-lubridate r-cran-tidyr r-cran-quantmod r-cran-broom r-cran-zoo r-cran-htmlwidgets r-cran-tidyselect r-cran-rlist r-cran-rlang r-cran-xml
    sudo R -e "withr::with_libpaths(new = '/usr/local/lib/R/site-library', install.packages(c('treemap', 'highcharter'), repos='https://cran.rstudio.com/'))"
    ```

3. Run the below Shiny app

    ```r
    ## packages for plotting
    library(treemap)
    library(highcharter)

    ## connect to Redis
    library(rredis)
    redisConnect()

    library(shiny)
    library(data.table)
    ui     <- shinyUI(highchartOutput('treemap', height = '800px'))
    server <- shinyServer(function(input, output, session) {

        symbols <- reactive({

            ## auto-update every 2 seconds
            reactiveTimer(2000)()

            ## get frequencies
            symbols <- redisMGet(redisKeys('symbol:*'))
            symbols <- data.table(
                symbol = sub('^symbol:', '', names(symbols)),
                N = as.numeric(symbols))

            ## color top 3
            symbols[, color := 1]
            symbols[symbol %in% symbols[order(-N)][1:3, symbol], color := 2]

            ## return
            symbols

        })

        output$treemap <- renderHighchart({
            tm <- treemap(symbols(), index = c('symbol'),
                          vSize = 'N', vColor = 'color',
                          type = 'value', draw = FALSE)
            N <- sum(symbols()$N)
            hc_title(hctreemap(tm, animation = FALSE),
            text = sprintf('Transactions (N=%s)', N))
        })

    })
    shinyApp(ui = ui, server = server, options = list(port = 3838))
    ```

#### Further AWS resources

1. Uploading files to S3:

    ```r
    s3_upload_file
    s3_write
    ```

2. Listing and downloading files from S3:

    ```r
    s3_ls
    s3_download_file
    s3_read
    ```

3. Managing secrets:

    ```r
    ssm_get_parameter
    ```

#### Scraping data examples

This section intentionally left blank.

### Week 5

* We have 0.42 Bitcoin -- let's report on the value in USD [5.R](5.R#1)
* Let's report on the value in HUF [5.R](5.R#20)
* Let's report on the value in HUF for the past 30 days [5.R](5.R#89)
* Let's report on the value in HUF for the past 30 days (keeping in mind that USDHUF rate also changed) [5.R](5.R#123)
* Now We have 0.42 Bitcoin and 1.2 Ethereum, let's report on the value in HUF for the past 30 days (eg stacked barchart) [5.R](5.R#170)
* Instead of using 0.42 Bitcoin and 1.2 Ethereum, let's read the assets from a database [5.R](5.R#212)
* No static portfolio ... we have been trading in the past 30 days, so let's look at the transactions data [5.R](5.R#274)

### Week 6

#### Creating an R package

1. Click File / New Project / New folder and create a new R package (maybe call it `mr`, also create a git repo for it) -- that will fill in your newly created folder with a package skeleton delivering the `hello` function in the `hello.R` file.

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
    Package: kre
    Type: Package
    Title: Demo R package for the Mastering R class
    Version: 0.1.0
    Author: Gergely <***@***.***>
    Maintainer: Gergely <***@***.***>
    Description: Demo R package for the Mastering R class
    License: AGPL
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
12. Add a new function that gets the most exchange rate for USD/HUF:

    <details>
      <summary><code>converter.R</code></summary>

    ```r
    #' Look up the value of a US Dollar in Hungarian Forints
    #' @param retried number of times the function already failed
    #' @return number
    #' @export
    #' @importFrom jsonlite fromJSON
    #' @importFrom logger log_error log_info
    #' @importFrom checkmate assert_number
    get_usdhuf <- function(retried = 0) {
      tryCatch({
        ## httr
        usdhuf <- fromJSON('https://api.exchangerate.host/latest?base=USD&symbols=HUF')$rates$HUF
        assert_number(usdhuf, lower = 250, upper = 400)
      }, error = function(e) {
        ## str(e)
        log_error(e$message)
        Sys.sleep(1 + retried ^ 2)
        get_usdhuf(retried = retried + 1)
      })
      log_info('1 USD={usdhuf} HUF')
      usdhuf
    }
    ```

    </details>

13. Now you can run the original R script hitting the Binance and ExchangeRatesAPI by using these helper functions:

```r
library(binancer)
library(logger)
log_threshold(TRACE)
library(scales)
library(kre)

BITCOINS <- 0.42
log_info('Number of Bitcoins: {BITCOINS}')

usdhuf <- get_usdhuf()

btcusd <- binance_coins_prices()[symbol == 'BTC', usd]
log_info('1 BTC={dollar(btcusd)}')

log_info('My crypto fortune is {forint(BITCOINS * btcusd * usdhuf)}')
```

#### Decision-tree based Machine Learning methods

1. Basic decision trees: [6.R](6.R#L1)
2. Random forest and GBMs with H2O: [6.R](6.R#L42)

## Home Assignment

1. Create an open-source R package with the `forint` and `get_usdhuf` functions covered in the class and push to a public GitHub repo
2. Add `convert_usd_to_huf` function that calls `get_usdhuf` to compute and return the provided USD `amount` in HUF (as a number)
3. Write a function that reverses `huf`, eg call it `unhuf`, so it takes a string (eg `"-0.10 Ft"`) and transforms to a number (eg `-0.10` in this case). Make sure it works with the "big mark" as well (eg for `"100,000.42 Ft"`)
4. Read http://r-pkgs.had.co.nz/tests.html and write unit tests for `unhuf` to make sure it can parse `4 Ft`, `-2 Ft`, `0.00 Ft`, `-42 Ft`, `3,423.42 Ft`
5. Create a screenshot on the results of running the unit tests and share along with the GitHub repo URL in an email

Deadline: May 17, 2021 (midnight by CET)

## References

* Binance (cryptocurrency exchange) API: https://github.com/binance/binance-spot-api-docs/blob/master/rest-api.md (R implementation available at https://github.com/daroczig/binancer)
* Foreign exchange rates API, eg https://exchangerate.host
* "Writing R Extensions" docs: https://cran.r-project.org/doc/manuals/r-release/R-exts.html
* Hadley Wickham's "R packages" book: http://r-pkgs.had.co.nz
* Hadley Wickham's "Advanced R" book (1st edition): http://adv-r.had.co.nz/
* R package tests with GitHub Actions instead of Travis: https://github.com/r-lib/actions/tree/master/examples#quickstart-ci-workflow
* `pkgdown` package: https://pkgdown.r-lib.org/index.html

## Contact

File a [GitHub ticket](https://github.com/daroczig/KRE-stat-prog-3/issues).
