## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

complete <- function(directory, id = 1:332) {
    
    installDep()
    
    output <- data.frame()
    
    for (i in id) {
        df <- read.csv(paste(directory, "/", str_pad(i, 3, pad = 0), ".csv", sep = ""))
        nobs <- complete.cases(df)
        row <- c(i, sum(nobs))
        output <- rbind(output, row)
    }
    
    colnames(output) <- c('id', 'nobs')
    output
}

installDep <- function() {
    if (!require('stringr')) {
        install.packages("stringr")
        library(stringr)
    }
}