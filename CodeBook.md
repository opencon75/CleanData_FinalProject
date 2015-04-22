Code Book 
=========================================================================================================
The original data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals  were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

The file tidyData.txt contains the summarized averages for each field in the original data set in two dimensions time (prefix time) and frequency (prefix freq) grouped by activity and subject.

#### activityId
Id for the activity, merge with the activity_lab.txt file.

#### subjectId
Id for the subjet who made the test

#### timeBodyAccMagMean
Mean by activity and subject for the original variable

#### timeBodyAccMagStd
Mean by activity and subject for the Standard Deviation of the original variable

#### timeGravityAccMagMean
Mean by activity and subject for the original variable

#### timeGravityAccMagStd
Mean by activity and subject for the Standard Deviation of the original variable

#### timeBodyAccJerkMagMean
Mean by activity and subject for the original variable

#### timeBodyAccJerkMagStd
Mean by activity and subject for the Standard Deviation of the original variable

#### timeBodyGyroMagMean
Mean by activity and subject for the original variable

#### timeBodyGyroMagStd
Mean by activity and subject for the Standard Deviation of the original variable

#### timeBodyGyroJerkMagMean
Mean by activity and subject for the original variable

#### timeBodyGyroJerkMagStd
Mean by activity and subject for the Standard Deviation of the original variable

#### freqBodyAccMagMean
Mean by activity and subject for the original variable

#### freqBodyAccMagStd
Mean by activity and subject for the Standard Deviation of the original variable

#### freqBodyBodyAccJerkMagMean
Mean by activity and subject for the original variable

#### freqBodyBodyAccJerkMagStd
Mean by activity and subject for the Standard Deviation of the original variable

#### freqBodyBodyGyroMagMean
Mean by activity and subject for the original variable

#### freqBodyBodyGyroMagStd
Mean by activity and subject for the Standard Deviation of the original variable

#### freqBodyBodyGyroJerkMagMean
Mean by activity and subject for the original variable

#### freqBodyBodyGyroJerkMagStd
Mean by activity and subject for the Standard Deviation of the original variable
