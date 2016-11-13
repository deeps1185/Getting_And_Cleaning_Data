rm(list=ls())

#########################################################################################################
############ Task 1: Merges the training and the test sets to create one data set.           ############
#########################################################################################################
## Read Data from test files
feature_test_data <-  read.table("UCI\ HAR\ Dataset/test/X_test.txt", header = FALSE)
activity_test_data <-  read.table("UCI\ HAR\ Dataset/test/y_test.txt", header = FALSE)
subject_test_data  <-  read.table("UCI\ HAR\ Dataset/test/subject_test.txt", header = FALSE)
## Combine feature, activity and subject data for test set
test_data <- feature_test_data
test_data[, 562] <- activity_test_data
test_data[, 563] <- subject_test_data

## Read Data from training files
feature_train_data <-  read.table("UCI\ HAR\ Dataset/train/X_train.txt", header = FALSE)
activity_train_data <-  read.table("UCI\ HAR\ Dataset/train/y_train.txt", header = FALSE)
subject_train_data  <-  read.table("UCI\ HAR\ Dataset/train/subject_train.txt", header = FALSE)
## Combine feature, activity and subject data for training set
train_data <- feature_train_data
train_data[, 562] <- activity_train_data
train_data[, 563] <- subject_train_data

## Merged Data
merged_data = rbind(train_data, test_data)
## Read names of the features
feature_names <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
colnames(merged_data) <- c(paste(feature_names$V2), "activity", "subject")
#########################################################################################################

#########################################################################################################
############ Task 4: Appropriately labels the data set with descriptive variable names.      ############
#########################################################################################################

## Read names of the features
feature_names <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
colnames(merged_data) <- c(paste(feature_names$V2), "activity", "subject")
#########################################################################################################


#########################################################################################################
#### Task 2: Extracts only the measurements on the mean and standard deviation for each measurement. ####
#########################################################################################################

## Extract columns with "mean()" and "stde()"
# Get the indices of the columns that contain the string "mean()"
mean_inds <- grep("mean()",feature_names[,2], fixed=TRUE)
# Get the indices of the columns that contain the string "std()"
std_inds <- grep("std()",feature_names[,2], fixed=TRUE)
ms_inds <- c(mean_inds, std_inds)

#### Extract mean and std from merged data
## The data is stored in mean_std_md
## The subject and activity IDs are also added in the last two columns
ms_md = merged_data[, c(ms_inds, 562, 563)] 
## The labels for the mean data are stored in mean_labels
ms_labels <- feature_names[ms_inds, ]
colnames(ms_md) <- c(paste(ms_labels$V2), "activity", "subject")

#########################################################################################################
############ Task 3: Uses descriptive activity names to name the activities in the data set  ############
#########################################################################################################
activity_labels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
ct1 = 1 ## Counter
for (ct1_Label in activity_labels$V2) {
  ms_md$activity <- gsub(ct1, ct1_Label, ms_md$activity)
  ct1 <- ct1 + 1
}
#########################################################################################################


#########################################################################################################
##### Task 5: From the data set in step 4, creates a second, independent tidy data set with the     #####
##### average of each variable for each activity and each subject.                                  #####
#########################################################################################################
ms_md$activity <- as.factor(ms_md$activity)
ms_md$subject <- as.factor(ms_md$subject)
tidy_ms_md = aggregate(ms_md, by=list(activity = ms_md$activity, subject=ms_md$subject), mean)
## The last two columns are redundant
tidy_ms_md[,70] = NULL
tidy_ms_md[,69] = NULL
write.table(tidy_ms_md, "tidy_merged_data.txt", sep="\t")
