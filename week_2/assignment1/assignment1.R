#This is the code for assigment 1 for the Coursera R programming course
#######################################################################
#Getting dataset url
dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
#Downloading dataset
download.file(dataset_url, "specdata.zip")
#Unzipping dataset
unzip("specdata.zip", exdir = "specdata")
