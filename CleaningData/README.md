# Getting and Cleaning Data

## The purpose of the run_analysis.R script is to accomplish the below objective.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each me2urement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Transformation details

Below are the details fo transformation done to the original data:

1. Data from the three test files X_test, y_test and subject was combined and labelled using the metadata files features and activity_labels. Only the measurements on the mean and standard deviation for each measurement was 
taken and rest of the variables were discarded.
2. Similar transformation was done to the training data set.
3. Data from the transformed training and test data sets were then merged.
4. A second, independent tidy data set with the average of each variable for each activity and each subject was then created.

## Notes

1. Download the data source and unzip into a folder on your local drive. 
Data can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. run_analysis.R should reside in the parent folder of UCI HAR folder.

3. A description of the variables produced by the run_analysis.R can be found in
 the CodeBook.
