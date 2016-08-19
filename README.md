# Getting-and-Cleaning-Data
Final project for Course 3


The project involves reading from various text files. The data is distributed into two parts: Train and Test.

The main aim of the project was to extract some relevant features( features having mean and std in their description )
and combining the train and test text files into one bigger text files containing data of only the relevant features.


# Step1: finding out the relevant features
This is done by using grep on the column names
>>> original_feature_number <- grep(".*mean.*|.*std.*", features[,2])

Then slighly editing the colnames so as to be more program friendly
>>> feature_names <- grep(".*mean.*|.*std.*", features[,2],value=T)
>>> feature_names <- gsub('-mean', 'Mean', feature_names)
>>> feature_names <- gsub('-std', 'Std', feature_names)
>>> feature_names <- gsub('[-()]', '', feature_names)


# Step2 Reading the train and test data
reading the train and test data and extracting only the most relevant features.


>>> train <- read.table("train/X_train.txt")[original_feature_number]
>>> trainActivities <- read.table("train/Y_train.txt")
>>> trainSubjects <- read.table("train/subject_train.txt")
>>> train <- cbind(trainSubjects, trainActivities, train)

>>> test <- read.table("test/X_test.txt")[original_feature_number]
>>> testActivities <- read.table("test/Y_test.txt")
>>> testSubjects <- read.table("test/subject_test.txt")
>>> test <- cbind(testSubjects, testActivities, test)


# Step3 Merging training and testing tables
>>> final_data <- rbind(train, test)
>>> colnames(final_data) <- c("subject", "activity", feature_names)



# Final Steps
>>> final_data$activity <- factor(final_data$activity, levels = labels[,1], labels = labels[,2])
>>> final_data$subject <- as.factor(final_data$subject)

Melt and dcast
>>> final_data_melted <- melt(final_data, id = c("subject", "activity"))
>>> final_data_mean <- dcast(final_data_melted, subject + activity ~ variable, mean)

Writing data:
>>> write.table(final_data_mean, "tidy.txt", row.names = FALSE, quote = FALSE)


