library("tidyverse")

print("Hello, world")

area_hectares <- 1.0

area_acres <- 2.47 * area_hectares

length <- c(1,2,3)
width <- c(4,5,6)
area <- length * width

# functions

# b <- sqrt(a)

round(3.14159)
# change the number of decimal places
round(3.14159, digits = 2)

# vectors
# all same data type

no_members <- c(3,7,10,16)
length(no_members)
class(no_members)
str(no_members)

respondent_wall_type <- c("muddaub", "burntbricks", "sunbricks")
respondent_wall_type
class(respondent_wall_type)
str(respondent_wall_type)

possessions <- c("bicycle", "radio", "television")
possessions <- c(possessions, "mobile_phone") # add to the end of the vector
possessions <- c("car", possessions) # add to the beginning of the vector
possessions

typeof(possessions) # type of vector

# subsetting

# []

# second element in this vector
respondent_wall_type[2]
# elements 2 and 3
respondent_wall_type[c(2,3)]
# can repeat elements
more_respondent_wall_type <- respondent_wall_type[c(1, 2, 3, 2, 1, 3)]
more_respondent_wall_type

no_members <- c(3, 7, 10, 6)
no_members[c(TRUE, FALSE, TRUE, TRUE)] # anything that is false will be left out

no_members[no_members > 5]

no_members[no_members < 3 | no_members > 5]

no_members[no_members >= 7 & no_members == 3]

possessions <- c("car", "bicycle", "radio", "television", "mobile_phone")
possessions[possessions == "car" | possessions == "bicycle"] # returns both car and bicycle

# are the elements of possessions in this vector
# returns true and false

possessions %in% c("car", "bicycle", "motorcycle", "truck", "boat")

# can use to subset

possessions[possessions %in% c("car", "bicycle", "motorcycle", "truck", "boat")]









