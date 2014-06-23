Course Project
============================================
This is a course project for Getting and cleaning data course in Coursera.

Goal was to write a script that creates a tidy dataset [1].

Information about the dataset [2]: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

run_analysis.R
--------------
 
The script merges the training and test sets to a one data set.

It then extracts the measurements that are mean and standard deviations of each measurement.

The column names were added to describe the measured variables. 

Finally a second, independent tidy data set was created. It includes the average of each selected variable for each activity and each subject. 

The activity codes were changed into names that describe the activities in the data set (e.g. "standing").


Data used:
----------------

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.


The following files were available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


References:
--------------------

[1] Wicham, H. (under review?). Tidy Data. Journal of Statistical Software.

[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
