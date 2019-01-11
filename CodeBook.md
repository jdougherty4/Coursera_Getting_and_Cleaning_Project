# Code Book for Getting and Cleaning Data class on Coursera

By modifying and tidying the UCI HAR Dataset, we have the following variables:

1. activity: an ID to indicate the activity type (walking vs standing, ect)
2. subject: a unique ID given to each participant
3. summary statistics for features. These varibales are the mean or standard devations of the following:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Transformations from the original dataset:
* columns replaced with propor labels
* only features with mean() or std() in the title are selected
* activity added as a feature
* the results are grouped by both the activity label and subject variables