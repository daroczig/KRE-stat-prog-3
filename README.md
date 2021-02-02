This is the R script repository of the "Statisztikai programozás III." course in the 2019/2020 Spring term, part of the [Szociológia MA, "Big Data elemézés" specializáció](https://btk.kre.hu/index.php/szociologia-ma) at [KRE](http://www.kre.hu/english).

## Table of Contents

* [Syllabus](https://github.com/daroczig/KRE-stat-prog-3#syllabus)
* [Technical Prerequisites](https://github.com/daroczig/KRE-stat-prog-3#technical-prerequisites)
* [Class Schedule](https://github.com/daroczig/KRE-stat-prog-3#class-schedule)
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

## Contact

File a [GitHub ticket](https://github.com/daroczig/KRE-stat-prog-3/issues).
