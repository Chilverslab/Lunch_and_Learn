# First thing to know is some basic R script writing
# techniques 1. a 'hash' or 'pound-sign' # starts a comment
# and will not be executed 2. On a mac, the sequence of key
# strokes command '-> enter' will run a line of code
# (compile) on a windows control '-> r' will do the same
# thing 3. R is case sensitive. X does not equal x

# Start the script. At the top of scripts I would usually
# write a small description of the purpose of the script and
# a title. For example:

# Author: Zachary Noel 
# Title: Introduction to R Purpose: an introduction to the R language

# by the end of this I hope you will be able to 
# 1. use basic mathamatical operators in R 
# 2. know some data objects and how to index them 
# 3. install packages 
# 4. load your data into R from a .csv or .txt file

# R is just a big calculator!! using the basic mathamatical
# operators + - * /
2 + 2  # returns 4
2 - 2  # returns 0
2/2  # returns 1
2 * 2  # returns 4

# setting a single number (scalar) to an object (scalar
# object) we do this with the '<-' or '=' symbols
x <- 2  # highlighting the x and compile 
y = 3  # the prefered syntax is to use the '<-'. the '=' is to be used within a function 

# R is a big calculator!!!
x + y  # returns 5
x - y  # returns -1
x/y  # returns 0.6666
x * y  # returns 6

# we can also save a scalar character object, we do this by
# setting an object equal to somthing in quotes
name <- "Zach"
seven <- "7"

# will not work, R is a smart calculator
seven + x
class(seven)
class(x)

# Introducing a function and making a vector object R syntax
# works to call a function by typing something followed by
# opening () for example, we will use the c() function i.e.
# 'concatenate function' to create a vector, or a bunch of
# scalar elements saved together in one object
vec <- c(1, 2, 3, 4, 5, 6, 7)  # numeric vector 
vec <- c(1:7)  # same numeric vector as above, the ':' (colon) generates a sequence
vec <- 1:7  # also works without the concatenate function
vec2 <- c("Zach", "Jie", "Mitch")  # character vector 
vec3 <- c(TRUE, FALSE, TRUE)  # logical vector

# we can index a vector by using brackets []
vec2[2]  # returns the second element of vec2

# R is a big calculator!!
vec + x  # will add the scalar x, elementwise to the vec object 

# we can also use some basic functions to calculate some
# basic summary stats
mean(vec)  # mean
sd(vec)  # standard deviation
sum(vec)  # sum
median(vec)  # median
min(vec)  # minimum 
max(vec)  # maximum
summary(vec)  #IQR - output depends on the data class

# Quick thing on logical operators >, <, |, &, =, ==, >=, !=
t <- 1:10  # numeric vector
t[(t > 8) | (t < 5)]  # only the numbers that are greater than 8 or less than 5
t[(t > 8) & (t < 10)]  # returns 9
t[t != 2]  # returns elements of t that are not exactly equal to 2
t[!t == 2] # multiple ways to do the same thing

# Data types

# we will now explore more advanced data objects, we have
# already seen scalar and vector we will explore matricies,
# dataframes, and lists

# a matrix is an atomic object, meaning it can only contain
# one data class, i.e.  numeric, character, or logical

# we can create a matrix by using the matrix function.  if
# you do not know how to use a function you can navagate to
# the help section or use the question mark followed by the
# function name.  Example:
?matrix

mat1 <- matrix(data = c(1, 2, 3), nrow = 3, ncol = 3)
t(mat1)
mat2 <- as.matrix(vec2)  # change a vector to a matrix
dim(mat2)
mat3 <- as.matrix(vec3)

# indexing a matrix, we do the with brackets
mat1[1]  # returns the first element of the matrix i.e. row 1 column 1
mat1[2]  # returns the second element of the matrix i.e. row 2 column 1 
mat1[5]  # returns the 5th element of the matrix i.e. row 2 column 2

# the syntax of R allows you to take a shortcut by specifying
# [rows,columns]
mat1[1, 3]  # returns the element in row 1 column 3

# if we leave the row or column space blank we will select
# the whole column or row
mat1[1, ]  # returns the first row 

# DATAFRAMES data frames are like matricies but they can
# contain multiple types of data we can create a dataframe
# using the data.frame() function

df <- data.frame(mat1, mat2, mat3)
class(df)
class(mat2)

as.matrix(df) # will not give back a numeric object

# use the str() function to see the 'structure' of your
# dataframe
str(df)

# we can change the column names using the colnames()
# function
colnames(df) <- c("var1", "var2", "var3", "names", "log")

# indexing with data frames work the same as with matricies
df[1, ]  # returns the first row of the dataframe 
df[, "var1"]  # returns the first column

# however an easier way to index is with the dollar-sign '$'
df$names  # returns the elements in the column named 'names'

# since names is a character vector within the data frame it
# will also return a levels statement this just indicates the
# groups of your data.  this is important later when we
# investigate ANOVAS and linear models

# more complex indexing
df$var1[df$names == "Jie"]  # returns 2, i.e. the element of var1 such that names = Jie 
df[df$names == "Jie",]

# we can add a column of data to our dataframe by simply
# specifying a new variable name
df$var1.var2 <- df$var1 + df$var2

# LISTS

# lists are multiple data types in one object.  They are
# really nice to use when writing your own functions and
# generating multiple tables of output
list1 <- list(df, vec3, mat1)  # putting a dataframe, vector, and matrix in one object

# indexing a list
list1[1]  # returns the first object in the list

# making the elements of a list easier to index
names(list1) <- c("dataframe", "log.vec", "matrix")

# now we can index the list with the '$'
list1$dataframe

# and we can do more in-depth indexing just like indexing a
# dataframe
list1$dataframe[list1$dataframe$names == "Jie" | list1$dataframe$names == 
    "Mitch", ]
# this will return the row of the dataframe object, in our
# list, such that names = Jie or Mitch
list1$dataframe[list1$dataframe$names == "Jie" & list1$dataframe$log == 
    FALSE, ]
# this will return the row of the dataframe object, in our
# list, such that names = Jie & log = FALSE


# INSTALLING PACKAGES

# since R is an open source languange, anybody can contribute
# and add/edit a package packages are just extra code that is
# loded into R to do calculations that do not come with the
# basic R functions

# we can install packages two ways I will not cover
# installing from github right now 1. install.packages
# function
install.packages("plotrix")  # use quotes around the package name

# 2. navigate to the packages tab and search

# when we want to use a package we first have to use the
# library function first
library(plotrix)
plotrix::std.error(mat1[,1]) # loading/using one function within the called package
std.error(mat1[, 1])

# Read in a file with data

# typically we will use .txt files or .csv files to load into
# R I prefer .csv files because they are just like excel
# files and you can manipulate them in excel .txt files may
# be better for different applications or data types

# we can read in a .csv file with the read.csv file and
# specifying the path to the file.
csv <- read.csv("/Users/zacharynoel/Desktop/R_intro/corr.csv")
csv2 <- read.csv("corr.csv")  # this will do the same thing only if the file exists 
# in the project folder you created. i.e. the working
# directory
write.csv(csv2, "newcsv.csv") # create a new csv file

# .txt files can be a little different to load into R. I
# saved this .txt file from a .csv file so we have to specify
# that we want the header (column headings) included and that
# the character that separates our numbers is a comma.
table <- read.table("corr.txt", header = TRUE, sep = ",")

all.equal(csv, table)