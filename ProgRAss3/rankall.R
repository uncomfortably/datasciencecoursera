rankall <- function(outcome, num = "best") {
        ## vector of the valid outcome types and an index into the outcome data
        valid.outcomes <- c("heart attack", "heart failure", "pneumonia")
        index.outcomes <- c(11,17,23)
        names(index.outcomes) <- valid.outcomes
        
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check outcome is valid
        if (!outcome %in% valid.outcomes) { stop("invalid outcome") }
        
        ## For each state, find the hospital of the given rank
        
        data <- data[,c(2,7,index.outcomes[outcome])]
        data[,3] <- as.numeric(data[,3])
        data <- data[complete.cases(data),]
        index.order <- order(data[,2], data[,3], data[,1])
        data <- data[index.order,]
        
        splitter <- data[2]
        data.split <- split(data,splitter)
        #data.ordered <- lapply(data.split, function(x) x[order(x[3,])])
        
        if (num == "best") {
                outcome <- lapply(data.split, function(x) head(x,1))
        } else if (num == "worst") {
                outcome <- lapply(data.split, function(x) tail(x,1))
        } else {
                outcome <- lapply(data.split, function(x) c(x[num,1],x[1,2],x[num,3]))
        }
        
        outcome
        output <- do.call("rbind", outcome)
        output
        colnames(output) <- c("hospital","state","trash")
        output <- data.frame(output)
        output <- output[c("hospital","state")]
        output
}
