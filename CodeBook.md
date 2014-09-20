# Code Book
## Coursera John Hopkins Getting and Cleaning Data Project
### Data Dictionary
#### Introduction

The source data is Human Activity Recognition Using Smartphones Dataset Version 1.0. This document modifies and updates the codebook information provided with the original data and defines the variables used, summaries, other processing and any other relevant information about the data.

A description of the working of the R scripts is provided in the [README] [readme]. The [Original README] [iwaal] provided with the source data is provided for reference. Relevant data from it is included in this document.

#### The original data
The experiments were carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The captured dataset was randomly partitioned into two sets, where 70% of the volunteers was selected
for generating the training data and 30% the test data.

For each record the following is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

Note:
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row (observation) in the data file.

#### The data sets used
The following files in the original data were used:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

The [features_info] [feat_info] file from the original data which describes the features variables is provided.

#### Processing of the data 
The allocation of subjects to the test or training data sets was arbitrary. There is therefore no objection to combining the datasets. The data in `X_test.txt`, comprising 2,947 observations of 561 variables, was combined with the data in `X_train.txt`, comprising 7,352 observations of the same 561 variables.

The list of features in `features.txt` was used to provide column names for the 561 variables. The column names were then used to select the mean and standard deviation variables required by the assignment.

The data from `subject_test.txt` and `subject_train.txt` were combined, as were the data from `y_test.txt` and `y_train.txt`. These were then used along with the data from `activity_labels.txt` to provide descriptive data for each observation in the combined 'X' data set.

The combined 'X' data set was then sorted by by subject and activity.



[readme]: https://github.com/andrewb47/getdata_project/blob/master/README.md
[iwaal]: https://github.com/andrewb47/getdata_project/blob/master/IWAAL_README.pdf
[feat_info]: https://github.com/andrewb47/getdata_project/blob/master/features_info.md

= = footnote = = = = = = = = = = = = = = = =   
Dataset publication acknowledgement:   
Human Activity Recognition Using Smartphones Dataset   
Version 1.0   
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012