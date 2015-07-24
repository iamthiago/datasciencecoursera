best <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    
    map <- list("heart attack" = 11, "heart failure" = 17, "pneumonia" = 23)
    csv <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    if(!state %in% csv[[7]]) { stop("invalid state") }
    if(!outcome %in% names(map)) { stop("invalid outcome") }
    
    type <- map[outcome]
    val <- type[[1]]
    
    sub <- csv[csv$State == state, ]
    hospital <- sort(sub[sub[val] == min(as.numeric(sub[, val]), na.rm = TRUE), c(2)])
    hospital[[1]]
}