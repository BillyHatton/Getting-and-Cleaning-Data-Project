#William Hatton
#Code Book

The data used for the files in this repository come from Samsung phones and the measurements of movement they record.
Data was collected for 30 subjects and classified for 6 different activities.
The Activities are:
* Walking (1)
* Walking_Upstairs (2)
* Walking_Downstairs (3)
* Sitting (4)
* Standing (5)
* Laying (6)

The data used in the repo was a set of variables created by applying functions (mean, standard deviation, etc.) to the raw data.
The variables that are used correspond to the mean and standard deviations of each measurement.
The variables were renamed in the data to make them more readable and easier to understand. 
This is the name conversion for each variable:
* tBodyAcc-XYZ -> tBody_Acceleration-XYZ
* tGravityAcc-XYZ -> tGravity_Acceleration-XYZ
* tBodyAccJerk-XYZ -> tBody_Acceleration_Jerk-XYZ
* tBodyGyro-XYZ -> tBody_Gyro-XYZ
* tBodyGyroJerk-XYZ -> tBody_Gyro_Jerk-XYZ
* tBodyAccMag -> tBody_Acceleration_Magnitude
* tGravityAccMag -> tBody_Gravity_Acceleration_Magnitude
* tBodyAccJerkMag -> tBody_Acceleration_Jerk_Magnitude
* tBodyGyroMag -> tBody_Gyro_Magnitude
* tBodyGyroJerkMag -> tBody_Gyro_Jerk_Magnitude
* fBodyAcc-XYZ -> fBody_Acceleration-XYZ
* fBodyAccJerk-XYZ -> fBody_Acceleration_Jerk-XYZ
* fBodyGyro-XYZ -> fBody_Gyro-XYZ
* fBodyAccMag -> fBody_Acceleration_Magnitude
* fBodyAccJerkMag -> fBody_Acceleration_Jerk_Magnitude
* fBodyGyroMag -> fBody_Gyro_Magnitude

Each of the above conversions was done for mean and standard deviation, which is indicated at the end of the new name.
The t stands for time series and f stands for frequency domain signals.

To clean the data I simply used the grep() function in R to pull out the columns of the variables with mean and standard deviation in their name.
Then, to create the Tidy Data dataframe, I used the apply() function to take the mean of each variable column for each different subject and each activity.
