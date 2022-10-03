# clean-get-data-coursera

This a repository dedicated to the Getting and Cleaning Data Course Project. 

This repository contains : 
1) a tidy data set result of the analysis of the raw data by run_analysis.R called tidied.pdf.
2) a R script that gets and cleans up the data (it is the analysis) called run_analysis.R. 
3) a code book that describes the variables, the data (datatidy), and any transformations performed to clean up call CodeBook.md. 
4) This README.md that explains how all of the scripts work and how they are connected.

The CodeBook.md allows to understand the data and where it comes from. It is preferable to read it before the others documents.

The run_analysis.R R script :

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidied.pdf is the result of the cleaning of the raw data by run_analysis.R and corresponds to fifth objective described above.
