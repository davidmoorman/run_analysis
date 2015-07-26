# Tidy Data Principles
The dataset TidyData.txt is the result of running the run_analysis.R script. A tidy dataset, according to [Hadley Wickham](http://vita.had.co.nz/papers/tidy-data.pdf) is a dataset where:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

These principles are explained below in relation to TidyData.txt. I decided to implement the solution using a narrow data format to enhance readability and flexibility for future use of the data.

---
# Variables
TidyData.txt contains four columns/variables (meeting condition 1 above):

### subject 
A unique numeric identifier indicating the subject (1-30) from the original study.

### activity 
A text identifier indicating the activity the subject was performing during measurement. The following values are possible (and are self-explanatory):

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### feature
A text identifier indicating the feature (variable).

* The raw data contained measurements for a total of 561 unique features (variables)
* Based on the instructions for this exercise, only the measurements of mean and standard deviation were kept. It should be noted that features for angle measurement mean were not included in this analysis.
* In the raw data, measurements along the X, Y and Z directions of the accelerometer are presented as unique features. This convention has been maintained, as they are represented individually in TidyData.txt as well.
* As a result, 79 unique features are summarized for each activity for each subject.

### average
A numeric value indicating the mean value of all raw observations for each combination of: subject, activity and feature. 

In particular, each observation in TidyData.txt 'average' summarizes the average value of all measurements of 'feature' for 'subject' performing 'activity' (meeting condition 2 above).

Condition 3 above is met due to the nature of the raw data. In particular, the observations are all derived from raw accelerometer data. If the data contained some accelerometer data and some temperature data, it would be appropriate to separate the different observation types into separate tables.

---
# Output
The resulting file, TidyData.txt, contains the average value for each of 79 unique features for each of 6 activities for each of 30 subjects. This results in a tidy dataset with 79 * 6 * 30 = 14220 observations.