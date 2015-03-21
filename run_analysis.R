## This script (called run_analysis.R) will perform the following 5 steps on the data set of the UCI 
## Human Activity Recognition Using Smartphones Data Set from the link: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average 
##    of each variable for each activity and each subject.

## The output of the script is a tidy data set (file "./tidy UCR HAR summary.txt".
## Please see the code book for a description of the contents of this file.

##########################################################################################################


## Setting working directory via setwd() command
## The unzipped data set (UCI HAR Dataset) is manually downloaded via the above mentioned link 
## and stored in this working directory. For the following steps it is renamed to "UCI_HAR_Dataset"

getwd()
setwd("C:/Users/Max/Desktop/Studium/Selbststudium/Coursera/03_Getting_and_Cleaning_Data/CourseProject")


## Step 1:
## Merges the training and the test sets to create one data set.
###############################################################################################

## Load train data set
x_train <- read.table("./UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt", col.names=c("NumbActivity"))
s_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", col.names=c("IDSubject"))

## Load test data set 
x_test <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt", col.names=c("NumbActivity"))
s_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", col.names=c("IDSubject"))

## Load features and activity labels
features <- read.table("./UCI_HAR_Dataset/features.txt")
activitylabels <- read.table("./UCI_HAR_Dataset/activity_labels.txt", col.names=c("NumbActivity","ActivityType"))

## Assign column names from the "features" data set to the train and test data set respectively
colnames(x_train) <- features[,2]
colnames(x_test) <- features[,2]

## Merge x_train, y_train and s_train to create "final" train data set
trainData <- cbind(y_train,s_train,x_train)

## Merge x_test, y_test and s_test to create "final" test data set
testData <- cbind(y_test,s_test,x_test)

## Merge the rows from the merged train and merged test data set
## to create the final data set called "finalData"
finalData <- rbind(trainData, testData)

#############Step 1 finished#############


## Step 2:
## Extracts only the measurements on the mean and standard deviation for each measurement.
###############################################################################################

## Save only the column names with mean() or std() in it
meanstd<-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

## Save the column names for all columns also 
## considering the columns "NumbActivity" and "IDSubject"
columnNames<-c("NumbActivity", "IDSubject", as.character(meanstd))

## Subset the finalData frame with the respective column names above
finalData<-subset(finalData,select=columnNames)

#############Step 2 finished#############


## Step 3:
## Uses descriptive activity names to name the activities in the data set.
###############################################################################################

## Merge the data sets "final data" and "activitylabels" by column "NumbActivity"
finalData <- merge(activitylabels, finalData, by="NumbActivity", sort=FALSE, all.x=TRUE)

#############Step 3 finished#############


## Step 4:
## Uses descriptive activity names to name the activities in the data set.
###############################################################################################

## Rewrite the column names: writing out the abbreviation
names(finalData)<-gsub("^t", "time", names(finalData))
names(finalData)<-gsub("^f", "freq", names(finalData))
names(finalData)<-gsub("Acc", "Accelerometer", names(finalData))
names(finalData)<-gsub("Gyro", "Gyroscope", names(finalData))
names(finalData)<-gsub("Mag", "Magnitude", names(finalData))
names(finalData)<-gsub("\\()","", names(finalData))

#### Possibilities if column name is still subjectively too long
names(finalData)<-gsub(gsub("AccMag","AccMagnitude", names(finalData))
names(finalData)<-gsub(gsub("AccJerkMag","AccJerkMagnitude", names(finalData))
names(finalData)<-gsub("GyroMag","GyroMagnitude", names(finalData))
names(finalData)<-gsub("GyroJerkMag","GyroJerkMagnitude", names(finalData))
####

#############Step 4 finished#############


## Step 5:
## From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.
###############################################################################################

## Create a tidy data set with mean for every NumbActivity for each IDSubject 
tidyData <- aggregate(finalData, by=list(NumbActivity = finalData$NumbActivity, IDSubject=finalData$IDSubject), mean)

## Perform the following command threew times in order to delete the unecessary columns 
tidyData[,3] = NULL

## Write the tidy data set as a textfile in the working directory
write.table(tidyData, "tidy_data.txt", row.names=FALSE)

#############Step 5 finished#############











