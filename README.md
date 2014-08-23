getdata-006
===========

Getting and Cleaning Data Course Project


This repo explains how all of the scripts work and how they are connected


There are 2 files: 
-run_analysis.R  with all the code for the assignment project, it will work as long as the Samsung data is in your working directory

-CodeBook.md with:
	-all the information about the names for the raw files
	-all the names and descriptions for middle operations
	-all the final data frame descriptions




#How the script works

I decided that the steps (1-5) were not in an effcient order so I made the project in the following order: 1-4-3-2-5

First I load and merge the raw files. Then label the data set (step 4) and name all the activities (step 3). After that, I extract all the operations that contain the words "mean" or "std" (using grep) and extract the columns according to step 3.
Lastly, using library plyr I use ddply function as shown in "reshaping data" lecture for week 3 and write the output data frame to the file tidy_data_set.txt (step 5).

Thanks for reading this! 