
##Getting and Cleaning Data Course Project
## This script will:
##	Part 1. Merge the training and test sets to create one data set
##	Part 2. Extract only the measurements on the mean and standard deviations for each environment
##	Part 3. Use descriptive activity names to name the activities in the data set
##	Part 4. Appropriately label the data set with descriptive variable names
##	Part 5. Create a second tidy data set with the average of each variable for each activity and each subject



##Part 1 Merge the training and test sets to create one data set

##Download and unzip file

if(!file.exists("./data")){dir.create("./data")}
fileURL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="./data/UCI HAR Dataset.zip", mode="wb")
setwd("./data")
unzip("UCI HAR Dataset.zip")

#############################################

##Create file path to access data in UCI HAR Dataset

home=setwd(Sys.getenv("Home"))
fpath=file.path(home, "UCI HAR Dataset")
setwd(fpath)

##Read test data into R
library(data.table)
testData <- data.table(read.table("test\\X_test.txt", stringsAsFactors=FALSE))


##Read train data into R
trainData <- data.table(read.table("train\\X_train.txt", stringsAsFactors=FALSE))

##Combine test and train data 
TrainTestDt<-rbind(trainData,testData)

################################################


##Read test labels into R
testLabels <- data.table(read.table("test\\y_test.txt", stringsAsFactors=FALSE))


##Read train labels into R
trainLabels <- data.table(read.table("train\\y_train.txt", stringsAsFactors=FALSE))

##Combine test and train labels 
TrainTestLabels<-rbind(trainLabels,testLabels)


###############################################

##Read test subjects into R
testSubject <- data.table(read.table("test\\subject_test.txt", stringsAsFactors=FALSE))


##Read train subjects into R
trainSubject <- data.table(read.table("train\\subject_train.txt", stringsAsFactors=FALSE))

##Combine test and train labels 
TrainTestSubject<-rbind(trainSubject,testSubject)


##Add column name to be more discriptive

library(plyr)

rename(TrainTestSubject, c("V1" = "Subject"))

################################################
##Read features into R
features<- data.table(read.table("features.txt", stringsAsFactors=FALSE))

featureNames<-features[["V2"]]


## Assign column names to TrainTestDt data table
setNames(object=TrainTestDt,featureNames)


#################################################

##PART 1 
##Column Bind the test, train, subject, and label dataframes together

SubjectLabelDataDt<-cbind(TrainTestSubject,TrainTestLabels,TrainTestDt)

OrderedData<-arrange(SubjectLabelDataDt,Subject,V1)

###############################################

##Part 2 

##Subset to extract only the measurements on the mean and standard deviation for each measurement.

##From Patrick McDevitt in Coursera Getting and Cleaning Data Class Discussion Forum Thread: Extracting Mean and Std Column
library(gdata)
mean_cols<-matchcols(OrderedData, with=c("mean"), without=c("meanFreq"))
std_cols<-matchcols(OrderedData,with=c("std"))
new_cols<-c(mean_cols,std_cols)
data.frame(new_cols)

MeanStdData<-subset(OrderedData,select = c("Subject","V1",new_cols))


################################################

##Part 3 

##Use descriptive activity names to name the activities in the data set

##Read in activity_labels.txt into R
activity<-data.table(read.table("activity_labels.txt"))

##Merge Train and Test Data with Activity_Labels
DataActivityNames<-merge(MeanStdData,activity,by=c("V1"),all=TRUE)

##Rearrange order of columns because merge moves column V2 with activity names to the end
setcolorder(DataActivityNames,c(1,2,69,3:68))

##Remove column V1 (Labels Data)
LabeledMeanStdData<-subset(DataActivityNames,select=c(-V1))


##############################################

##Part 4. Appropriately label the data set with descriptive variable names

##Change column name V2 to Activity
 setnames(LabeledMeanStdData,"V2","Activity")

write.table(LabeledMeanStdData,"Part 4 - Tidy Data.txt",sep="\t", row.names=FALSE)

################################################

##PART 5 
##Create a second tidy data set with the average of each variable for each activity and each subject

library(dplyr)

AvgVarActSub<-LabeledMeanStdData %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))

GroupMeanDt<-arrange(AvgVarActSub,Subject,Activity)

##Writes data table to excel file

write.table(GroupMeanDt,"Part 5 - Group Means.txt",sep="\t", row.names=FALSE)








