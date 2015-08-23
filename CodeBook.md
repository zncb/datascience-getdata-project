Raw Data
--------

The original data from Human Activity Recognition Using Smartphones Dataset, see 'getdata_projectfiles_UCI HAR Dataset.zip'

This dataset contains accelerometer and gyroscope observation for 6 types of activities performed by 30 subjects.

Observations are split into two separate subsets, training and test and consist of 561-feature vectors, each with an activity label and a subject identifier.

See the README.txt and feature_info.txt files in the raw dataset for more details.


Analysis
--------

This analysis is only concerned with mean and standard deviation features. Its objective is to calculate the mean of these features with respect to each subject and activity performed, and format the result tidily.

As per the feature_info.txt file included with the raw data set, mean and standard deviation features are coded with 'mean' and 'std' in their names.

List of features selected:

	[1] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
	[3] "tBodyAcc-mean()-Z"               "tGravityAcc-mean()-X"           
	[5] "tGravityAcc-mean()-Y"            "tGravityAcc-mean()-Z"           
	[7] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
	[9] "tBodyAccJerk-mean()-Z"           "tBodyGyro-mean()-X"             
	[11] "tBodyGyro-mean()-Y"              "tBodyGyro-mean()-Z"             
	[13] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
	[15] "tBodyGyroJerk-mean()-Z"          "tBodyAccMag-mean()"             
	[17] "tGravityAccMag-mean()"           "tBodyAccJerkMag-mean()"         
	[19] "tBodyGyroMag-mean()"             "tBodyGyroJerkMag-mean()"        
	[21] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
	[23] "fBodyAcc-mean()-Z"               "fBodyAcc-meanFreq()-X"          
	[25] "fBodyAcc-meanFreq()-Y"           "fBodyAcc-meanFreq()-Z"          
	[27] "fBodyAccJerk-mean()-X"           "fBodyAccJerk-mean()-Y"          
	[29] "fBodyAccJerk-mean()-Z"           "fBodyAccJerk-meanFreq()-X"      
	[31] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
	[33] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
	[35] "fBodyGyro-mean()-Z"              "fBodyGyro-meanFreq()-X"         
	[37] "fBodyGyro-meanFreq()-Y"          "fBodyGyro-meanFreq()-Z"         
	[39] "fBodyAccMag-mean()"              "fBodyAccMag-meanFreq()"         
	[41] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-meanFreq()" 
	[43] "fBodyBodyGyroMag-mean()"         "fBodyBodyGyroMag-meanFreq()"    
	[45] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-meanFreq()"
	[47] "tBodyAcc-std()-X"                "tBodyAcc-std()-Y"               
	[49] "tBodyAcc-std()-Z"                "tGravityAcc-std()-X"            
	[51] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
	[53] "tBodyAccJerk-std()-X"            "tBodyAccJerk-std()-Y"           
	[55] "tBodyAccJerk-std()-Z"            "tBodyGyro-std()-X"              
	[57] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
	[59] "tBodyGyroJerk-std()-X"           "tBodyGyroJerk-std()-Y"          
	[61] "tBodyGyroJerk-std()-Z"           "tBodyAccMag-std()"              
	[63] "tGravityAccMag-std()"            "tBodyAccJerkMag-std()"          
	[65] "tBodyGyroMag-std()"              "tBodyGyroJerkMag-std()"         
	[67] "fBodyAcc-std()-X"                "fBodyAcc-std()-Y"               
	[69] "fBodyAcc-std()-Z"                "fBodyAccJerk-std()-X"           
	[71] "fBodyAccJerk-std()-Y"            "fBodyAccJerk-std()-Z"           
	[73] "fBodyGyro-std()-X"               "fBodyGyro-std()-Y"              
	[75] "fBodyGyro-std()-Z"               "fBodyAccMag-std()"              
	[77] "fBodyBodyAccJerkMag-std()"       "fBodyBodyGyroMag-std()"         
	[79] "fBodyBodyGyroJerkMag-std()"  

The 'run_analysis.R' scripts performs the following steps:

	* Feature names, activity labels and subject IDs are recombined with their respective test and training observations
	* All observations from both datasets are merged into a single data frame
	* Features of interest are selected from this combined data frame using the name coding rule above.
	* The mean value for each of these features is then calculated with respect to activity label and subject ID factors.
	* The results are compounded into a data frame with one row for each factor combination and the corresponding means for each feature.
	* This data frame is written to a csv file, and is also returned to the caller.
	
CodeBook
--------

The 'tidy_means.csv' file contains the result of the analysis outlined above.

It can be read back into R by running 'means_df <- read.csv("tidy_means.csv",row.names=1)'.

The first two columns of the data frame are the factors for which the means were calculated, the subject ID and the activity performed, respectively.

The following columns are the means for the selected features. These columns are named 'mean(x)' where x is the name of the original feature from the raw dataset.

