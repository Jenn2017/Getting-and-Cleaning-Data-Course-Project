# Getting-and-Cleaning-Data-Course-Project
Coursera course project

The objective of the course project is to create one R script called run_analysis.R 
that does the following:

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names.

5.From the data set in step 4, creates a second, independent tidy data set with the average 
  of each variable for each activity and each subject.

The data used is from the following website:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 
It was collected from the accelerometers of Samsung Galaxy S smartphones. There were 
30 participants in the study, each performed 6 activities.

Additional information about the dataset is provided here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data is from a zipped folder called UCI HAR Dataset. From the folder the following
files were used:


-'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
   Its range is from 1 to 30. 

- 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. 
   Its range is from 1 to 30. 


===================================================================

Files:

run_analysis.R - R script which gets and cleans data creating a tidy data set and output file for the group means
                 in part 5 of the objective

Part 4 - Tidy Data.txt - text file created as a result of run_analysis.R. It provides a wide tidy data set.

Part 5 - Group Means.txt  - text file created as a result of run_analysis.R. It provides the group means with the average 
                        of each variable for each activity and each subject. Read using text editor like Notepad++ for better 			                 display

Codebook.txt  - details the variables, transformations and steps used to create tidy data



