rankall <- function(outcome, num = "best")
{
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character",
                          header = TRUE, sep = ",")
  ## Check that state and outcome are valid
  
  temp = outcome_data
  
  if(outcome == "heart attack")
    temp = data.frame(hospital = temp[,2], state = temp[, 7], rate = temp[, 11])
  
  else if(outcome == "heart failure")
    temp = data.frame(hospital = temp[,2], state = temp[, 7], rate = temp[, 17])
  
  else if(outcome == "pneumonia")
    temp = data.frame(hospital = temp[,2], state = temp[, 7], rate = temp[, 23])
  else
    stop("invalid outcome")
  
  temp$rate = as.character(temp$rate)
  temp$rate = as.numeric(temp$rate)
  temp = temp[!is.na(temp$rate), ]
  temp = temp[order(temp$state, temp$rate, temp$hospital), ]
  temp$rate = NULL
  aux = split(temp, temp$state)
  returnValue = data.frame()
  
  if(num == "worst")
  {
    for (i in 1:length(aux))
      returnValue = rbind(returnValue,as.data.frame(aux[[i]][nrow(aux[[i]]),]))
    
  }else
  {
    if(num == "best")
      num = 1
  
    for (i in 1:length(aux))
      returnValue = rbind(returnValue,as.data.frame(aux[[i]][num,]))
  }
  
  returnValue$state = unique(temp$state)
  returnValue
}