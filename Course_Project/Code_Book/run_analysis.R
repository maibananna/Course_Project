###Set directory###
directory <- "C:/Users/AM384U/Documents/Getting and Cleaning Data/Course Project/importedData"
setwd(directory)

###Load each file###
xtrain<- read.table("X_train.txt", sep="", header=FALSE)

xtest<- read.table("X_test.txt", sep="", header=FALSE)

ytrain<- read.table("y_train.txt", sep="", header=FALSE)

ytest<- read.table("y_test.txt", sep="", header=FALSE) 

featuredfile <- read.table("features.txt", sep="", colClasses = c("character"))

activitylabels <- read.table("activity_labels.txt", sep="", col.names = c("ActivityId", "Activity"))

subject_train <- read.table("subject_train.txt", sep="",header=FALSE)

subject_test <- read.table("subject_test.txt", sep="", header=FALSE)

###Merge training and test sets###
TrainingData <- cbind(cbind(xtrain,subject_train),ytrain)
TestData <- cbind(cbind(xtest,subject_test),ytest)
MergedData <- rbind(TrainingData, TestData)

###Label data###
labels <- rbind(rbind(featuredfile,c(562,"Subject")), c(563, "ActivityID"))[,2]
names(MergedData) <- labels

###Tidy Data Set 1###
###Filter out to only get mean and std###
indexmean <- grep("*mean*", featuredfile$V2)
indexstd <- grep("*std*", featuredfile$V2)
index<- sort(c(indexmean, indexstd))
MergedData2 <- MergedData[index]

###Replace ActivityID with Activity Name###
MergedData$ActivityID [MergedData$ActivityID == 1] <- "WALKING"
MergedData$ActivityID [MergedData$ActivityID == 2] <- "WALKING_UPSTAIRS"
MergedData$ActivityID [MergedData$ActivityID == 3] <- "WALKING_DOWNSTAIRS"
MergedData$ActivityID [MergedData$ActivityID == 4] <- "SITTING"
MergedData$ActivityID [MergedData$ActivityID == 5] <- "STANDING"
MergedData$ActivityID [MergedData$ActivityID == 6] <- "LAYING"

###Tidy Data Set 2###
###sbuset  subject and activity id to use in aggregate function###
uniqueSA <- data.frame(MergedData$Subject, MergedData$ActivityID)

###Find mean of each variable based on subject,activity ID###
TidyData <- aggregate(MergedData[, 1:561], by = uniqueSA, FUN = mean)



    