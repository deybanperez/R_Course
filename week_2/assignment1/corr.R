corr <- function(directory, threshold = 0)
{
  files_full <- list.files(directory, full.names=TRUE)
  indexs <- which(complete("specdata")$nobs > threshold)
  
  length_indexs = length(indexs)
  ret = vector(mode = "numeric")
  
  if(length_indexs > 0)
  {
    tmp <- lapply(files_full[indexs], read.csv)
    
    for(i in 1:length_indexs)
    {
      comp = complete.cases(tmp[[i]])
      ret[i] = cor(tmp[[i]]$nitrate[comp], tmp[[i]]$sulfate[comp])
    }
  }
  
  ret
}