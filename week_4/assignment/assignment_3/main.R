#This is the code for assigment 3 for the Coursera R programming course
#######################################################################
#Getting dataset url
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"
#Downloading dataset
download.file(dataset_url, "assignment_3.zip")
#Unzipping dataset
unzip("assignment_3.zip", exdir = "assignment_3")
#######################################################################
# Plot the 30-day mortality rates for heart attack
######################################################################
source("best.R")
source("rankall.R")
source("rankhospital.R")
