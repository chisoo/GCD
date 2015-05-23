# Codebook

## Variable Description
* The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
  * TimeBodyAccelerationX
  * TimeBodyAccelerationY
  * TimeBodyAccelerationZ
  * TimeGravityAccelerationX
  * TimeGravityAccelerationY
  * TimeGravityAccelerationZ
* Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals
  * TimeBodyAccelerationJerkX
  * TimeBodyAccelerationJerkY
  * TimeBodyAccelerationJerkZ
  * TimeBodyGyroJerkX
  * TimeBodyGyroJerkY
  * TimeBodyGyroJerkZ
* Also, the magnitude of these three-dimentional signals were calculated using the Euclidean norm 
  * TimeBodyAccelerationMagnitude
  * TimeGravityAccelerationMagnitude
  * TimeBodyGyroMagnitude
  * TimeBodyGyroJerkMagnitude
* Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing the following:
  * FrequencyBodyAccelerationX
  * FrequencyBodyAccelerationY
  * FrequencyBodyAccelerationZ
  * FrequencyBodyAccelerationJerkX
  * FrequencyBodyAccelerationJerkY
  * FrequencyBodyAccelerationJerkZ
  * FrequencyBodyGyroX
  * FrequencyBodyGyroY
  * FrequencyBodyGyroZ
  * FrequencyBodyAccelerationJerkMagnitude
  * FrequencyBodyGyroMagnitude
  * FrequencyBodyGyroJerkMagnitude

* variables ending with 
  * "Mean": mean of the measure
  * "Std": standard deviation of the measure

## Tidy Data
* Tidy data contains the average 
  * of all mean and standard deviation of measurements 
  * for each activity and each subject
 
## Steps Taken for Tidy Data
* The following steps were taken to get the tidy data from the original data.
  * The training and test data sets were combined. 
  * Each record was labeled with the subject ID and activity code. 
  * The variables were labeled using "features".
  * Only the variables with "mean" and "std" in the name were kept.
  * Each activity was labeled using activity description. 
  * The variable names were updated to be more descriptive. 
  * Calculated the average of each variable for each activity and each subject.
