######################################################
#         Introduction to R: Section 2               #
######################################################

# A. read in a data file

myTBdata <- read.table("PreCourseMaterial/introR/TB_stats.txt", header = TRUE)

# What does the "header=TRUE" option mean?
# Answer: R reads in the first row as the column headers (or, names)

# Now let's investigate the data file

# B. Have a look at the first few lines

head(myTBdata)

# How many rows can you see? What is the first row?
# Answer: 1 row of column names and 6 rows of data

# C. What are the names of the columns?

names(myTBdata)

# Is this what you expected?
# Answer: We would expect there to be 6 elements to correspond to the 6 columns.
# Each column name is stored as a separate element in a vector

# D. How many rows and columns are there in your data ?

dim(myTBdata)

# What is the first number telling you? And the second?
# Answer: dim(...) gives you a 2 element vector;
# the first number is the number of rows, the second is the number of columns

# E. How are your data stored?

attributes(myTBdata)

# What have you learned from the 'attributes()' function?
# Answer: We now know that our data set is stored as a data.frame

# F. Now take a look at some summary statistics for your data

summary(myTBdata)

# Let's extract some information from our data


# G. First, Calculate the total number of deaths across all countries

# The following two methods should give you the same answer
# method 1
total_TB_mortality1 <- sum(myTBdata[, 2:3])
# method 2
total_TB_mortality2 <- sum(
  myTBdata$HIV_pos_TB_mortality + myTBdata$HIV_neg_TB_mortality
)

# Do you think one method is better than the other?
# Answer: While method 1 is certaintly shorter, method 2 is generally better for
# two reasons:
# 1) it is easier to read because the column names provide information
# 2) it is less liable to cause errors (if you for some reason change the
# indexing of your columns, method 1 might break)

# H. Now let's check that both methods give the same answer. We'll use two ways
# to check this
# First, let's output both answers

total_TB_mortality1
total_TB_mortality2

# Now, let's ask R to check whether they are both equal

# logical expression which gives TRUE if equal and FALSE if not
total_TB_mortality1 == total_TB_mortality2

# Why might you prefer to use the second check (using the logical expression)
# than the first?
# Answer: For checking two numbers are the same, it is easy to output two
# numbers and manually check. However, for larger datasets or for multiple
# checks, comparison will be much quicker if they are automated

# I. How different is the TB mortality rate in HIV positive persons in Lesotho
# compared to Zimbabwe? The following lines of code will help you answer...

# First, let's add "mortality rate" as another column in our data frame

myTBdata$Mortality_Per1000 <- 1000 * (
  myTBdata$HIV_pos_TB_mortality + myTBdata$HIV_neg_TB_mortality
) / myTBdata$Population


# Now subset the dataset to get the TB mortality rate for Lesotho and Zimbabwe

Lesotho_mortalityrate <- myTBdata[
  myTBdata$Country == "Lesotho", "Mortality_Per1000"
]
Zimbabwe_mortalityrate <- myTBdata[
  myTBdata$Country == "Zimbabwe", "Mortality_Per1000"
]
Relative_Mortality_Rate <- Lesotho_mortalityrate / Zimbabwe_mortalityrate

# How many times higher is the mortality rate for TB in Lesotho versus Zimbabwe?

paste("The relative mortality rate is", round(Relative_Mortality_Rate, 2))

# J. Finally in this section, let's look at what can go wrong when reading
# in data files.


# (a) There is not an equal number of columns in each of the rows
readFile_a <- read.table(
  "PreCourseMaterial/introR/readfileexample_1.txt", header = TRUE
)

# How do you fix this error?
# Hint: set missing values in the data file to be 'Not Assigned' by adding them
# as NA in the original file
# Try running this line again with the updated file

# (b) The wrong delimiter is used

readFile_b <- read.table(
  "PreCourseMaterial/introR/readfileexample_2.txt", header = TRUE
)

# Is an error given? Check out 'readFile_b' - is it correct?
# Answer: No error is given but if you type head(readFile_b), the file has not
# read properly. The file should be read in as a 5 x 3 data.frame. However,
# instead it is 5 x 1

# How do you fix this? Ask R for help (?read.table)
# Which option do you need to specify?
# Answer: We must specify the delimiter of the text file
readFile_b <- read.table(
  "PreCourseMaterial/introR/readfileexample_2.txt", sep = ",", header = TRUE
)

# Is there another way of fixing this problem?
# Answer: We could use the function 'read.csv(...)' which automatically uses the
readFile_b <- read.csv(
  "PreCourseMaterial/introR/readfileexample_2.txt", header = TRUE
)

# (c) The names are read in as data rows rather than names
readFile_c <- read.csv(
  "PreCourseMaterial/introR/readfileexample_2.txt", header = FALSE
)

# Is an error given? Check out 'readFile_c' - is it correct?
# Answer: No, R has read in the first row of the file as regular data points

# Type a new line of code to correct this problem (hint: copy-paste from above
# and change one of the options)
readFile_c <- read.csv(
  "PreCourseMaterial/introR/readfileexample_2.txt", header = TRUE
)

# (d) One of more of the columns contain different classes

readFile_d <- read.table(
  "PreCourseMaterial/introR/readfileexample_3.txt", header = TRUE
)

# Is an error given? Check out 'readFile_d' - is it correct?
# Answer: It appears to look OK. However one of the values has mistakenly been
# inputted as 'ten' rather than '10'. This means that the column has been saved
# as non-numeric.

# How do you fix this issue?
# Hint: check the 'class' of the problem column
# Try running this line again with an updated file

# CHANGE THE 5th row, 2nd column to 10 in the file and re-run the code
