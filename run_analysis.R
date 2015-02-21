# 0. load sets
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)

# bind into single test and train tabes
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)

# 1. Merges the training and the test sets to create one data set.
ds <- rbind(test, train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# column numbers are offseted by 2 to account for subject and activity columns (also included in resulting dataset)
ds_means <- ds[, c(1, 2, 3, 4, 5, 6, 7, 8, 43, 44, 45, 46, 47, 48, 83, 84, 85, 86, 87, 88, 123, 124, 125, 126, 127, 128, 163, 164, 165, 166, 167, 168, 203, 204, 216, 217, 229, 230, 242, 243, 255, 256, 268, 269, 270, 271, 272, 273, 347, 348, 349, 350, 351, 352, 426, 427, 428, 429, 430, 431, 505, 506, 518, 519, 531, 532, 544, 545)]

# 3. Uses descriptive activity names to name the activities in the data set
ds_means[ds_means[, 2] == 1, 2] <- "WALKING"
ds_means[ds_means[, 2] == 2, 2] <- "WALKING_UPSTAIRS"
ds_means[ds_means[, 2] == 3, 2] <- "WALKING_DOWNSTAIRS"
ds_means[ds_means[, 2] == 4, 2] <- "SITTING"
ds_means[ds_means[, 2] == 5, 2] <- "STANDING"
ds_means[ds_means[, 2] == 6, 2] <- "LAYING"


# 4. Appropriately labels the data set with descriptive variable names. 
colnames(ds_means) <- c("subject", "activity", "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", "tBodyAcc_std_X", "tBodyAcc_std_Y", "tBodyAcc_std_Z", "tGravityAcc_mean_X", "tGravityAcc_mean_Y", "tGravityAcc_mean_Z", "tGravityAcc_std_X", "tGravityAcc_std_Y", "tGravityAcc_std_Z", "tBodyAccJerk_mean_X", "tBodyAccJerk_mean_Y", "tBodyAccJerk_mean_Z", "tBodyAccJerk_std_X", "tBodyAccJerk_std_Y", "tBodyAccJerk_std_Z", "tBodyGyro_mean_X", "tBodyGyro_mean_Y", "tBodyGyro_mean_Z", "tBodyGyro_std_X", "tBodyGyro_std_Y", "tBodyGyro_std_Z", "tBodyGyroJerk_mean_X", "tBodyGyroJerk_mean_Y", "tBodyGyroJerk_mean_Z", "tBodyGyroJerk_std_X", "tBodyGyroJerk_std_Y", "tBodyGyroJerk_std_Z", "tBodyAccMag_mean", "tBodyAccMag_std", "tGravityAccMag_mean", "tGravityAccMag_std", "tBodyAccJerkMag_mean", "tBodyAccJerkMag_std", "tBodyGyroMag_mean", "tBodyGyroMag_std", "tBodyGyroJerkMag_mean", "tBodyGyroJerkMag_std", "fBodyAcc_mean_X", "fBodyAcc_mean_Y", "fBodyAcc_mean_Z", "fBodyAcc_std_X", "fBodyAcc_std_Y", "fBodyAcc_std_Z", "fBodyAccJerk_mean_X", "fBodyAccJerk_mean_Y", "fBodyAccJerk_mean_Z", "fBodyAccJerk_std_X", "fBodyAccJerk_std_Y", "fBodyAccJerk_std_Z", "fBodyGyro_mean_X", "fBodyGyro_mean_Y", "fBodyGyro_mean_Z", "fBodyGyro_std_X", "fBodyGyro_std_Y", "fBodyGyro_std_Z", "fBodyAccMag_mean", "fBodyAccMag_std", "fBodyBodyAccJerkMag_mean", "fBodyBodyAccJerkMag_std", "fBodyBodyGyroMag_mean", "fBodyBodyGyroMag_std", "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag_std")

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# sqldf group by?
library(sqldf)
ds_avg <- sqldf("select subject, activity, avg(tBodyAcc_mean_X), avg(tBodyAcc_mean_Y), avg(tBodyAcc_mean_Z), avg(tBodyAcc_std_X), avg(tBodyAcc_std_Y), avg(tBodyAcc_std_Z), avg(tGravityAcc_mean_X), avg(tGravityAcc_mean_Y), avg(tGravityAcc_mean_Z), avg(tGravityAcc_std_X), avg(tGravityAcc_std_Y), avg(tGravityAcc_std_Z), avg(tBodyAccJerk_mean_X), avg(tBodyAccJerk_mean_Y), avg(tBodyAccJerk_mean_Z), avg(tBodyAccJerk_std_X), avg(tBodyAccJerk_std_Y), avg(tBodyAccJerk_std_Z), avg(tBodyGyro_mean_X), avg(tBodyGyro_mean_Y), avg(tBodyGyro_mean_Z), avg(tBodyGyro_std_X), avg(tBodyGyro_std_Y), avg(tBodyGyro_std_Z), avg(tBodyGyroJerk_mean_X), avg(tBodyGyroJerk_mean_Y), avg(tBodyGyroJerk_mean_Z), avg(tBodyGyroJerk_std_X), avg(tBodyGyroJerk_std_Y), avg(tBodyGyroJerk_std_Z), avg(tBodyAccMag_mean), avg(tBodyAccMag_std), avg(tGravityAccMag_mean), avg(tGravityAccMag_std), avg(tBodyAccJerkMag_mean), avg(tBodyAccJerkMag_std), avg(tBodyGyroMag_mean), avg(tBodyGyroMag_std), avg(tBodyGyroJerkMag_mean), avg(tBodyGyroJerkMag_std), avg(fBodyAcc_mean_X), avg(fBodyAcc_mean_Y), avg(fBodyAcc_mean_Z), avg(fBodyAcc_std_X), avg(fBodyAcc_std_Y), avg(fBodyAcc_std_Z), avg(fBodyAccJerk_mean_X), avg(fBodyAccJerk_mean_Y), avg(fBodyAccJerk_mean_Z), avg(fBodyAccJerk_std_X), avg(fBodyAccJerk_std_Y), avg(fBodyAccJerk_std_Z), avg(fBodyGyro_mean_X), avg(fBodyGyro_mean_Y), avg(fBodyGyro_mean_Z), avg(fBodyGyro_std_X), avg(fBodyGyro_std_Y), avg(fBodyGyro_std_Z), avg(fBodyAccMag_mean), avg(fBodyAccMag_std), avg(fBodyBodyAccJerkMag_mean), avg(fBodyBodyAccJerkMag_std), avg(fBodyBodyGyroMag_mean), avg(fBodyBodyGyroMag_std), avg(fBodyBodyGyroJerkMag_mean), avg(fBodyBodyGyroJerkMag_std) from ds_means group by subject, activity")

