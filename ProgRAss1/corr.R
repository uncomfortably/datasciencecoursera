corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        
        options(digits=4)
        
        corrs <- numeric()
        completes <- complete(directory)
        completes_threshold <- subset(completes, nobs > threshold)
        
        for( i in completes_threshold$id ) {
                filename <- paste(directory,"/",formatC(i, width=3, flag="0"),".csv",sep="")
                data <- read.csv(filename)
                cleaned <- data[complete.cases(data),,]
                corrs <- c(corrs,cor(cleaned$sulfate, cleaned$nitrate))
        }
        corrs
}
