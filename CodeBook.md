The script run_analysis.R that does the following. 
  1.	Merges the training and the test sets to create one data set.
	2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
	3.	Uses descriptive activity names to name the activities in the data set
	4.	Appropriately labels the data set with descriptive activity names. 
	5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

 Preparation:
 - install required packages: assumed is that package reshape2 is installed
 - the dataset is assumed to be downloaded and unzipped to your local machine
 - set the working directory of R to the directory holding the datafiles 
   for example if you unzipped to ~/GettingAndCleaningData then this is also to be set as the working directory

script variables features Names of the 561 attributes activity Names of the 
6 activities vecCol Vector the index number linked to the features where TRUE means that the feature either has "mean" or "std" in the name

tst_x 561 attributen vector: test from test file tst_y Contains the activities performed from test file tst_sub Who performed the activities from test file tst Three test files merged into one data frame

trn_x 561 attributen vector: trn from train file trn_y Contains the activities performed from train file trn_sub Who performed the activities from train file trn Three train files merged into one data frame

tsttrn Merged tst and trn data frames

tidy Melted tsttrn data frame tidy2 Aggregated result dataset holding the means of the variables per subject and activity

Resulting data set: tidy2 Variables:

Activity Activity performed (by subject) Subject Identifier of person performing the activities