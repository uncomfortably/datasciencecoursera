pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        options(digits=4)
        clean_data = numeric()
        for( i in id ) {
                filename <- paste(directory,"/",formatC(i, width=3, flag="0"),".csv",sep="")
                data <- read.csv(filename)
                dirty <- data[pollutant]
                clean <- dirty[!is.na(dirty)]
                clean_data <- c(clean_data,clean)
        }
        mean(clean_data)
}

