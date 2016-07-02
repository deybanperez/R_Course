rankhospital <- function(state, outcome, num = "best")
{
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",
                           header = TRUE, sep = ",")
  ## Check that state and outcome are valid
  if(sum(unique(outcome_data[,7]) == state) == 0)
    stop("invalid state")
  
  ## Return hospital name in that state with the given rank
  temp = split(outcome_data, outcome_data[,7] == state)$'TRUE'
  
  if(outcome == "heart attack")
    temp = data.frame(Hospital_Name = temp[,2], Rate = temp[, 11])
  
  else if(outcome == "heart failure")
    temp = data.frame(Hospital_Name = temp[,2], Rate = temp[, 17])
  
  else if(outcome == "pneumonia")
    temp = data.frame(Hospital_Name = temp[,2], Rate = temp[, 23])
  else
    stop("invalid outcome")
  
  temp$Rate = as.character(temp$Rate)
  temp$Rate = as.numeric(temp$Rate)
  temp = temp[!is.na(temp$Rate), ]
  temp = temp[order(temp$Rate, temp$Hospital_Name), ]
  
  if(num == "best")
    return(as.character(temp$Hospital_Name[1]))
  else if(num == "worst")
    return(as.character(temp$Hospital_Name[nrow(temp)]))
  else
  {
    if(num > nrow(temp))
      return(NA)
    
    return(as.character(temp$Hospital_Name[num]))
  }
  ## 30-day death rate
}