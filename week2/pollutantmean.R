## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)
## NOTE: Do not round the result!

pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    installDep()
    
    list <- c()
    
    for (i in id) {
        df <- read.csv(paste(directory, "/", str_pad(i, 3, pad = 0), ".csv", sep = ""))
        dfPollute <- df[pollutant]
        na <- is.na(dfPollute)
        list <- append(list, dfPollute[!na])
    }
    
    mean(list)
}

installDep <- function() {
    if (!require('stringr')) {
        install.packages("stringr")
        library(stringr)
    }
}