rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    index <- ifelse(outcome == "heart attack", 11, ifelse(outcome == "heart failure", 17, 23))
    csv <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    # Check for invalid data
    if(!state %in% csv[[7]]) { stop("invalid state") }
    if (!outcome %in% c("heart attack", "heart failure", "pneumonia")) { stop("invalid outcome") }
    
    # Convert the index as numeric and omit the NA
    csv[, index] <- suppressWarnings(as.numeric(csv[, index]))
    csv <- na.omit(csv)
    
    # Create a slice by State and sort it by index and hospital name
    slice <- subset(csv, State == state)
    slice <- slice[order(slice[, index], slice[, 2], na.last = TRUE), 2]
    slice <- na.omit(slice)
    
    num <- ifelse(num == "best", 1, ifelse(num == "worst", length(slice), as.numeric(num)))
    
    slice[num]
}