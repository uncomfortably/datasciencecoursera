best <- function(state, outcome) {
        ## vector of the valid outcome types and an index into the outcome data
        valid.outcomes <- c("heart attack", "heart failure", "pneumonia")
        index.outcomes <- c(11,17,23)
        names(index.outcomes) <- valid.outcomes
        
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if (!state %in% outcome[,7]) { stop("invalid state") }
        if (!outcome %in% valid.outcomes) { stop("invalid outcome") }
        
        ## Return hospital name in that state with lowest 30-day death
        state.data <- subset(outcome, outcome[,7] == state)
        lowest.mortalities <- subset(state.data, 
                state.data[,index.outcomes[outcome]] == min(state.data[,index.outcomes[outcome]
                , na.rm = TRUE))
        lowest.mortalities <- lowest.mortalities[order(lowest.mortalities(,2))]
        lowest.mortalities[1,2]
}
