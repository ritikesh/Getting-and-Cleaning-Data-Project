# Check if data set exists, else download it and unzip it.
if(!file.exists("UCI HAR Dataset")){
  furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(furl,dest="UCI HAR Dataset.zip")
  unzip("UCI HAR Dataset.zip")
}

# Load the required Training and test data sets into R-objects to combine them
X.train <- read.table("UCI HAR Dataset/train/X_train.txt")
y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X.test <- read.table("UCI HAR Dataset/test/X_test.txt")
y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Load the features and activities to rename the variable and activities descriptively
features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors=F)
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=F)

# 1. Merge the Data sets to create one data set - required.dataset
X <- rbind(X.train, X.test); colnames(X) <- features$V2
y<- rbind(y.train, y.test); colnames(y) <- "activityType"
subject <- rbind(subject.train, subject.test); colnames(subject) <- "subjectId"

# 2. Extract only the mean and standard deviation measures for each measurement using regex matching
required.dataset <- X[,grepl('mean\\(\\)|std\\(\\)',colnames(X))]
required.dataset <- cbind(subject, y, required.dataset)

# 3. Using descriptive names for each Activity in the DataSet
required.dataset$activityType <- factor(required.dataset$activityType, labels=activity.labels$V2)

# 4. Appropriately labels the data set with descriptive variable names by using subsitute functions to match patterns and replace with the required text. 

names(required.dataset) <- gsub("\\-","",names(required.dataset),)
names(required.dataset) <- gsub('^t','time.',names(required.dataset),)
names(required.dataset) <- gsub('^f','frequency.',names(required.dataset),)
names(required.dataset) <- gsub("\\(\\)$","",names(required.dataset),)
names(required.dataset) <- gsub("\\(\\)",".",names(required.dataset),)
names(required.dataset) <- gsub("Mag","magnitude.",names(required.dataset),)
names(required.dataset) <- gsub("Acc","acceleration.",names(required.dataset),)
names(required.dataset) <- gsub("Body","body.",names(required.dataset),)
names(required.dataset) <- gsub("Gyro","gyroscope.",names(required.dataset),)
names(required.dataset) <- gsub("Jerk","jerk.",names(required.dataset),)
names(required.dataset) <- gsub("Gravity","gravity.",names(required.dataset),)
names(required.dataset)[3:ncol(required.dataset)] <- tolower(names(required.dataset)[3:ncol(required.dataset)])

# Load the reshape2 library to reshape the dataset to calculate average on the required variables
library(reshape2)

# Cast and Melt the required.dataset to calculate average(mean) for each activity and subject
tidyDataSetMelt <- melt(required.dataset, id=c('subjectId','activityType'))
tidyDataSetCast <- dcast(tidyDataSetMelt, subjectId + activityType ~ variable, mean)

#using lapply, apply the paste function on the variable names to rename them descriptively
proper.names<-lapply(names(tidyDataSetCast)[3:ncol(tidyDataSetCast)],paste,".mean", sep="")
names(tidyDataSetCast)[3:ncol(tidyDataSetCast)] <- unlist(proper.names)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
write.table(tidyDataSetCast, file="tidydata.txt")

