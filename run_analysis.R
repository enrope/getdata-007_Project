# Please refer to README.md and Codebook for more details
#
# This script will 
# 1. download the compressedd file with data
# 2. Load raw tables in R
# 3. Merge datasets
# 4. Clean up labels
# 5. Create an aggregated data set
# 6. Write out the text file to upload

#Get Zip File to current working directory
fileUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./getdata_projectfiles_FUCI_HAR_Dataset.zip", mode = 'wb')

# Check contents of zip file
#zipfile<-"./getdata_projectfiles_FUCI_HAR_Dataset.zip"
#unzip(zipfile, list=TRUE)

##Extract contents of zip file to current working directory
unzip(zipfile,exdir=".")

## Load Raw Working Tables
xtestraw <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
ytestraw <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
subjecttestraw <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
xtrainraw <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
ytrainraw <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
subjecttrainraw <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
activitylabelsraw <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
featuresraw <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)

## rename variables
names(xtestraw)<-featuresraw$V2
names(xtrainraw)<-featuresraw$V2

#Merge Columns
test<-cbind(c("test"),subjecttestraw,ytestraw,xtestraw)
train<-cbind(c("train"),subjecttrainraw,ytrainraw,xtrainraw)

#rename columns for readability
colnames(test)[1]<-"set"
colnames(test)[2]<-"subject"
colnames(train)[1]<-"set"
colnames(train)[2]<-"subject"

#Combine train and test data sets
combined<-rbind(test,train)

# Merge Activity with labels
c2<-merge(combined,activitylabelsraw,by=c("V1"))

#rename added columns for readability
colnames(c2)[1]<-"activityCode"
colnames(c2)[565]<-"activity"

#Select only the variables for mean and std dev
mean<-grep("mean\\(\\)",colnames(c2),value=TRUE)
std<-grep("std\\(\\)",colnames(c2),value=TRUE)
dataset<-c2[,c("subject","activity",mean,std)]

#Create aggregate tidy set
aggdata <-aggregate(dataset, by=list(dataset$subject,dataset$activity), FUN=mean, na.rm=TRUE)

#Remove extra columns
rem<-c("Group.1","activity")
aggdata<- aggdata[,!(names(aggdata) %in% rem)]
colnames(aggdata)[1]<-"activity"

#Write Tidy data set 
write.table(aggdata,file="./Project.txt",row.name=FALSE)
