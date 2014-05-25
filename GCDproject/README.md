## Summary ##

run_analysis.R contains code to process the data set from the [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). By default it assumes that the unzipped directory is in the working directory of the user, and will output a text file "tidydata.txt" which contains a row for each subject/activity, and averages for the raw means and standard deviations of the original dataset.

Note that several assumptions have been made in pruning the data:

1. Only means and standard deviations for the rawest data were captured. Hence most of the original columns have been eliminated. See CodeBook.R for more details on the resulting set.
1. Names of columns have been camel cased in order to increase readability.

## Functions

Several helper functions have been used in the processing of the data in order to improve readability and abstract some of the cases which would otherwise be hard coded. This includes the processing of the fields themselves, allowing addition of new fields to be essentially trivial edits. The major functions are described below:

**ReadActivities**: Read in the activies data and normalize to lowercase. Returns a data table containing the activity names and their numeric value.

**ReadFeatures**: Cleans up the features taking only mean and std values for the most raw data sets. This means excluding derived data including the mean frequencies, jerk, magnitude,and the fourier transforms. Additional fields could be re-added trivially by modifiying the regular expression. Returns a data table containing the tidied names, in camel case for readability given the length, and the numeric index of the feature.

**ReadData**: Takes 3 arguments: data_type, activities (assumed to be from ReadActivities), and features (assumed to be from ReadFeatures). Assumes it's at the head of the unzipped dataset, reads the data for the type <data_type> (e.g. "test" or "train"). It removes the relevant fields, labels them, and attaches the appropriate activity and subject data to the data frame. It returns the cleaned data frame.

**JoinData**: Uses the aforementioned functions to clean and return a combined dataset for both the training and test data.

