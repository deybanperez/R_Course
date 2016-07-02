######################################################################
#Finding the best hospital in a state
######################################################################
best <- function(state, outcome)
{
    ##Read outcome data
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",
                     header = TRUE, sep = ",")
    
    ##Check that state and outcome are valid
    
    if(sum(unique(outcome_data[,7]) == state) == 0)
      stop("invalid state")
    
    ##Return hospital name in that state with lowest 30-day death rate
    
    temp = split(outcome_data, outcome_data[,7] == state)$'TRUE'
    
    if(outcome == "heart attack")
      temp = data.frame(Hospital_Name = temp[,2], Rate = temp[, 13])
    
    else if(outcome == "heart failure")
      temp = data.frame(Hospital_Name = temp[,2], Rate = temp[, 19])
    
    else if(outcome == "pneumonia")
      temp = data.frame(Hospital_Name = temp[,2], Rate = temp[, 25])
    else
      stop("invalid outcome")
    
    temp$Rate = as.character(temp$Rate)
    temp$Rate = as.numeric(temp$Rate)
    temp = temp[!is.na(temp$Rate), ]
    temp = temp[order(temp$Rate, temp$Hospital_Name), ]
    return(as.character(temp$Hospital_Name[1]))
}