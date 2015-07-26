# Getting and Cleaning Data Course Project
## Creating Tidy Data
The purpose of the run_analysis.R script is to create a tidy dataset that can be used for later analysis. The exercise involves gathering, merging, manipulating and summarizing raw data as well as creating supporting documentation to accompany the functioning program.

For this exercise, I decided to implement the solution using the narrow format of tidy data. This creates a rather long and narrow data set that is easy to read (involving no horizontal scrolling) and lends itself to a variety of downstream uses. 

## Raw data
The raw data linked represent data collected from the Samsung Galaxy S smartphone. A full description of the data is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The actual data used for the project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Upon downloading the source data, the following files may be helpful:

* README.txt - This file explains the experiment, the data and the file and folder structure
* activity_labels.txt - This file contains the descriptive text labels for the numeric activity indicators in the labels data
* features_info.txt - This file contains further information about the features measured and reported in the raw data files
* features.txt - This file contains a complete list of unique features measured 
* test directory - This directory contains raw data files for test data (separate files for subject indicator, features and labels)
* train directory - This directory contains raw data files for training data (separate files for subject indicator, features and labels)

## Script Requirements
The following packages are required for run_analysis.R and should be installed prior to running:

* plyr - required for the join() and ddply() functions
* reshape2 - required for the melt() function

## Script Details
The run_analysis.R performs the following tasks as specified by the assignment:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please see CodeBook.md in this repository for further details regarding the output data as well as the decisions made during processing.