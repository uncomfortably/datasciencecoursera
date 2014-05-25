# Clean up the features taking only mean and std values for the most raw data sets.
# This means excluding derived data including the mean frequencies, jerk, magnitude, 
# and the fourier transforms
ReadFeatures <- function() {
        features <- read.table('features.txt')
        features <- features[grep("fBody|angle|Mag|Jerk",features$V2, invert=TRUE),]
        features <- features[grep("mean|std",features$V2),]
        features$V2 <- sub("t","timeSeries",features$V2)
        features$V2 <- sub("std","StdDev",features$V2)
        features$V2 <- sub("mean","Mean",features$V2)
        features$V2 <- sub("Acc","Accelerometer",features$V2)
        features$V2 <- gsub("\\(","",features$V2)
        features$V2 <- gsub("\\)","",features$V2)
        features$V2 <- gsub("-","",features$V2)
        return(features)
}

# Read in the activies data and normalize to lowercase
ReadActivities <- function() {
        activities <- read.table("activity_labels.txt")
        activities$V2 <- tolower(activities$V2)
        return(activities)
        
}

# Assumes it's at the head of the unzipped dataset, reads the data
# for the type <data_type> (e.g. "test" or "train"). It removes the
# relevant fields, labels them, and attaches the appropriate activity
# and subject data to the data frame. It returns the cleaned data frame.
ReadData <- function(data_type, activities, features) {
        data_file <- paste(data_type,"/X_",data_type,".txt", sep='')
        activity_file <- paste(data_type,"/y_",data_type,".txt", sep='')
        subject_file <- paste(data_type,"/subject_",data_type,".txt", sep='')
        data <- read.table(data_file)
        
        data <- data[,features$V1]
        colnames(data) <- c(features$V2)
        activitiesData <- read.table(activity_file)
        data$activities <- factor(activitiesData$V1, labels = activities$V2)

        subjects <- read.table(subject_file)
        data$subjects <- subjects$V1
        return(data)
}

# Returns the test and training data joined and labeled
JoinData <- function() {
        test <- ReadData("test", activities, features)
        train <- ReadData("train", activities, features)
        data <- rbind(test,train)
        return(data)
}

library(reshape2)

# Save current working directory before descending into the data
cwd <- getwd()

setwd("UCI HAR Dataset")
activities <- ReadActivities()
features <- ReadFeatures()
data <- JoinData()

# Concatenate the subject and activity data, reshape, and grab the means
data$subjectActivity <- paste("subject",data$subject,data$activities,sep='')
dataMelt <- melt(data, id="subjectActivity", measure.vars=features$V2)
dataMelt$variable <- paste(dataMelt$variable,"Average",sep="")
data <- dcast(dataMelt,subjectActivity ~ variable, mean)

# Revert to original location and output the txt
setwd(cwd)
write.table(data, "tidydata.txt")
