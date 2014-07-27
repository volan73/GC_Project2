# 0 Preparation work
# 0.1 Create directories: one for the whole project and second for the data
setwd("D:/Work")
if (!file.exists("Project_GC")) {
        dir.create("Project_GC")
}
if (!file.exists("Project_GC/Data")) {
        dir.create("Project_GC/Data")
}  
# set working directory to be the directory with data
setwd("D:/Work/Project_GC/Data")
# then manually download project data in working directory

# 1. Merges the training and the test sets to create one data set.
# 1.1 Load raw data in R from files
# prerequisite(again): by hands I downloaded data in directory "Data" in working directory
# 1.1.1 Load measurements (test and train) in R from files
test_data <- read.table("test/X_test.txt")
train_data <- read.table("train/X_train.txt")
# 1.1.2 Setting descriptive column names for test and train in R from files
# Load descriptive column names for test and train in R from files
data_raw_column_names <- read.table("features.txt")
# Make a row of names (extract second column and transpose it)
data_column_names <- t(data_raw_column_names[,2])
# A least setting descriptive column names for test and train in R from files
colnames(test_data) <- data_column_names
colnames(train_data) <- data_column_names
# 1.2 The merging itself
merged_data <- rbind(test_data, train_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# Find columns to extract (condition: names contain "mean()" or "std()")
columns_to_extract <- grep("mean\\(\\)|std\\(\\)", data_column_names)
# Extracts only the measurements on the mean and standard deviation for each measurement. 
extracted_data <- merged_data[ ,columns_to_extract]

# 3. Uses descriptive activity names to name the activities in the data set
# we will do it in next section

# 4. Appropriately labels the data set with descriptive variable names. 
# 4.1 Load activity names in R from files
activity_labels <- read.table("activity_labels.txt")
# 4.2 Load activity numbers (test and train) in R from files
test_activity_data <- read.table("test/y_test.txt")
train_activity_data <- read.table("train/y_train.txt")
# 4.3 Merge activity numbers (test and train)
merged_activity_data <- rbind(test_activity_data, train_activity_data)
# 4.4 Make the column of activite labels (for column of merged activity numbers)
activity_data_column <- activity_labels[merged_activity_data[,1],2]
# 4.5 Bind the column of activite labels to dataframe with measurements on the mean and standard deviation
first_data_set <- cbind(activity_data_column, extracted_data)
#  and give the first column the proper name
names(first_data_set)[1] <- "activity"
# 4.6 Bind the subject data (test and train) for dataframe with measurements and activity labels
# 4.6.1 Read the subject data (test and train) for measurements
test_subjects <- read.table ("test/subject_test.txt")
train_subjects <- read.table ("train/subject_train.txt")
# 4.6.2 Bind the subject data (test and train) in one column
subjects <- rbind(test_subjects, train_subjects)
# 4.6.3 Give the column with subject data the proper name
names(subjects) <- "subject"
# 4.6.4 At least bind the subject data with measurements and activity labels
first_data_set <- cbind(subjects, first_data_set)
# 4.7 Write the dataframe to the file first_data_set.txt
write.table(first_data_set, file = "../first_data_set.txt")
 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# we will createsecond data set by reshaping the first data set
# for reshaping we wil use two packages: reshape2 and plyr(may be) 
library(reshape2)
library(plyr)
# 5.1. Reshape the first data set in data frame
data_set_melted <- melt(first_data_set, id = c("subject", "activity"))
# 5.2. Calculate the mean(average) with the help of ddply function
second_data_set <- ddply(data_set_melted,.(subject, activity, variable),summarize,mean=mean(value))
# 5.3. Change name "mean" with "average"
names(second_data_set)[4] <- "average"
# 5.4. Write second data set to the file
write.table(second_data_set, file = "../second_data_set.txt")