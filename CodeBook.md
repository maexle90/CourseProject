# Code Book
This is the code book that gives detailed information about the raw data and attributes, describes the variables and any transformations or work performed to clean up the data.

## Raw Data Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information:
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

# Variables
## Feature selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

    gravityMean
    tBodyAccMean
    tBodyAccJerkMean
    tBodyGyroMean
    tBodyGyroJerkMean


Note: features are normalized and bounded within [-1,1].

# Describition of variables and transformations to clean up the data
The features (in total 561) are unlabeled and can be found in the "x_test.txt" and "x_train.text" files respectively. The features names (column names) are stored in the file "features.text". The activity labels are in the "y_test.txt" and "y_train.txt" files. The test subjects (volunteers) are in the "subject_test.txt" and "subject_train.txt" files.

## Step 1: Merges the training and the test sets to create one data set.
After setting the directory, all the following files are read into tables and merged to one final data set.

- x_train.txt: features train data set (561 columns)
- y_train.txt: Activity number for each train row 
- s_train.txt: Subject (=volunteer) for each train row
- x_test.txt: features test data set (561 columns)
- y_test.txt: Activity number for each test row 
- s_test.txt: Subject (=volunteer) for each test row
- features.txt: Features names (used as column names)
- activitylabels.txt: Table with the Activity Number and its related activity (Sitting, Standing...)

--> merged to "finalData"

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
A logcal vector (meanstd) is created that contains TRUE values for only the column names with "mean or "std" in it and FALSE for all other column names. 
The subsetted final data (68 rows) keeps only the necessary columns (with mean or std in it). Additionally, by subsetting the new column name, variable "columnNames" needs to be considered.  

## Step 3: Uses descriptive activity names to name the activities in the data set.
The final data subset will be merged with the activitylabels table. Ultimately, the subset also contains the activity (Sitting, Standing...) respectively for each row. 

## Step 4: Appropriately labels the data set with descriptive variable names.
The "gsub" function is used to rename the column names of the final data subset in order to make the labels more readable.

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
A tidy data set will be generated and written as a text file (tidy_data.txt). This text file consists of 180 rows and 68 columns and depicts the mean for each activity (6 in total) for every subject (=volunteer) respectively. 
