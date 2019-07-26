library(tidyverse)

interviews <- read_csv("data/SAFI_clean.csv", na = "NULL") # replace null with NA
# dataframe: each column has to be the same length and data type, columns can be different data types

View(interviews)

# inspecting the data
dim(interviews)
nrow(interviews)
ncol(interviews)
head(interviews)
tail(interviews)
names(interviews) # column names
str(interviews)
summary(interviews)

# subsetting dataframes

# first element of first column
interviews[1,1]
# 6th element of first row
interviews[1,6]
# first column of dataframe (as a vector)
interviews[,1]
# first column of dataframe (as a dataframe)
interviews[1]
# first 3 elements in 7th column
interviews[1:3,7]
# 3rd row of dataframe (as dataframe)
interviews[3,]
# whole dataframe except 1st column
interviews[,-1]
# minus rows
interviews[-c(7:131),]

# subsetting according to column names
interviews["village"] # as dataframe
interviews[,"village"] # as dataframe
interviews[["village"]] # as vector
interviews$village # as vector

# exercise
interviews_100 <- interviews[100,]
n_rows<-nrow(interviews)
n_rows
interviews_last <- interviews[n_rows, ]
interviews_middle <- interviews[n_rows/2,]
interviews_head <- interviews[-c(7:n_rows),]



