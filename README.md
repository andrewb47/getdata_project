## Coursera John Hopkins Getting and Cleaning Data Project
### Project Assignment Notes

This repo comprises the deliverables for an assignment that is part of the Coursera course 'Getting and Cleaning Data', one of a series of courses on
Data Science provided on Coursera.org by the John Hopkins Bloomberg School of Public Health.

The data for the project is in a set of files published by the International Workshop of Ambient Assisted Living. See the reference in the footnote.

A [Code Book] [codebook] is available specifying the original data and the processing done to create a tidy data set.
[codebook]: https://github.com/andrewb47/getdata_project/blob/master/CodeBook.md (Code Book)

#### 1. The R Scripts
There are two R scripts

- `run_analysis.R` does the required analysis of the data and provides a tidy data set of the selected data
- `averages.R` uses the results of the analysis and computes the required averages of specified data

This `README` describes the functions of the two scripts.
   
#### 2. The Analysis Script
The steps in the R script `run_analysis.R` are as follows. The section numbers are also used in the comments in the script.

##### 1. Read the data files from a local directory

Read the data files with   
```{r}
read.table("file_path_", header = FALSE)
```
using the file name to form the corresponding table name.
   
Read the files:   
```
        activity_labels.txt             to activity_labels
        features.txt                    to features
        ./test/subject_test.txt         to subject_test
        ./test/X_test.txt               to subject_train
        ./test/y_test.txt               to x_test
        ./train/subject_train.txt       to x_train
        ./train/X_train.txt             to y_test
        ./train/y_train.txt             to y_train
```
        
It is assumed that the files in the Inertial Signals directories are not required as they contain the raw data that has been filtered to create the x and y test and train tables. 

##### 2. Combine the test and training datasets to `all_data_02`
The raw data includes two data sets named `test` and `train`. These are each according to the same structure and are to be combined into one. This step merges the two main tables of data observations into table `all_data_02`.

##### 3. Form the column names on `all_data_02` from the `features` data
The names of the variables are available in the `features` table. This step extracts them and creates column headings on the data table.

##### 4. Reduce the columns of data in `all_data_02` 
The assignment requires only the mean and standard deviation of each measurement to be included in the tidy data set. This step selects them by selecting only the columns that have `"-mean()"` or `"-std()"` in the variable name in the column heading.

##### 5. Create descriptive data for the observations in `all_data_02`
The assignment requires descriptive activity names on the activities (each observation) in the data set. This step adds three columns to the left of the data set. 
- the subject code that identifies the person tested
- the activity code that identifies the activity tested 
- the activity name from the `activity_labels` data

##### 6. Sort the data by subject then by activity_code
To tidy the data further this step sorts the data set by subject code and then by activity code so that the observations for each subject and his/her measured activity appear consecutively in the table.

##### 7. Output the required table
The tidy data set is output in the file `samsung_data.txt` for submission as required by the assignment.

#### 3. The Averages Script

The script `averages.R` uses the tidy data set created by the `run_analysis.R` script so can only be run when the analysis results are available in memory.

The objective of the script is create a data set with the average of each variable for each activity and each subject. The layout of the new data set `averages` is similar to the data set created by the analysis script. There are three descriptive columns, subject, activity code and activity name followed by the 66 variables. Since there are 30 subjects who were each measured on six activities there are 180 rows with the averages of the individual observations.

An empty matrix `averages` with 180 rows and 69 columns is created with the same column names as used in the analysis results.

The `averages` matrix is filled row by row according to index `i`. Within a `for loop` by subject and a `for loop` by activity a work table is created of the observations per subject and activity. Within a further `for loop` the average of each variable is calculated and written to the appropriate cell in the `averages` matrix. The codes for subject and activity and the activity label are also written to the row.

The result is written to the file `averages.csv`.
   
   
= = footnote = = = = = = = = = = = = = = = =   
Dataset publication acknowledgement:   
Human Activity Recognition Using Smartphones Dataset   
Version 1.0   
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012