#CodeBook for the Tidy dataset
##Data source
The source data files in the data directory are obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files were extracted from the zip archive and placed in the data directory with
no changes.

##Data Transformation Method
The source data sets includes a large set of variables; for the purposes of this
project only a subset of variables was selected. Specifically, the output dataset
includes only mean and standard deviation measurements from the test and training
data files. 

The following data transformation takes place in the program:
1. x-variables data file (either from the "train" or "test" files) is loaded.
2. Measurement variable names are assigned from the "features" data file.
3. Measurements (variables) not needed for the analysis (e.g. everything other than
the mean and standard deviation variables) are removed.
4. Activity labels are applied to the y data frame.
5. The "subject" label is applied to the "Subject" data frame.
6. Subject, X, and Y variables are combined into one table.
7. The process is repeated for "train"/"test" set of files, resulting in two data frames.
8. Training and test data frames are combined into one and melted for analysis.
9. Average for each measurement by subject and activity are calculated.
10. The resulting data frame is exported into a tab-delimited text file 'tidy.txt'.

##Program Structure
The R program was build to emphasize code re-use and extensibility. Consequently, 
all atomic operations and manipulations on data are encapsulated in a set of 
reusable functions. 

Specifically, data transformations required to load the test and training data files  
and build an R data frame are identical. As a result, a single function 'getData()', 
which accepts either "test" or "train" parameter, is used to prepare a relevant 
data frame.

This makes the main program flow very simple:
1. Verify dependencies.
2. Prepare the tidied up dataset (this internally calls all required logic to load,
label, and combine functions).
3. Write the result to the output file.

##Output Data
Below is the detailed listing of the output measurements. For detailed discussion of
each variable, please refer to:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

"tBodyAcc-mean()-X"               
"tBodyAcc-mean()-Y"              
"tBodyAcc-mean()-Z"               
"tBodyAcc-std()-X"               
"tBodyAcc-std()-Y"                
"tBodyAcc-std()-Z"               
"tGravityAcc-mean()-X"            
"tGravityAcc-mean()-Y"           
"tGravityAcc-mean()-Z"            
"tGravityAcc-std()-X"            
"tGravityAcc-std()-Y"             
"tGravityAcc-std()-Z"            
"tBodyAccJerk-mean()-X"           
"tBodyAccJerk-mean()-Y"          
"tBodyAccJerk-mean()-Z"           
"tBodyAccJerk-std()-X"           
"tBodyAccJerk-std()-Y"            
"tBodyAccJerk-std()-Z"           
"tBodyGyro-mean()-X"              
"tBodyGyro-mean()-Y"             
"tBodyGyro-mean()-Z"              
"tBodyGyro-std()-X"              
"tBodyGyro-std()-Y"               
"tBodyGyro-std()-Z"              
"tBodyGyroJerk-mean()-X"          
"tBodyGyroJerk-mean()-Y"         
"tBodyGyroJerk-mean()-Z"          
"tBodyGyroJerk-std()-X"          
"tBodyGyroJerk-std()-Y"           
"tBodyGyroJerk-std()-Z"          
"tBodyAccMag-mean()"              
"tBodyAccMag-std()"              
"tGravityAccMag-mean()"           
"tGravityAccMag-std()"           
"tBodyAccJerkMag-mean()"          
"tBodyAccJerkMag-std()"          
"tBodyGyroMag-mean()"             
"tBodyGyroMag-std()"             
"tBodyGyroJerkMag-mean()"         
"tBodyGyroJerkMag-std()"         
"fBodyAcc-mean()-X"               
"fBodyAcc-mean()-Y"              
"fBodyAcc-mean()-Z"               
"fBodyAcc-std()-X"               
"fBodyAcc-std()-Y"                
"fBodyAcc-std()-Z"               
"fBodyAcc-meanFreq()-X"           
"fBodyAcc-meanFreq()-Y"          
"fBodyAcc-meanFreq()-Z"           
"fBodyAccJerk-mean()-X"          
"fBodyAccJerk-mean()-Y"           
"fBodyAccJerk-mean()-Z"          
"fBodyAccJerk-std()-X"            
"fBodyAccJerk-std()-Y"           
"fBodyAccJerk-std()-Z"            
"fBodyAccJerk-meanFreq()-X"      
"fBodyAccJerk-meanFreq()-Y"       
"fBodyAccJerk-meanFreq()-Z"      
"fBodyGyro-mean()-X"              
"fBodyGyro-mean()-Y"             
"fBodyGyro-mean()-Z"              
"fBodyGyro-std()-X"              
"fBodyGyro-std()-Y"               
"fBodyGyro-std()-Z"              
"fBodyGyro-meanFreq()-X"          
"fBodyGyro-meanFreq()-Y"         
"fBodyGyro-meanFreq()-Z"          
"fBodyAccMag-mean()"             
"fBodyAccMag-std()"               
"fBodyAccMag-meanFreq()"         
"fBodyBodyAccJerkMag-mean()"      
"fBodyBodyAccJerkMag-std()"      
"fBodyBodyAccJerkMag-meanFreq()"  
"fBodyBodyGyroMag-mean()"        
"fBodyBodyGyroMag-std()"          
"fBodyBodyGyroMag-meanFreq()"    
"fBodyBodyGyroJerkMag-mean()"     
"fBodyBodyGyroJerkMag-std()"     
"fBodyBodyGyroJerkMag-meanFreq()"