## Coursera John Hopkins Getting and Cleaning Data Project
### Project Assignment Notes

This repo comprises the deliverables for an assignment that is part of the Coursera course 'Getting and Cleaning Data', one of a series of courses on
Data Science provided on Coursera.org by the John Hopkins Bloomberg School of Public Health.

The data for the project is in a set of files published by the International Workshop of Ambient Assisted Living. See the reference in the footnote.

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
to the mean and standard deviation of each measurement
##### 5. Create descriptive data for the observations in `all_data_02`
from subject and activity data
##### 6. Sort the data by subject then by activity_code
##### 7. Output the required table

#### 3. The Averages Script

   
   
= = = = = = = = = = = = = = = = = =   
Dataset publication acknowledgement:   
Human Activity Recognition Using Smartphones Dataset   
Version 1.0   
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012