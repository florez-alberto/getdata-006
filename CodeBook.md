##Codebook

#This code book describes the variables, the data, and any transformations or work performed to clean up the data.

1. Raw files 

a. for test: 
-X_test = 2947 obs of 561 variables, all the featured operations (named in features) 
-y_test = 2947 obs of 1 variable, it has numbers from 1 to 6, corresponding to the activities (named in activity_labels)
-subject_test = with numbers from 1-30, corresponds with the 30% of the subjects numbers, on which the experiment was performed

b. for train: its the same, but for the other subjects (remaining 70%, 7352 obs)

c. common for both: 
-features: 561 featured operations names
-activity_labels: 6 activities names

2. Merged raw files
test.set = all test files
train.set = all train files
one.data.set = test and train sets

3. Middle operations
activity_labels1= activity_labels coerced to characters
mean.cols= all the columns in one.data.set that contain the word "mean"
std.cols= all the columns in one.data.set that contain the word "std" (standard deviation)
col.msmts= both mean.cols and std.cols (all the column measurements) in total 81


4. Results

-extracted= the result from the assignment activity 2 (Extracts only the measurements on the mean and standard deviation for each measurement), it has 81 columns and all activities labeled properlly

For extracted: 
Column 1(subject) = the number corresponds to the subject number
Column 2(Activity labels)= its a 1:6 factor values in the rows labelled corresponding to activity_labels in c.
Rest of columns= all the featured operations described in features in c.

-tidy.data= the result from the assignment activity 5 (Creates a second, independent tidy data set with the average of each variable for each activity and each subject), all the featured columns (3:81) represent the mean for each featured result, for every subject

tidy.data dimensions= it has 180 observations of 81 variables.
Because its 30 subjects and 6 activities for each subject, after the mean its logical that ir should return 180 (6x30) rows
















