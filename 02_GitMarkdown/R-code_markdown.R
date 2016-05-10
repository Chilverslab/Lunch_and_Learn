## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
library(ggplot2)
library(markdown)
setwd("~/Google Drive/MSU/Chilvers Lab/Lunch_and_Learn/02_GitMarkdown/")

## ----kable_example-------------------------------------------------------
kable(head(ggplot2::mpg, n = 15), digits = 3, format = "markdown")

## ----cars----------------------------------------------------------------
summary(cars)

## ----example, fig.align='center'-----------------------------------------
#{r chunk_name, ...}

#Global parameters
#```{r setup, include=FALSE}
#knitr::opts_chunk$set(echo = TRUE)
#```


## ----pressure, echo=FALSE------------------------------------------------
plot(pressure)

## ------------------------------------------------------------------------
g <- ggplot(mpg, aes(class))
# Number of cars in each class:
g + geom_bar()

## ------------------------------------------------------------------------
p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot()

## ----other_tricks, eval=FALSE--------------------------------------------
## # Extract r code
## knit("markdown_tutorial.Rmd", "R-code_markdown.R", tangle = TRUE)

