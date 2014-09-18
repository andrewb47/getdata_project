# new approach
# rbind() the two datasets to all_data_02
all_data_02 <- rbind(x_test, x_train)
# the column names to match all_data_02
colnames(all_data_02) <- as.character(features$V2)  # col heads on all_data_02
# rbind() subject and activity lists to match all_data_02
all_subject <- rbind(subject_test, subject_train)
all_activity <- rbind(y_test, y_train)
all_activity_desc <- activity_labels[all_activity, 2]
#
# build select_data with cbind() of "subject", "activity"
# then of the following columns of all_data_02
# 1:6, 41:46, 81:86, 121:126, 161:166, 
# 201:202, 214:215, 227:228, 240:241, 253:254
# 266:271, 345:350, 424:429, 503:504, 516:517,
# 529:530, 542:543
#
# the column numbers of all_data_02 comprising means 
mean_features <- grep("-mean()", features[,2], fixed = TRUE)
# the column numbers of all_data_02 comprising stds
std_features <- grep("-std()", features[,2], fixed = TRUE)
# concatenate and sort the selected (mean and std) features
select_features <- c(mean_features, std_features)
select_features_i <- sort(select_features)
#
# select the required (mean and std) data
mean_std_data <- all_data_02[ , select_features_i]
#
#
all_activity_desc <- c()
activity_labels_txt <- as.character(activity_labels[ , 2])
# all_activity_i <- as.numeric(all_activity)
i <- 1
for (i in 1 : nrow(all_data_02)) {
        j <- all_activity[i, 1]
        all_activity_desc[i] <- activity_labels_txt[j]
}

#
final_data <- cbind(all_subject, all_activity, all_activity_desc, mean_std_data)
#
names(final_data)[1:3] <- c("subject", "activity_code", "activity_label")
#
# sort by subject then by activity_code
final_data_sort_01 <- final_data[order(final_data$subject, final_data$activity_code),]
#
write.table(final_data_sort_01, file = "samsung_data.txt", row.names = FALSE)




