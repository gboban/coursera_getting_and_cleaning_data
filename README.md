# www.coursera.org
## Getting and Cleaning Data course project

* Script run_analysis.R loads and proccesses data from Samsungs "Human Activity Recognition Using Smartphones Data Set" (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) as described in Coursera "Getting and Cleaning data" course project.
* Script merges test and training data sets into single data set, extracts columns containing mean and standard deviations of measurements into separate data set and combine with data about participants and activity types for which measurement are made. Finally, script groups data by subject and activity and calculates average for each column containing measurements.

* To use script, you should place it in your working directory (see getwd() and setwd() functions in R), then download zip file containing data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract it inside Your working directory.

* Your working directory should contain:
run_analysis.R - script
UCI HAR Dataset/ - directory with extracted data from the above zip file.

* Output of analysis is saved into "ds_avg.txt" file and kept inside ds_avg vriable in R environment.

* To run script, open it in Rstudio and run it.

* For explanation of output file structure (columns), please refer to CodeBook.md
