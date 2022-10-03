# downloading the files

setwd("~/Data analysis/Getting_cleaning_data/data")
download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "~/Data analysis/Getting_cleaning_data/data")
unzip("UCI_HAR.zip", list = TRUE)

library("readr")
library("purrr")

###########Merges the training and the test sets to create one data set.

#reading data and creating test dataset 

x_test<- read.table(file = "C:/Users/DELL/Documents/Data analysis/Getting_cleaning_data/data/UCI HAR dataset/test/X_test.txt")
y_test <- read.table("C:/Users/DELL/Documents/Data analysis/Getting_cleaning_data/data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/DELL/Documents/Data analysis/Getting_cleaning_data/data/UCI HAR Dataset/test/subject_test.txt")
df_test <- data.frame(subject_test,y_test,x_test)

#reading date and creating train dataset 

x_train<- read.table(file = "C:/Users/DELL/Documents/Data analysis/Getting_cleaning_data/data/UCI HAR dataset/train/X_train.txt")
y_train <- read.table("C:/Users/DELL/Documents/Data analysis/Getting_cleaning_data/data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("C:/Users/DELL/Documents/Data analysis/Getting_cleaning_data/data/UCI HAR Dataset/train/subject_train.txt")
df_train <- data.frame(subject_train,y_train,x_train)

#renaming columns 

features_names <- read.table("C:/Users/DELL/Documents/Data analysis/Getting_cleaning_data/data/UCI HAR dataset/features.txt")
names(df_test) <- c("Subject","Activity",c(features_names$V2))
names(df_train) <- c("Subject","Activity",c(features_names$V2))

#merging train and test datasets to create one

mergeddf <- rbind(df_test,df_train)

###########Extracts only the measurements on the mean and standard deviation for each measurement. 

library(dplyr)
mean_data = mergeddf %>% select(contains("mean()"))
std_data = mergeddf %>% select(contains("std"))
data = cbind(mergeddf[1], mergeddf[2], mean_data,std_data)

###########Uses descriptive activity names to name the activities in the data set

#download activities names

act_labels <- read.table("C:/Users/DELL/Documents/Data analysis/Getting_cleaning_data/data/UCI HAR dataset/activity_labels.txt")

#changing activities names 

for (i in (1:6)) {
        data[2]=gsub("i",act_labels$V2[i],data[2])
}

data[,2] = gsub("1",act_labels$V2[1],data[,2])
data[,2] = gsub("2",act_labels$V2[2],data[,2])
data[,2] = gsub("3",act_labels$V2[3],data[,2])
data[,2] = gsub("4",act_labels$V2[4],data[,2])
data[,2] = gsub("5",act_labels$V2[5],data[,2])
data[,2] = gsub("6",act_labels$V2[6],data[,2])

########### Appropriately labels the data set with descriptive variable names. 

# previously done at # renaming columns

########### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
tidied=aggregate(.~Activity+Subject, data, mean)

#names of the columns regarding measurements on the mean and standard deviation 

namesms=c(names(data))
varms= namesms[-2]
varms=varms[-1]

#rename columns of the tidy data set with human readable names

meannames = paste0("Mean-",varms)
names(tidied) = (c("Activity","Subject",c(meannames)))
head(tidied)
