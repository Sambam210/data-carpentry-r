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
interviews_middle <- interviews[(n_rows+1)/2,]
interviews_head <- interviews[-c(7:n_rows),]

# factors

respondent_floor_type <- factor(c("earth", "cement", "cement", "earth"))
# check the levels of the factor
levels(respondent_floor_type)
# number of levels in a factor
nlevels(respondent_floor_type)

# look at the current order of the factors
respondent_floor_type # putting cement first because R orders according to alphabetical order
respondent_floor_type <- factor(respondent_floor_type, levels = c("earth", "cement")) # reordering the factors
respondent_floor_type # after re-ordering

# let's rename cement as brick
levels(respondent_floor_type)
levels(respondent_floor_type)[2] <- "bricks"
levels(respondent_floor_type)
respondent_floor_type

# converting factors

# converting factor into a character
as.character(respondent_floor_type)

# converting factors into numeric

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)                     # Wrong! And there is no warning...
as.numeric(as.character(year_fct))       # Works...(convert tocharacter first)
as.numeric(levels(year_fct))[year_fct]   # The recommended way.

# renaming factors

# pull out the affect conflicts column

affect_conflicts <- interviews$affect_conflicts
# convert to factor
affect_conflicts <- as.factor(affect_conflicts)
affect_conflicts
levels(affect_conflicts)

# let's plot the data
plot(affect_conflicts)

# let's replace the NAs with a value
# recall the column as a vector
affect_conflicts <- interviews$affect_conflicts
# replace the NAs with "undetermined"
affect_conflicts[is.na(affect_conflicts)] <- "undetermined"
# convert to factor
affect_conflicts <- as.factor(affect_conflicts)
# plot the data
plot(affect_conflicts)

# exercise
# rename the factor level more_once to once more

levels(affect_conflicts) # more_once is the 2nd factor
levels(affect_conflicts)[2] <- "more than once"
levels(affect_conflicts)

# reorder the factors from least to most frequency

affect_conflicts <- factor(affect_conflicts, levels = c("never", "once", "more than once", "frequently", "undetermined"))
levels(affect_conflicts)
plot(affect_conflicts)

# formatting dates

str(interviews)

library(lubridate)

dates <- interviews$interview_date
str(dates)

# extract the date info and store them as separate column in the dataset

interviews$day <- day(dates)
interviews$month <- month(dates)
interviews$year <- year(dates)
interviews

# dplyr and tidyr

## load the tidyverse
library(tidyverse)
library(lubridate)

interviews <- read_csv("data/SAFI_clean.csv", na = "NULL")

## inspect the data
interviews

## preview the data
View(interviews)

# selecting columns and filtering rows
select(interviews, village, no_membrs, years_liv)

# choosing rows based on a specific value
filter(interviews, village == "God")

# pipes
interviews_god <- interviews %>%
  filter(village == "God") %>%
  select(no_membrs, years_liv)

# exercise
interviews %>%
  filter(memb_assoc == "yes") %>%
  select(affect_conflicts, liv_count, no_meals)

# mutate
interviews %>%
  mutate(people_per_room = no_membrs / rooms)

# look at effect of being associated with an irrigation assoc. on rooms
# first need to remove records for which there are NAs for memb_assoc

interviews %>%
  filter(!is.na(memb_assoc)) %>%
  mutate(people_per_room = no_membrs/rooms)

# exercise
interviews %>%
  mutate(total_meals = no_membrs*no_meals) %>%
  filter(total_meals > 20) %>%
  select(village, total_meals)

# spllit, apply, combine, summarise

interviews %>%
  group_by(village) %>%
  summarise(mean_no_membrs = mean(no_membrs))

# can group by multiple categories
interviews %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs))

# exclude the NAs from memb_assoc
interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs))

# can summarise multiple things
interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs))

# can sort results
interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs)) %>%
  arrange(min_membrs)

# sort in descending order
interviews %>%
  filter(!is.na(memb_assoc)) %>%
  group_by(village, memb_assoc) %>%
  summarize(mean_no_membrs = mean(no_membrs),
            min_membrs = min(no_membrs)) %>%
  arrange(desc(min_membrs))

# counting

# count the number of rows for each village
interviews %>%
  count(village)

# can also sort the count
interviews %>%
  count(village, sort = TRUE)

# exercise
interviews %>%
  count(no_meals)

interviews %>%
  group_by(village) %>%
  summarise(mean_membrs = mean(no_membrs),
            min_membrs = min(no_membrs),
            max_membrs = max(no_membrs),
            num_obs = n())

interviews %>%
  mutate(month = month(interview_date),
         year = year(interview_date)) %>%
  group_by(year, month) %>%
  summarise(largest = max(no_membrs))

  











































