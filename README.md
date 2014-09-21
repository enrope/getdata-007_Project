README getdata-007_Project
==================================================================
Coursera: Getting and Cleaning Data Course Project

==================================================================
1. Original Source
The original source for the data set provided is based on the following data source

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

==================================================================
2. Repository
The github repository includes the following files:
	README.md : This file
	Project.txt : The Tidy data set obtained by merging, cleaning, and aggregating the source data files. This is a 180 Row by 68 Column set, delimited by space.
	run_analysis.R : The R script to perform all the steps to produce the Tidy data set Project.txt
	Codebook getdata-007_Project.md : Codebook for Project.txt file.
	
==================================================================
3. Data Set
	The resulting data set is obtained by:
	-Merging the training and the test sets to create one data set.
    -Extracting	only the measurements on the mean and standard deviation for each measurement. 
    -Using descriptive activity names to name the activities in the data set
    -Labelling the data set with descriptive variable names. 
	-Creating an independent tidy data set (Project.txt) with the average of each variable for each activity and each subject.

	There is one record per activity done by subject. The measures are all aggregated to provide the average value of each variable.
	
==================================================================
4. Assumptions
	-Original source data is downloaded and uncompressed to current working directory in R
	
