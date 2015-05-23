library(dplyr)

##############################
## step 1. Merges the training and the test sets to create one data set 
##############################

# read in train data 
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("activity_code"))

# read in test data 
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("activity_code"))

# read in labels
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity_code", "activity_desc"))

# combine the training and the test 
train_test_data <- rbind(train_data, test_data)

# label the columns
train_test_name <- as.character(features[, 2])
names(train_test_data) <- train_test_name

# create a subject column
train_test_subject <- rbind(train_subject, test_subject)
names(train_test_subject) <- "Subject"

##############################
## 2. Extracts only the measurements on the mean and standard deviation 
### for each measurement. 
##############################
mean_var <- grep("mean\\(", train_test_name)
std_var <- grep("std\\(", train_test_name)
mean_std_var <- c(mean_var, std_var)
train_test_mean_std <- train_test_data[, mean_std_var]

# combine mean/std data and a subject column
train_test <- cbind(train_test_mean_std, train_test_subject)

##############################
## 3. Uses descriptive activity names to name the activities in the data set
##############################

# label train/test activities
train_activity_labeled <- merge(train_activity, activity_labels, by = "activity_code") 
test_activity_labeled <- merge(test_activity, activity_labels, by = "activity_code")

# combine labeled train and test activities
train_test_activity_labeled <- rbind(train_activity_labeled, test_activity_labeled)

# add the column labeling train and test activities
train_test_labeled <- cbind(train_test, train_test_activity_labeled)

##############################
## 4. Appropriately labels the data set with descriptive activity names. 
##############################
var_names <- colnames(train_test_labeled)

# make "t" as "Time"
var_names <- gsub("tBody", var_names, replacement = "TimeBody")
var_names <- gsub("tGravity", var_names, replacement = "TimeGravity")

# make "f" as "Frequency"
var_names <- gsub("fBody", var_names, replacement = "FrequencyBody")
var_names <- gsub("fGravity", var_names, replacement = "FrequencyGravity")

# make "Acc" as "Acceleration"
var_names <- gsub("Acc", var_names, replacement = "Acceleration")

# make "Mag" as "Magnitude"
var_names <- gsub("Mag", var_names, replacement = "Magnitude")

# remove parentheses
var_names <- gsub("[()]", "", var_names)

# make -mean- & -std- as "Mean" and "Std"
var_names <- gsub("-mean-", var_names, replacement = "Mean")
var_names <- gsub("-mean", var_names, replacement = "Mean")
var_names <- gsub("-std-", var_names, replacement = "Std")
var_names <- gsub("-std", var_names, replacement = "Std")

# put X, Y, Z before Mean & Std
var_names <- gsub("MeanX", var_names, replacement = "XMean")
var_names <- gsub("MeanY", var_names, replacement = "YMean")
var_names <- gsub("MeanZ", var_names, replacement = "ZMean")

var_names <- gsub("StdX", var_names, replacement = "XStd")
var_names <- gsub("StdY", var_names, replacement = "YStd")
var_names <- gsub("StdZ", var_names, replacement = "ZStd")

# rename activity_code & activity_desc to follow the naming convention
var_names <- gsub("activity", var_names, replacement = "Activity")
var_names <- gsub("_code", var_names, replacement = "Code")
var_names <- gsub("_desc", var_names, replacement = "Description")

# assign the cleaned names
names(train_test_labeled) <- var_names

##############################
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##############################

# create a new data frame train_test_mean to save average of each variable 
## for each activity and each subject
tidy_data <- train_test_labeled %>% group_by (Subject, ActivityDescription) %>% summarise_each(funs(mean))

write.table(tidy_data, "tidy_data.txt", row.name = FALSE)