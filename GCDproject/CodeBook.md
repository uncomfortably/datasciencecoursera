## Summary

The dataset contains a summation of the raw data contained in the [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It is a concatenation of the training and test data, and summarizes several of the original mean and standard deviations for the raw data. It does not contain the summaries for the derived data contained in the original dataset and so is therefore heavily pruned. In general it acts on the following sets:

1. The means and standard deviations of the X,Y,Z measures of the body accelerometer.
1. The means and standard deviations of the X,Y,Z measures of the gravity accelerometer.
1. The means and standard deviations of the X,Y,Z measures of the gyroscope.

Note that the features themselves are camel cased due to length in order to preserve human readability.

## Features

**subjectActivity**: A simple concatenation representing the subject number and activity performed for the values in the other columns.  
**timeSeriesBodyAccelerometerMeanXAverage**: Mean of the mean X values of the body accelerometer.  
**timeSeriesBodyAccelerometerMeanYAverage**: Mean of the mean Y values of the body accelerometer.  
**timeSeriesBodyAccelerometerMeanZAverage**: Mean of the mean Z values of the body accelerometer.  
**timeSeriesBodyAccelerometerStdDevXAverage**: Mean of the standard deviation of the X values of the body accelerometer.  
**timeSeriesBodyAccelerometerStdDevYAverage**: Mean of the standard deviation of the Y values of the body accelerometer.  
**timeSeriesBodyAccelerometerStdDevZAverage**: Mean of the standard deviation of the Z values of the body accelerometer.  
**timeSeriesBodyGyroMeanXAverage**: Mean of the mean X values of the gyroscope.  
**timeSeriesBodyGyroMeanYAverage**: Mean of the mean Y values of the gyroscope.  
**timeSeriesBodyGyroMeanZAverage**: Mean of the mean Z values of the gyroscope.  
**timeSeriesBodyGyroStdDevXAverage**: Mean of the standard deviation of the X values of the gyroscope.  
**timeSeriesBodyGyroStdDevYAverage**: Mean of the standard deviation of the Y values of the gyroscope.  
**timeSeriesBodyGyroStdDevZAverage**: Mean of the standard deviation of the Z values of the gyroscope.  
**timeSeriesGravityAccelerometerMeanXAverage**: Mean of the mean X values of the gravity accelerometer.  
**timeSeriesGravityAccelerometerMeanYAverage**: Mean of the mean Y values of the gravity accelerometer.  
**timeSeriesGravityAccelerometerMeanZAverage**: Mean of the mean Z values of the gravity accelerometer.  
**timeSeriesGravityAccelerometerStdDevXAverage**: Mean of the standard deviation of the X values of the gravity accelerometer.  
**timeSeriesGravityAccelerometerStdDevYAverage**: Mean of the standard deviation of the Y values of the gravity accelerometer.  
**timeSeriesGravityAccelerometerStdDevZAverage**: Mean of the standard deviation of the Z values of the gravity accelerometer.  
