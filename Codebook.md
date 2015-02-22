Getting and Cleaning Data Course Project
Codebook


SCRIPT
run_analysis.R - R script which gets and cleans data creating a tidy data set and output file for the group means
                 in part 5 of the objective
                 
The initial part of this script downloads a file from a URL. The script is written for a pc on Windows.

This script will:
Part 1. Merge the training and test sets to create one data set
Part 2. Extract only the measurements on the mean and standard deviations for each environment
Part 3. Use descriptive activity names to name the activities in the data set
Part 4. Appropriately label the data set with descriptive variable names
Part 5. Create a second tidy data set with the average of each variable for each activity and each subject



INPUT

From UCI HAR Dataset

features.txt
activity_labels.txt
train/X_train.txt
train/y_train.txt
test/X_test.txt
test/y_test.txt
train/subject_train.txt 
train/subject_test.txt


OUTPUT

Part 4 - Tidy Data.txt - text file created as a result of run_analysis.R. It provides a wide tidy data set. 
	A wide tidy data set was chosen as we are required to compute the group mean of each variable.

Part 5 - Group Means.txt  - text file created as a result of run_analysis.R. It provides the group means with the average 
                        of each variable for each activity and each subject. Read using text editor like Notepad++ for better 			display


INITIAL VARIABLES

from the Subject data (both train and test files) - V1 which are the numbers corresponding to each subject

from the Labels data (both train and test files) - V1 which are the labels associated with each activity

from the Activity data - V1 which are the labels associated with each activity; V2 The activity names

from the features data - the variable names for the test and train data (X_test.txt,y_test.txt,X_train.txt,y_train.txt files)
	                see the features_info.txt file in the zip folder UCI HAR Dataset - download in part 1

		





INSTRUCTIONS

This script requires the following libraries:
plyr
dplyr
gdata
data.table


Part 1 Merge the training and test sets to create one data set

1. A directory called "data" is created if it does not already exist. 
2. The script downloads the file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. The file is placed in the "data" directory
4. Next the file is unzipped and the contents extracted to a folder named UCI HAR Dataset
5. A file pather is created to access files in UCI HAR Dataset
6. The data for test and train are read into R and the 2 datasets are combined
   The train data is placed on top of the test data
7. The labels for test and train are read into R and the 2 datasets are combined
8. The subjects for test and train are read into R and the 2 datasets are combined
9. The column name V1 in the combined subject dataset is changed to Subject to be more descriptive
10.The feature data is read into R. This data will become the column headings for the test/train data in step 6
11. The features data is then subsetted to drop the index column (1st column in the table). The features column is preserved.
12. The features column is then set as the column names for the test/train data from step 6
13. The test/train tables for the data, subject, and labels are combined

###############################################

Part 2: Subset to extract only the measurements on the mean and standard deviation for each measurement.

1. A dataframe is created with only column names with mean and std in the name
2. meanFreq is removed as it is a frequency count rather than a mean variable
3. The data set from Part 1 is then subsetted to only the mean and std variables.

################################################

Part 3: Use descriptive activity names to name the activities in the data set

1. Activity data read into R
2. Activity data merged with dataset from Part 2. This created a dataset with a column identifying
   the activity label with its corresponding activity name. The data was merged using V1 in both tables
3. All data was combined in Part 1 prior to merging because merging causes the data to change order
4. The columns were rearranged removing column V1 and moving column V2 to the second column position


#####################################################

Part 4. Appropriately label the data set with descriptive variable names

1. The last unnamed column is V2. It is renamed to Activity to be descriptive
2. Part 4 - Tidy Data.txt - text file created of wide tidy data


################################################

PART 5 
Create a second tidy data set with the average of each variable for each activity and each subject

1. The average of each group of activities per subject is calculated
2. The data is rearrange to better show this grouping
3. This data is written to a table called GroupMeanDt which is placed in the UCI HAR Dataset folder
















