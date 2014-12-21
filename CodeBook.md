# Code Book

## Experimental design
As the raw data, I have taken the Human Activity Recognition Using Smartphones Data Set (UCI HAR Dataset) - Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  

Afterwards, I have built an R script `run_analysis.R` which cleans up the data and builds an independent tidy data set `new.data.txt` with the average of each variable for each activity and each subject.

## Raw data
As the raw data, I have taken the Human Activity Recognition Using Smartphones Data Set (see folder `UCI HAR Dataset`) which stores the data collected from the accelerometers from the Samsung Galaxy S II smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone on the waist. For more information, please read the original README file `UCI HAR Dataset/README.txt`.

## Processed data
I have built an R script `run_analysis.R` which cleans up the data and builds an independent tidy data set `new.data.txt` with the average of each variable for each activity and each subject. For more information on the process, please refer to the README file `README.md`.

## Variable names
The variables selected for this data set come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:   

mean: Mean value  
std: Standard deviation  

Each observation is a mean of a given variable, grouped by each subject (coded 1 to 30) and each activity (walking, walking upstairs, walking downstairs, sitting, standing, laying).
