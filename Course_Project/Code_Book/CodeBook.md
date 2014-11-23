#Code Book
##Raw Data Collection
###About the Data
Raw data has been collected from the UCI Machine Learning Repository. This database is built from recordings of 
30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial 
sensors. The experiments to collect this data have been carried out with a group of 30 volunteers within an age 
bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial 
angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. 

###Features
There are different features that were examined in this experiment, below is a list of the features
-Body Acceleration
-Gravity Acceleration
-Body Acceleration Jerk
-Body Angular Speed
-Body Angular Acceleration
-Body Acceleration Magnitude
-Gravity Acceleration Magnitude
-Body Acceleration Jerk Magnitude
-Body Angular Speed Magnitude
-Body Angular Acceleration Magnitude

###Measured Variables 
For each feature, certain measurements were taken. You can find a list of these measured variables below:
-mean(): Mean value
-std(): Standard deviation
-mad(): Median absolute deviation
-max(): Largest value in array
-min(): Smallest value in array
-sma(): Signal magnitude area
-energy(): Energy measure. Sum of the squares divided by the number of values.
-iqr(): Interquartile range
-entropy(): Signal entropy
-arCoeff(): Autoregression coefficients with Burg order equal to 4
-correlation(): Correlation coefficient between two signals
-maxInds(): Index of the frequency component with largest magnitude
-meanFreq(): Weighted average of the frequency components to obtain a mean frequency
-skewness(): Skewness of the frequency domain signal
-kurtosis(): Kurtosis of the frequency domain signal
-bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
-angle(): Angle between some vectors.

##Data Transformation
###Files provided
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt/y_train.txt': Training set.
- 'subject_train.txt': Training labels.
- 'X_test.txt/y_test.txt': Test set.
- 'subject_test.txt': Test labels.

###Transformation Steps
1. I took each file (except of the readme.txt) and read it into R
2. I merged the test and training data (both x and y) into a dataframe
3. I added column labels to a dataframe called MergedData
4. I subsetted the dataframe to extract only columns with the mean and standard deviation of each feature. This dataframe is called MergedData2
5. I went back to the MergedData dataframe and changed each activity ID with it's respected Activity Name. A list of the activities can be found below.
	- WALKING 
	- WALKING_UPSTAIRS 
	- WALKING_DOWNSTAIRS 
	- SITTING 
	- STANDING, LAYING
6. I then found the unique combinations for subject and activity ID so that I could find the mean of each column in MergedData. This new subset of MergedData is named TidyData

