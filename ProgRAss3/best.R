best <- function(state, outcome) {
        ## vector of the valid outcome types and an index into the outcome data
        valid.outcomes <- c("heart attack", "heart failure", "pneumonia")
        index.outcomes <- c(11,17,23)
        names(index.outcomes) <- valid.outcomes
        
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if (!state %in% data[,7]) { stop("invalid state") }
        if (!outcome %in% valid.outcomes) { stop("invalid outcome") }
        
        ## Return hospital name in that state with lowest 30-day death
        state.data <- subset(data, data[,7] == state)
        outcomes <- as.numeric(state.data[, index.outcomes[outcome]])
        lowest.rate <- min(outcomes, na.rm = TRUE)
        lowest.mortalities.hospitals <- subset(state.data, state.data[, index.outcomes[outcome]] == lowest.rate)[,2]
        if (length(lowest.mortalities.hospitals) > 1) {
                lowest.mortalities.hospitals <- lowest.mortalities.hospitals[order(lowest.mortalities.hospitals)]
                lowest.mortalities.hospitals
        } else {
                lowest.mortalities.hospitals
        }
}
