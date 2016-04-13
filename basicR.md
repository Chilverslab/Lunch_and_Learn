# Introduction to R Purpose: an introduction to the R language

Author: Zachary Noel 

First thing to know is some basic R script writing
techniques 1. a 'hash' or 'pound-sign' # starts a comment
and will not be executed 2. On a mac, the sequence of key
strokes command '-> enter' will run a line of code
(compile) on a windows control '-> r' will do the same
thing 3. R is case sensitive. X does not equal x

Start the script. At the top of scripts I would usually
write a small description of the purpose of the script and
a title.


```r
# Title: Introduction to R Purpose: an introduction to the R language
# Author: Zachary Noel 
```
by the end of this I hope you will be able to
1. use basic mathamatical operators in R
2. know some data objects and how to index them
3. install packages
4. load your data into R from a .csv or .txt file

R is just a big calculator!! using the basic mathematical

```r
# operators + - * /
2 + 2  # returns 4
```

```
## [1] 4
```

```r
2 - 2  # returns 0
```

```
## [1] 0
```

```r
2/2  # returns 1
```

```
## [1] 1
```

```r
2 * 2  # returns 4
```

```
## [1] 4
```

Setting a single number (scalar) to an object (scalar
object) we do this with the '<-' or '=' symbols

```r
x <- 2  # highlighting the x and compile 
y = 3  # the prefered syntax is to use the '<-'. the '=' is to be used within a function 
```


```r
# R is a big calculator!!!
x + y  # returns 5
```

```
## [1] 5
```

```r
x - y  # returns -1
```

```
## [1] -1
```

```r
x/y  # returns 0.6666
```

```
## [1] 0.6666667
```

```r
x * y  # returns 6
```

```
## [1] 6
```

We can also save a scalar character object, we do this by
setting an object equal to somthing in quotes


```r
name <- "Zach"
seven <- "7"

# will not work, R is a smart calculator
seven + x
class(seven)
class(x)
```

Introducing a function and making a vector object R syntax
works to call a function by typing something followed by
opening () for example, we will use the c() function i.e.
'concatenate function' to create a vector, or a bunch of
scalar elements saved together in one object

```r
vec <- c(1, 2, 3, 4, 5, 6, 7)  # numeric vector 
vec <- c(1:7)  # same numeric vector as above, the ':' (colon) generates a sequence
vec <- 1:7  # also works without the concatenate function
vec2 <- c("Zach", "Jie", "Mitch")  # character vector 
vec3 <- c(TRUE, FALSE, TRUE)  # logical vector
```

We can index a vector by using brackets []

```r
vec2[2]  # returns the second element of vec2
```

```
## [1] "Jie"
```

```r
# R is a big calculator!!
vec + x  # will add the scalar x, elementwise to the vec object 
```

```
## [1] 3 4 5 6 7 8 9
```

We can also use some basic functions to calculate some
basic summary stats

```r
mean(vec)  # mean
```

```
## [1] 4
```

```r
sd(vec)  # standard deviation
```

```
## [1] 2.160247
```

```r
sum(vec)  # sum
```

```
## [1] 28
```

```r
median(vec)  # median
```

```
## [1] 4
```

```r
min(vec)  # minimum 
```

```
## [1] 1
```

```r
max(vec)  # maximum
```

```
## [1] 7
```

```r
summary(vec)  #IQR - output depends on the data class
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##     1.0     2.5     4.0     4.0     5.5     7.0
```

__Quick thing on logical operators >, <, |, &, =, ==, >=, !=__

```r
t <- 1:10  # numeric vector
t[(t > 8) | (t < 5)]  # only the numbers that are greater than 8 or less than 5
```

```
## [1]  1  2  3  4  9 10
```

```r
t[(t > 8) & (t < 10)]  # returns 9
```

```
## [1] 9
```

```r
t[t != 2]  # returns elements of t that are not exactly equal to 2
```

```
## [1]  1  3  4  5  6  7  8  9 10
```

```r
t[!t == 2] # multiple ways to do the same thing
```

```
## [1]  1  3  4  5  6  7  8  9 10
```
# Data types

We will now explore more advanced data objects, we have
already seen scalar and vector we will explore matricies,
dataframes, and lists.

A matrix is an atomic object, meaning it can only contain
one data class, i.e.  numeric, character, or logical.

We can create a matrix by using the matrix function.  if
you do not know how to use a function you can navagate to
the help section or use the question mark followed by the
function name.  Example:
```
?matrix
```
## Matrix

```r
mat1 <- matrix(data = c(1, 2, 3), nrow = 3, ncol = 3)
t(mat1)
```

```
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    1    2    3
## [3,]    1    2    3
```

```r
mat2 <- as.matrix(vec2)  # change a vector to a matrix
dim(mat2)
```

```
## [1] 3 1
```

```r
mat3 <- as.matrix(vec3)
```

Indexing a matrix, we do the with brackets

```r
mat1[1]  # returns the first element of the matrix i.e. row 1 column 1
```

```
## [1] 1
```

```r
mat1[2]  # returns the second element of the matrix i.e. row 2 column 1 
```

```
## [1] 2
```

```r
mat1[5]  # returns the 5th element of the matrix i.e. row 2 column 2
```

```
## [1] 2
```

The syntax of R allows you to take a shortcut by specifying
[rows,columns]

```r
mat1[1, 3]  # returns the element in row 1 column 3
```

```
## [1] 1
```

If we leave the row or column space blank we will select
the whole column or row

```r
mat1[1, ]  # returns the first row 
```

```
## [1] 1 1 1
```

## Dataframes 
data frames are like matricies but they can
contain multiple types of data we can create a dataframe
using the data.frame() function


```r
df <- data.frame(mat1, mat2, mat3)
class(df)
```

