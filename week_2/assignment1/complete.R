complete <- function(directory, id = 1:332)
{
  files_full <- list.files(directory, full.names=TRUE)
  tmp <- lapply(files_full[id], read.csv)
  frame = NULL
  
  for(i in 1:length(tmp))
    frame <- rbind(frame,data.frame(unique(tmp[[i]]$ID), sum(complete.cases(tmp[[i]]))))
  
  colnames(frame) <- c("id", "nobs")
  frame
}
