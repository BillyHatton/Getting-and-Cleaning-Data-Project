## William Hatton
## The purpose of this script is to read in data from accelerometers and clean the data for only the values desired.

#Set the working directory from which to grab files.
setwd("C:/Users/C16William.Hatton/Documents/Math 378/R Stuff/UCI HAR Dataset")

#Read in all the data files needed to restore the original dataset.
SubjectTest = read.table("subject_test.txt")
SubjectTrain = read.table("subject_train.txt")
Xtest = read.table("X_test.txt")
Xtrain = read.table("X_train.txt")
Ytest = read.table("Y_test.txt")
Ytrain = read.table("Y_train.txt")
Features = read.table("features.txt")$V2
names(SubjectTest) = c("Subject")
names(SubjectTrain) = c("Subject")
names(Xtest) = Features
names(Xtrain) = Features
names(Ytest) = c("Activity")
names(Ytrain) = c("Activity")

#Merge data into one data frame
Merge1 = rbind(Xtest,Xtrain)
Merge2 = rbind(Ytest,Ytrain)
Merge3 = rbind(SubjectTest,SubjectTrain)
Merge4 = cbind(Merge3,Merge2)
AllData = cbind(Merge4,Merge1)

#Clean data to only include desired stats; all measurement means/standard deviations
MeanIndex = grep("mean()", names(AllData))
SDIndex = grep("std()", names(AllData))
WantedIndex = c(1,2,MeanIndex,SDIndex)
CleanData = AllData[,WantedIndex]
bad = grep("meanFreq()", names(CleanData))
CleanData = CleanData[,-bad]

# Assign descriptive activity names
WalkingIndex = grep("1", AllData$Activity)
CleanData$Activity[WalkingIndex] = "Walking"
WalkingUpIndex = grep("2", AllData$Activity)
CleanData$Activity[WalkingUpIndex] = "Walking_Upstairs"
WalkingDownIndex = grep("3", AllData$Activity)
CleanData$Activity[WalkingDownIndex] = "Walking_Downstairs"
SittingIndex = grep("4", AllData$Activity)
CleanData$Activity[SittingIndex] = "Sitting"
StandingIndex = grep("5", AllData$Activity)
CleanData$Activity[StandingIndex] = "Standing"
LayingIndex = grep("6", AllData$Activity)
CleanData$Activity[LayingIndex] = "Laying"

