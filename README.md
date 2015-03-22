# Course Project 
This repository contains my submission for the "Getting and Cleaning data" course project. What follows is a description about the project, brief information about the raw data set, all files stored in the repository and how to check the R script.

## Description
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare a tidy data set that can be used for later analysis. This tidy data set is obtained by performing the below mentioned steps.

The data linked represents data collected from the accelerometers from the Samsung Galaxy S smartphone. This data was produced as part of the Human Activity Recognition Using Smartphones project. A full description is available at the following site:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data set can be downloaded here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script called "run_analysis.R" performs the following steps:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set.
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Brief Information about the raw data set 
The raw data set consists of experiments performed with 30 volunteers within the age bracket of 19-48 years. Each person wore a smartphone (Samsung Galaxy S II) on the waist and performed six activities. The obtained dataset are partitioned into the training data set (70%) and training data set (30%).

For further information read the Code Book.

## Files of this repository
- README.md: this file
- CodeBook.md: the code book gives detailed information about the raw data and attributes, describes the variables and any transformations or work performed to clean up the data.
- run_analysis.R: The R script performs the steps and eventually transforms the raw data set in a tidy data set

## How to check the R script
- Fork this repository and clone it on your local computer 
- Download the zipped raw data via the link mentioned above 
- Unzip the raw data set and copy the file "UCI HAR Dataset" to the directory of the cloned repository
- Open a R Console and set the working directory (setwd) to the directory of the cloned repository 
- Run the "run_analysis.R" script

In the directory will you also find the text file ("tidy_data.txt") generated at the end of the R script.


Any improved suggestions for my script are highly appreciated!











