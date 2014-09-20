################# 
# Title: Getting and Cleaning Data Course Project analysis
# Author: andrewb47
# Date:2014-09-20 
# Purpose: Reading data about human movement collected from a 
#          smartphone as published by IWAAL Spain.
#          Data is selected and provided in a tidy table for  
#          analysis in accordance with the assignment.
#################
#
# 1. Read the data files from a local directory
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)  
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
#
# 2. Combine the test and training datasets to all_data_02
all_data_02 <- rbind(x_test, x_train)
#
# 3. Form the column names on all_data_02 from the features data
colnames(all_data_02) <- as.character(features$V2)  
#
# 4. Reduce the columns of data in all_data_02 to the
#    mean and standard deviation of each measurement
#
# the column numbers of all_data_02 comprising means 
mean_features <- grep("-mean()", features[,2], fixed = TRUE)
#
# the column numbers of all_data_02 comprising stds
std_features <- grep("-std()", features[,2], fixed = TRUE)
#
# concatenate and sort the selected (mean and std) features
select_features <- c(mean_features, std_features)
select_features_i <- sort(select_features)
#
# select the required (mean and std) data
mean_std_data <- all_data_02[ , select_features_i]
#
# 5. Create descriptive data for the observations in all_data_02
#    from subject and activity data
#
# combine subject data from test and training files
all_subject <- rbind(subject_test, subject_train)
#
# combine activity data from test and training files
all_activity <- rbind(y_test, y_train)
#
# create vector of activity labels matching the vector
# of activity codes in all_activity
all_activity_desc <- c()
activity_labels_txt <- as.character(activity_labels[ , 2])
# all_activity_i <- as.numeric(all_activity)
i <- 1
for (i in 1 : nrow(all_data_02)) {
        j <- all_activity[i, 1]
        all_activity_desc[i] <- activity_labels_txt[j]
}
#
# combine the descriptive columns for the observations with
# the mean and std data
final_data <- cbind(all_subject, all_activity, all_activity_desc, 
                    mean_std_data)
#
# add column names for the descriptive data
names(final_data)[1:3] <- c("subject", "activity_code", "activity_label")
#
# 6. Sort the data by subject then by activity_code
final_data_sort_01 <- final_data[order(final_data$subject, final_data$activity_code),]
#
# 7. Output the required table
write.table(final_data_sort_01, file = "samsung_data.txt", row.names = FALSE)