# Assign descriptive variable names (t means time and f means frequency domain signals)
names(CleanData) = gsub("tBodyAcc-mean()", "tBody_Acceleration_Mean",names(CleanData))
names(CleanData) = gsub("tGravityAcc-mean()", "tGravity_Acceleration_Mean",names(CleanData))
names(CleanData) = gsub("tBodyAccJerk-mean()", "tBody_Jerk_Mean",names(CleanData))
names(CleanData) = gsub("tBodyGyro-mean()", "tBody_Gyro_Mean",names(CleanData))
names(CleanData) = gsub("tBodyGyroJerk-mean()", "tBody_Gyro_Jerk_Mean",names(CleanData))
names(CleanData) = gsub("tBodyAccMag-mean()", "tBody_Acceleration_Magnitude_Mean",names(CleanData))
names(CleanData) = gsub("tGravityAccMag-mean()", "tGravity_Acceleration_Magnitude_Mean",names(CleanData))
names(CleanData) = gsub("tBodyAccJerkMag-mean()", "tBody_Acceleration_Jerk_Magnitude_Mean",names(CleanData))
names(CleanData) = gsub("tBodyGyroMag-mean()", "tBody_Gyro_Magnitude_Mean",names(CleanData))
names(CleanData) = gsub("tBodyGyroJerkMag-mean()", "tBody_Gyro_Jerk_Magnitude_Mean",names(CleanData))
names(CleanData) = gsub("tGravityAccMag-mean()", "tGravity_Acceleration_Magnitude_Mean",names(CleanData))
names(CleanData) = gsub("fBodyAcc-mean()", "fBody_Acceleration_Mean",names(CleanData))
names(CleanData) = gsub("fBodyAccJerk-mean()", "fBody_Acceleration_Jerk_Mean",names(CleanData))
names(CleanData) = gsub("fBodyGyro-mean()", "fBody_Gyro_Mean",names(CleanData))
names(CleanData) = gsub("fBodyAccMag-mean()", "fBody_Acceleration_Magnitude_Mean",names(CleanData))
names(CleanData) = gsub("fBodyBodyAccJerkMag-mean()", "fBody_Acceleration_Jerk_Magnitude_Mean",names(CleanData))
names(CleanData) = gsub("fBodyBodyGyroMag-mean()", "fBody_Gyro_Magnitude_Mean",names(CleanData))
names(CleanData) = gsub("fBodyBodyGyroJerkMag-mean()", "fBody_Gyro_Jerk_Magnitude_Mean",names(CleanData))
# Now for standard deviation
names(CleanData) = gsub("tBodyAcc-std()", "tBody_Acceleration_StandardDeviation",names(CleanData))
names(CleanData) = gsub("tGravityAcc-std()", "tGravity_Acceleration_StandardDeviation",names(CleanData))
names(CleanData) = gsub("tBodyAccJerk-std()", "tBody_Jerk_StandardDeviation",names(CleanData))
names(CleanData) = gsub("tBodyGyro-std()", "tBody_Gyro_StandardDeviation",names(CleanData))
names(CleanData) = gsub("tBodyGyroJerk-std()", "tBody_Gyro_Jerk_StandardDeviation",names(CleanData))
names(CleanData) = gsub("tBodyAccMag-std()", "tBody_Acceleration_Magnitude_StandardDeviation",names(CleanData))
names(CleanData) = gsub("tGravityAccMag-std()", "tGravity_Acceleration_Magnitude_StandardDeviation",names(CleanData))
names(CleanData) = gsub("tBodyAccJerkMag-std()", "tBody_Acceleration_Jerk_Magnitude_StandardDeviation",names(CleanData))
names(CleanData) = gsub("tBodyGyroMag-std()", "tBody_Gyro_Magnitude_StandardDeviation",names(CleanData))
names(CleanData) = gsub("tBodyGyroJerkMag-std()", "tBody_Gyro_Jerk_Magnitude_StandardDeviation",names(CleanData))
names(CleanData) = gsub("tGravityAccMag-std()", "tGravity_Acceleration_Magnitude_StandardDeviation",names(CleanData))
names(CleanData) = gsub("fBodyAcc-std()", "fBody_Acceleration_StandardDeviation",names(CleanData))
names(CleanData) = gsub("fBodyAccJerk-std()", "fBody_Acceleration_Jerk_StandardDeviation",names(CleanData))
names(CleanData) = gsub("fBodyGyro-std()", "fBody_Gyro_StandardDeviation",names(CleanData))
names(CleanData) = gsub("fBodyAccMag-std()", "fBody_Acceleration_Magnitude_StandardDeviation",names(CleanData))
names(CleanData) = gsub("fBodyBodyAccJerkMag-std()", "fBody_Acceleration_Jerk_Magnitude_StandardDeviation",names(CleanData))
names(CleanData) = gsub("fBodyBodyGyroMag-std()", "fBody_Gyro_Magnitude_StandardDeviation",names(CleanData))
names(CleanData) = gsub("fBodyBodyGyroJerkMag-std()", "fBody_Gyro_Jerk_Magnitude_StandardDeviation",names(CleanData))

#Get tidy dataset
Acts = unique(CleanData$Activity) #Vector of the activities
People = unique(CleanData$Subject) #Vector of the subjects
TidyData = c()
for(ii in 1:30){
  for(jj in 1:6){
    WantedData = subset(CleanData, Subject == People[ii] & Activity == Acts[jj])
    x = apply(WantedData[3:68],2,mean)
    MeanVector = c("Subject" = People[ii],"Activity" = Acts[jj],x)
    TidyData = rbind(TidyData,MeanVector) #Stack each vector of variable means
  } 
}

#Output tidy data to text file
write.table(TidyData,file = "Tidy Data.txt", row.name = FALSE)