```
## [1] "data.frame"
```

```r
class(mat2)
```

```
## [1] "matrix"
```

```r
as.matrix(df) # will not give back a numeric object
```

```
##      X1  X2  X3  mat2    mat3   
## [1,] "1" "1" "1" "Zach"  " TRUE"
## [2,] "2" "2" "2" "Jie"   "FALSE"
## [3,] "3" "3" "3" "Mitch" " TRUE"
```

Use the str() function to see the 'structure' of your
dataframe

```r
str(df)
```

```
## 'data.frame':	3 obs. of  5 variables:
##  $ X1  : num  1 2 3
##  $ X2  : num  1 2 3
##  $ X3  : num  1 2 3
##  $ mat2: Factor w/ 3 levels "Jie","Mitch",..: 3 1 2
##  $ mat3: logi  TRUE FALSE TRUE
```

We can change the column names using the colnames()
function

```r
colnames(df) <- c("var1", "var2", "var3", "names", "log")
```

Indexing with data frames work the same as with matricies

```r
df[1, ]  # returns the first row of the dataframe 
```

```
##   var1 var2 var3 names  log
## 1    1    1    1  Zach TRUE
```

```r
df[, "var1"]  # returns the first column
```

```
## [1] 1 2 3
```

```r
# however an easier way to index is with the dollar-sign '$'
df$names  # returns the elements in the column named 'names'
```

```
## [1] Zach  Jie   Mitch
## Levels: Jie Mitch Zach
```

Since names is a character vector within the data frame it
will also return a levels statement this just indicates the
groups of your data.  this is important later when we
investigate ANOVAS and linear models

__More complex indexing__

```r
df$var1[df$names == "Jie"]  # returns 2, i.e. the element of var1 such that names = Jie 
```

```
## [1] 2
```

```r
df[df$names == "Jie",]
```

```
##   var1 var2 var3 names   log
## 2    2    2    2   Jie FALSE
```

We can add a column of data to our dataframe by simply
specifying a new variable name

```r
df$var1.var2 <- df$var1 + df$var2
```

## Lists

Lists are multiple data types in one object.  They are
really nice to use when writing your own functions and
generating multiple tables of output

```r
list1 <- list(df, vec3, mat1)  # putting a dataframe, vector, and matrix in one object

# indexing a list
list1[1]  # returns the first object in the list
```

```
## [[1]]
##   var1 var2 var3 names   log var1.var2
## 1    1    1    1  Zach  TRUE         2
## 2    2    2    2   Jie FALSE         4
## 3    3    3    3 Mitch  TRUE         6
```

```r
# making the elements of a list easier to index
names(list1) <- c("dataframe", "log.vec", "matrix")

# now we can index the list with the '$'
list1$dataframe
```

```
##   var1 var2 var3 names   log var1.var2
## 1    1    1    1  Zach  TRUE         2
## 2    2    2    2   Jie FALSE         4
## 3    3    3    3 Mitch  TRUE         6
```

We can do more in-depth indexing just like indexing a
dataframe

```r
list1$dataframe[list1$dataframe$names == "Jie" | list1$dataframe$names == 
    "Mitch", ]
```

```
##   var1 var2 var3 names   log var1.var2
## 2    2    2    2   Jie FALSE         4
## 3    3    3    3 Mitch  TRUE         6
```

```r
# this will return the row of the dataframe object, in our
# list, such that names = Jie or Mitch
list1$dataframe[list1$dataframe$names == "Jie" & list1$dataframe$log == 
    FALSE, ]
```

```
##   var1 var2 var3 names   log var1.var2
## 2    2    2    2   Jie FALSE         4
```

```r
# this will return the row of the dataframe object, in our
# list, such that names = Jie & log = FALSE
```

# INSTALLING PACKAGES

since R is an open source languange, anybody can contribute
and add/edit a package packages are just extra code that is
loded into R to do calculations that do not come with the
basic R functions

we can install packages two ways I will not cover
installing from github right now:

1. install.packages function

```r
install.packages("plotrix")  # use quotes around the package name
```

2. navigate to the packages tab and search

when we want to use a package we first have to use the

```r
#library function first
library(plotrix)
plotrix::std.error(mat1[,1]) # loading/using one function within the called package
std.error(mat1[, 1])
```

# Read in a file with data

typically we will use .txt files or .csv files to load into
R I prefer .csv files because they are just like excel
files and you can manipulate them in excel .txt files may
be better for different applications or data types

we can read in a .csv file with the read.csv file and
specifying the path to the file.

```r
csv <- read.csv("01_BasicR/corr.csv")
```



```r
csv2 <- read.csv("corr.csv")  # this will do the same thing only if the file exists 
# in the project folder you created. i.e. the working
# directory
```

Writing a csv file from R

```r
write.csv(csv, "newcsv.csv") # create a new csv file
```

.txt files can be a little different to load into R. I
saved this .txt file from a .csv file so we have to specify
that we want the header (column headings) included and that
the character that separates our numbers is a comma.

```r
table <- read.table("01_BasicR/corr.txt", header = TRUE, sep = ",")

#Checking if files are equal
all.equal(csv, table)
```

```
## [1] "Names: 7 string mismatches"                                   
## [2] "Length mismatch: comparison on first 7 components"            
## [3] "Component 2: Attributes: < target is NULL, current is list >" 
## [4] "Component 2: target is numeric, current is factor"            
## [5] "Component 3: 'current' is not a factor"                       
## [6] "Component 4: 'is.NA' value mismatch: 2 in current 0 in target"
## [7] "Component 5: Mean relative difference: 2.812771"              
## [8] "Component 6: Mean relative difference: 2.048028"              
## [9] "Component 7: 'is.NA' value mismatch: 0 in current 2 in target"
```
