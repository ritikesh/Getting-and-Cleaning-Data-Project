CodeBook
========

This codebook describes the variables found in the tidy dataset generated by running run_analysis.R

Overview
--------

The original data set was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

It is described as a "Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors."

The experiments involved 30 subjects. Each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) with a sensor-equipped smartphone attached to their waist. The smartphone's accelerometer and gyroscope we used to capture 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

See the above website for further details on sensor signal pre-processing if you are interested.

Variables from the Data Set
---------------------------

This section is taken directly from the **features_info.txt** file included with the original dataset found at the link above. 

"Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The mean value and std deviation were estimated from these signals and these are what we are interested in for our tidy dataset.

The Tidy Data
-------------

Each record in the original data set contained a 561 dimensional feature vector with time and frequency domain variables, as well as the subject's id, and a label indicated the activity they performed. I have extracted the variables containing the estimated mean and std deviation of the signals - giving a 68 dimensional feature vector (including subject id and activity label).

As mentioned, there are 30 subjects and 6 activities. The final Tidy Data Set contains the average of mean and stand deviation measures of these variables for each subject and activity. Thus, the tidy dataset has 180 records (30 subjects * 6 activities).
