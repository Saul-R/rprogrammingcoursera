pollutantmeanImpl <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
    
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  savewd<-getwd()
  setwd(paste(getwd(),"directory",sep=""))
  
  filenames <- list.files(path = getwd())
  fullfile <- do.call(rbind,lapply(filenames, read.csv, header = TRUE))
  
  setwd(savedwd)
  mean(x = fullfile[fullfile$ID %in% id,pollutant],na.rm = TRUE)
  
  
}