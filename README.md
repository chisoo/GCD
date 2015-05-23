# Getting-and-Cleaning-Data-Course-Project
This is created for the Getting and Cleaning Data course project.
* This repo contains
  * README file
  * R srcipt (run_analysis.R) used for the analysis
  * codebook
  * tidy data

* The original data for this project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* In order to run the R script on this repo, you should download the data from the link above, and unzip in the same folder as the R script in the subfolder named "UCI HAR Dataset". 

* The R script does the following:
  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement.
  * Uses descriptive activity names to name the activities in the data set.
  * Appropriately labels the data set with descriptive activity names.
  * Creates a second, independent tidy data set with the average of each variable for each activity and each subject. This data set is saved as "tidy data.txt."
