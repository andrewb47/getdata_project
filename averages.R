################# 
# Title: Getting and Cleaning Data Course Project analysis 2
# Author: andrewb47
# Date:2014-09-20 
# Purpose: Following the run_analysis.R script and using its
#          output this script creates a data set comprising
#          the average of each variable for each activity
#          and each subject in accordance with step 5 of the
#          assignment
#################
#
#
s <- 1   # !!! are these needed
a <- 1   # !!! are these needed
# create a matrix for the result with the same columns
# as the final_data_sort_01 table
averages <- matrix(data = NA, nrow = 180, ncol = 69,)
colnames(averages) <- colnames(final_data_sort_01)
# for each subject and activity create a work_table
# of the data
i <- 1
for (s in 1:30) {
        for (a in 1:6) {
                work_table <- final_data_sort_01[(final_data_sort_01$subject == s 
                                & final_data_sort_01$activity_code == a),]
                #
                # for each data column in the work_table
                # calculate the average and write it to
                # the averages result table
                j <- 4
                for (j in 4:69) {
                        averages[i,j] <- mean(work_table[,j])       
                }
                # write the descriptive data for the row
                # of averages results
                averages[i,1] <- s
                averages[i,2] <- a
                averages[i,3] <- activity_labels_txt[a]
                i <- i+1
        }
}
#
# output the table of averages
write.csv(averages, file = "averages.csv", row.names = FALSE)