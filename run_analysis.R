#R Script


##Reading the features labels (common to both test and training)
features <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

##Read and load the test set, putting it into one data table

X_test <- read.table("./test/X_test.txt")
y_test <- read.table( "./test/y_test.txt")
subject_test <- read.table( "./test/subject_test.txt")

#put all in one data set called test.set, subject_test first because
#the subject who makes the activity should go first, as a matter
#of order, y_test second because its the kind of activity 
#and X_test the last with all the rest of the data

test.set <- cbind (subject_test, y_test, X_test)


##Read and load the train set, putting it into one data table
subject_train <- read.table( "./train/subject_train.txt")
y_train <- read.table( "./train/y_train.txt")
X_train <- read.table( "./train/X_train.txt")
#put all in one data set called train.set
train.set <- cbind(subject_train, y_train, X_train)


#1. Merging the training and the test sets to create one data set

one.data.set <- rbind (train.set, test.set)

#4. Appropriately labels the data set with descriptive variable names

features1 <- as.character(features[,2])
one.names <- c( "Subject" , "Activity" , features1)
colnames(one.data.set) <- one.names

#3. Uses descriptive activity names to name the activities 
#in the data set
#y_test values are integers, I will coerce them
#as factors and put labels to them, corresponding to activity_labels

activity_labels1 <- as.character(activity_labels[,2])
one.data.set[,2] <- as.factor(one.data.set[,2])
levels(one.data.set[,2]) <- activity_labels1

#2. Extracts only the measurements on the 
#mean and standard deviation for each measurement.


mean.cols <- grep("mean" , features[,2],fixed = TRUE)
std.cols <- grep ("std" , features[,2],fixed = TRUE)
col.msmts <- c(mean.cols , std.cols)

#I have to sum +2 to every number in *.cols because 
#"Subject" and "Activity" are before all the features in one.data.set
extracted <- one.data.set[, c(1,2,col.msmts+2)]


#5. Creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject. 



library(plyr)

tidy.data <- ddply(extracted, .(Subject , Activity ), function(x) colMeans(x[,3:81]))

write.table (tidy.data, "./tidy_data_frame.txt" ,row.name=FALSE)
        
        
        
        
        
