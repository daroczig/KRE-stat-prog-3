This is the R script repository of the "Statisztikai programozás III." course in the 2020/2019 Spring term, part of the [Szociológia MA, "Big Data elemézés" specializáció](https://btk.kre.hu/index.php/szociologia-ma) at [KRE](http://www.kre.hu/english).

## Table of Contents

* [Syllabus](https://github.com/daroczig/KRE-stat-prog-3#syllabus)
* [Technical Prerequisites](https://github.com/daroczig/KRE-stat-prog-3#technical-prerequisites)
* [Class Schedule](https://github.com/daroczig/KRE-stat-prog-3#class-schedule)

    * [Week 1](https://github.com/daroczig/KRE-stat-prog-3#week-1)
    * [Week 2](https://github.com/daroczig/KRE-stat-prog-3#week-2)

* [Contact](https://github.com/daroczig/KRE-stat-prog-3#contacts)

## Schedule

5 x 3 x 90 mins on February 15, March 1, March 22, April 12, April 26 and May 10:

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

## Contact

File a [GitHub ticket](https://github.com/daroczig/KRE-stat-prog-3/issues).
