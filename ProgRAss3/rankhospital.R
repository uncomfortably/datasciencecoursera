rankhospital <- function(state, outcome, num = "best") {
        ## vector of the valid outcome types and an index into the outcome data
        valid.outcomes <- c("heart attack", "heart failure", "pneumonia")
        index.outcomes <- c(11,17,23)
        names(index.outcomes) <- valid.outcomes
        
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if (!state %in% data[,7]) { stop("invalid state") }
        if (!outcome %in% valid.outcomes) { stop("invalid outcome") }
        
        ## Return hospital name in that state with the given rank
        state.data <- subset(data, data[,7] == state)
        logical.complete <- complete.cases(as.numeric(state.data[,index.outcomes[outcome]]))        
        state.data <- state.data[logical.complete,]
        index.order <- order(as.numeric(state.data[, index.outcomes[outcome]]),state.data[,2])
        hospitals.ordered <- state.data[,2][index.order]
        if (num == "best") {
                head(hospitals.ordered,1)
        } else if (num == "worst") {
                tail(hospitals.ordered,1)
        } else {
                hospitals.ordered[num]
        }
}
