## Reading data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Merging the training and the test sets to create one data set
merged.data <- merge(X_train, X_test, all=TRUE)

## Appropriately labeling the data set with descriptive variable names 
colnames(merged.data) <- features$V2

## Extracting only the measurements on the mean and standard deviation for each measurement
select.mean <- grepl("mean",features$V2)
select.std <- grepl("std",features$V2)

select <- select.mean | select.std  

extracted.data <- subset(merged.data, subset=TRUE, select=select)        
        
## Giving descriptive names to name the activities and subjects in the data set
labels_test <- Y_test$V1
for(i in 1:6){
        labels_test <- gsub(pattern=activity_labels$V1[i],
                            replacement=activity_labels$V2[i],
                            x=labels_test)
}        

labels_train <- Y_train$V1
for(i in 1:6){
        labels_train <- gsub(pattern=activity_labels$V1[i],
                             replacement=activity_labels$V2[i],
                             x=labels_train)
}  

merged.labels <- c(labels_train, labels_test)
merged.subjects <- merge(subject_train, subject_test, all=TRUE)

extracted.data <- cbind(extracted.data, activity=merged.labels, subject=merged.subjects$V1)

## Creating a second, independent tidy data set with the average of each variable 
## for each activity and each subject
library(dplyr)
new.data.tbl <-
        extracted.data %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

write.table(new.data.tbl, file="new.data.txt", row.name=FALSE)
