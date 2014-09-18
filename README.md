## Coursera John Hopkins Getting and Cleaning Data Project
### Project Assignment Notes
   
#### 1. Reading Files
Read the data files with   
```{r}
read.table("file_path_", header = FALSE)
```
   
Read the files:   
        activity_labels.txt             to activity_labels
        features.txt                    to features
        ./test/subject_test.txt         to subject_test
        ./test/X_test.txt               to subject_train
        ./test/y_test.txt               to x_test
        ./train/subject_train.txt       to x_train
        ./train/X_train.txt             to y_test
        ./train/y_train.txt             to y_train
        
Assuming that the files in the Inertial Signals directories are not required as they contain the raw data that has been filtered to create the x and y test and train tables. 

   
#### Next steps   
1. Map the relationships between tables
2. Work out merger strategy - eliminating the unwanted measurement types   
   
#### 2. Merging the data frames
First on x_test.
subject_test (persons tested) becomes column 1
y_test (activity identifier) becomes column 2
in all_test

Then on x_train
subject_train (persons tested) becomes column 1
y_train (activity identifier) becomes column 2
in all_train

Then all_test and all_train are combined vertically to form all_data.
   
Column labels are assembled from two literals and the features vector
and applied to all_data.

#### the sort task is next
   
   
= = = = = = = = = = = = = = = = = =   
Dataset publication acknowledgement:   
Human Activity Recognition Using Smartphones Dataset   
Version 1.0   
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012