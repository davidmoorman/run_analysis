# This script is for the Getting and Cleaning Data course project and performs the following
# tasks (see README.md and CodeBook.md in this repo for further details):
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.

###################################################################################################
# Load required libraries
library(plyr)
library(reshape2)

# Get current working directory and store it
# oldwd <- getwd()

# Set working directory for script
# newwd <- "/Users/david/Dropbox/R/Coursera/UCI HAR Dataset"
# setwd(newwd)


###################################################################################################
# Read in raw data
features <- read.table(file = "features.txt")                              # features
activity_labels <- read.table(file = "activity_labels.txt",
                              col.names = c("activity", "activity.label")) # activity labels

subject_train <- read.table(file = "train/subject_train.txt", 
                            col.names = c("subject"))         # training subjects
X_train <- read.table(file = "train/X_train.txt",
                      col.names = features[ , 2])             # training set
y_train <- read.table(file = "train/y_train.txt",
                      col.names = c("activity"))              # training labels

subject_test <- read.table(file = "test/subject_test.txt",
                           col.names = c("subject"))          # test subjects
X_test <- read.table(file = "test/X_test.txt",
                     col.names = features[ , 2])              # test set
y_test <- read.table(file = "test/y_test.txt",
                     col.names = c("activity"))               # test labels


###################################################################################################
# Step 1 - Merge training and test sets to create one data set 

# Combine data frames for training and data, then combine into a single data frame
train <- cbind(subject_train, X_train, y_train)               # training data
test <- cbind(subject_test, X_test, y_test)                   # test data
combined <- rbind(train, test)                                # merged data (training and test)


###################################################################################################
# Step 2 - Extract only measurements on mean and standard deviation for each measurement

# Extract column names and determine which features 
collabels <- colnames(combined)       # vector of column names
subcol <- grep("subject", collabels)  # subject identifier column number
actcol <- grep("activity", collabels) # activity identifier column number
meancols <- grep("mean", collabels)   # columns for measurements on mean
stdcols <- grep("std", collabels)     # columns for measurements on std
meanstd <- combined[ , c(subcol, meancols, stdcols, actcol)] # subject activity mean & std columns


###################################################################################################
# Step 3 - Use descriptive activity names to name activities in the data set

# Merge descriptive activity names into data frame
labeled <- join(meanstd, activity_labels, by = "activity", type = "left") # merge labels into data


###################################################################################################
# Step 4 - Appropriately label data set with descriptive names

# This step was completed during the import data step above by labeling the raw data with the
#  labels provided in the activity_labels.txt data set (which has been stored in the
#  activity_labels data frame)


###################################################################################################
# Step 5 - From the previous data set, create an independent tidy data set with the average
#  of each variable for each activity and each subject

# Normalize data frame, creating one record per subject per activity per variable per observation
narrow <- melt(labeled, id.vars = c("subject", "activity", "activity.label"))

# Summarize narrow data, creating one record per subject per activity per variable, summarizing
#  the average (mean) value of all observations for the variable
tidy1 <- ddply(narrow, 
              .(subject, activity, activity.label, variable), 
              summarize, mean = mean(narrow$value))

# Create final tidy data frame containing only necessary variables
tidy <- data.frame(subject = tidy1$subject, 
                   activity = tidy1$activity.label,
                   feature = tidy1$variable,
                   average = tidy1$mean)


###################################################################################################
# Output Tidy Data
write.table(tidy, file = "TidyData.txt",row.names = FALSE)


###################################################################################################
# Restore old working directory
# setwd(oldwd)