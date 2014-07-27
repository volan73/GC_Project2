## As reqired this file contains explanation on how the script works.


Project: Getting and Cleaning Data Course Project

Inputs of the project:
Project data from  

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Outputs  of the project:
 1) file "first_data_set.txt" with first data set;
 2) file "second_data_set.txt" with second (tidy) data set;
 3) file "README.md" with explanation on how the script work;
 4) file "CodeBook.md" which describes the variables, the data, and all transformations with raw data;
 5) file "run_analysis.R" which contains R script for performing the analysis.


Explanation on how the script works:

All the explanation is included in script itself as structured comments. But here I will write these comments without actual R commands.
I think it is the best explanation.


0 Preparation work
0.1 Create directories: one for the whole project and second for the data set working directory to be the directory with data
then manually download project data in working directory

1. Merges the training and the test sets to create one data set.
1.1 Load raw data in R from files.
(prerequisite(again): by hands I downloaded data in directory "Data" in working directory)
1.1.1 Load measurements (test and train) in R from files.
1.1.2 Setting descriptive column names for test and train in R from files.
Load descriptive column names for test and train in R from files.
Make a row of names (extract second column and transpose it).
At least setting descriptive column names for test and train in R from files.
1.2 The merging itself.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Find columns to extract (condition: names contain "mean()" or "std()").
Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set (we will do it in next section).

4. Appropriately labels the data set with descriptive variable names. 
4.1 Load activity names in R from files.
4.2 Load activity numbers (test and train) in R from files.
4.3 Merge activity numbers (test and train).
4.4 Make the column of activite labels (for column of merged activity numbers).
4.5 Bind the column of activite labels to dataframe with measurements on the mean and standard deviation
and give the first column the proper name.
4.6 Bind the subject data (test and train) for dataframe with measurements and activity labels.
4.6.1 Read the subject data (test and train) for measurements.
4.6.2 Bind the subject data (test and train) in one column.
4.6.3 Give the column with subject data the proper name.
4.6.4 At least bind the subject data with measurements and activity labels.
4.7 Write the dataframe to the file first_data_set.txt.
 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
We will create second data set by reshaping the first data set
for reshaping we wil use two packages: reshape2 and plyr(may be).
5.1. Reshape the first data set in data frame.
5.2. Calculate the mean(average) with the help of ddply function.
5.3. Change name "mean" with "average".
5.4. Write second data set to the file.








