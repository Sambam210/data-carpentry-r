library(tidyverse)

interviews <- read_csv("data/SAFI_clean.csv", na = "NULL") # replace null with NA

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






