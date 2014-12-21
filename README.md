# README

## Introduction
The code book file `CodeBook.md` contains a general description of the raw data set, the processing done and variable names. This README focuses on how the analysis script `run_analysis.R` works and zooms in on some of the processing details.

## Description of the analysis script
### Reading data
The first part is reading the data from UCI HAR Dataset: test group set, training group set, as well as features, activity labels, and other relevant information we need for cleaning the data.

### Merging the training and the test sets to create one data set
The second part is merging two data sets into one with `merge()` function. The new set called `merged.data` has 10299 observations of 561 variables.

### Appropriately labeling the data set with descriptive variable names 
The third part is using `features` data to assign the descriptive variable names to the `merged.data` data set. For more information on the original variable names, please refer to the file `UCI HAR Dataset/features_info.txt`.

### Extracting only the measurements on the mean and standard deviation for each measurement
Our new tidy data set requires only the measurements of the mean (mean) and standard deviation (std), so the fourth part is to extract only those measuremebts with `grepl()` and subsequently with `subset()` functions.  

That gives us a new data set `extracted.data` with dimensions of 10299 observations of 79 variables.

### Giving descriptive names to name the activities and subjects in the data set
It can be seen from the `CodeBook.md` that there were 30 subjects participating, and they performed 6 various activities (walking, standing, laying, sitting, walking upstairs, walking upstairs). In the fifth part, I used various functions to extract, merge, and eventually column bind activity labels and subject codes to our `extracted.data` data set. Now, `extracted.data` has dimensions of 10299 observations of 81 variables.

### Creating a second, independent tidy data set with the average of each variable for each activity and each subject
In this final step, I used `dplyr` package to create a new tidy data set. I took our `extracted.data` data set, grouped it by subject and by activity, and applied `mean()` function to each variable. This gave me a new data set `new.data.tbl` with dimensions of 180 observations of 81 variables.  

Subsequently, I used the function `write.table()` to write the new data set `new.data.tbl` into a .txt file `new.data.txt`. 

## Reading in the new tidy data set
To read into R our new independent tidy data set `new.data.txt` with the average of each variable for each activity and each subject, it is advised to use the following function:

```r
data <- read.table("new.data.txt", header = TRUE) 
```
