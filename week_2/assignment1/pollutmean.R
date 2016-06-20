pollutantmean <- function(directory, pollutant, id = 1:332)
{
  files_full <- list.files(directory, full.names=TRUE)
  tmp <- lapply(files_full[id], read.csv)
  frame <- do.call(rbind, tmp)
  mean(frame[, pollutant], na.rm = TRUE)
}