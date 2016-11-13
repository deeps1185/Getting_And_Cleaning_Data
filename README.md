Course Project for DataScience Course: Getting and Cleaning Data
========================

This repository contains my files for the week 4 programming homework for the COURSERA course.

## Description of the raw data
The raw data is obrained from "Human Activity Recognition Using Smartphones Data Set" (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

- Two files contain the relevant data - x_train.txt and x_test.txt
- Each of these files contains  data corresponding to 561 features, the variable names for these are contained in the file features.txt.
- Also, the subject IDs are in subject_train.txt and subject_test.txt, respectively.
- The activity IDs are listed in y_train.txt and y_test.txt, respectively.
- The activity labels can be found in activity_labels.txt

## Description of analyses

I have uploaded the file `Clean_test_dat.R`, which contains the script for performing the following tasks
- Extracts and Merges the training and the test sets to create one data set called `merged_data` (Task 1).
- Appropriately labels the `merged_data` data-set with descriptive variable names found in `features.txt` (Task 4).
- Extracts only the measurements on the mean and standard deviation for each measurement and puts this data in the variable `ms_md` (Task 2).
- Uses descriptive activity names to name the activities in the data set `ms_md`. The descriptive activity names are obtained from the file `activity_lables.txt` (Task 3).
- Using the `ms_md` data-set, the script creates a second, independent tidy data set `tidy_ms_md` with the average of each variable for each activity and each subject. (Task 5) 
- This tidy data set is written in the text file `tidy_merged_data.txt`.

## Files in this Repository

- `README.md`: Explains the data-set and the R script.
- `Codebook.md`: Modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information
- `Clean_test_data.R` - R script for performing the tasks listed in **Description of analyses**
- `tidy_merged_data.txt` - Text file containing the tidy data.

