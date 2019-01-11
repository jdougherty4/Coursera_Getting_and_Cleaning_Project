#load the relavent libraries
library(reshape2)

#Read in features + activity data
features <- read.table("./UCI HAR dataset/features.txt")
activity_labels <- read.table("./UCI HAR dataset/activity_labels.txt")

#Read in the training data
x_train <- read.table("./UCI HAR dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR dataset/train/subject_train.txt")

#Rename the x_training data columns to the correct variable names
names(x_train) <- features$V2

#Creating new variable train with both x_train and y_train, starting with x
train <- x_train

#Adding the Y variable (the activty) to the training set
train$activity <- y_train$V1

#Add subject_train to the train dataset
train$subject <- subject_train$V1
train$subject <- factor(train$subject)

#Read in the test data
x_test <- read.table("./UCI HAR dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR dataset/test/subject_test.txt")

#Rename the x_testing data columns to the correct variable names
names(x_test) <- features$V2

#Creating new variable test with both x_test and y_test, starting with x
test <- x_test

#Adding the Y variable (the activty) to the testing set
test$activity <- y_test$V1

#Add subject_test to the test dataset
test$subject <- subject_test$V1
test$subject <- factor(test$subject)

#Merge the datasets together
data <- rbind(train,test)

#Find only the variables that contain mean() or std()
cols <- names(data)
#add activity and subject to the cols vector

new_cols <- grep("mean\\(\\)|std\\(\\)",cols, value = T)

#add in activity and subject
new_cols <- c(new_cols, "activity", "subject")
new_cols


new_data <- data[,new_cols]

#Add in categorical labels into activity, factors are used for categorical variables in R
new_data$activity <- factor(new_data$activity, 
                            labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))


feature_names <- grep("std\\(\\)|mean\\(\\)", cols, value=TRUE)
dataset_melt <-melt(new_data, id = c('activity', 'subject'), measure_vars = feature_names)
dataset_tidy <- dcast(dataset_melt, activity + subject ~ variable, mean)

#creating a tidy dataset file  
write.table(dataset_tidy, file = "tidydataset.txt", row.names = FALSE)

#view a summary of the tidy dataset
summary(dataset_tidy)
