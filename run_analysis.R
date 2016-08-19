library(data.table)

labels <- read.table("activity_labels.txt")
labels[,2] <- as.character(labels[,2])
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])

original_feature_number <- grep(".*mean.*|.*std.*", features[,2])


feature_names <- grep(".*mean.*|.*std.*", features[,2],value=T)
feature_names <- gsub('-mean', 'Mean', feature_names)
feature_names <- gsub('-std', 'Std', feature_names)
feature_names <- gsub('[-()]', '', feature_names)


train <- read.table("train/X_train.txt")[original_feature_number]
trainActivities <- read.table("train/Y_train.txt")
trainSubjects <- read.table("train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("test/X_test.txt")[original_feature_number]
testActivities <- read.table("test/Y_test.txt")
testSubjects <- read.table("test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)



final_data <- rbind(train, test)
colnames(final_data) <- c("subject", "activity", feature_names)



final_data$activity <- factor(final_data$activity, levels = labels[,1], labels = labels[,2])
final_data$subject <- as.factor(final_data$subject)

final_data_melted <- melt(final_data, id = c("subject", "activity"))
final_data_mean <- dcast(final_data_melted, subject + activity ~ variable, mean)

write.table(final_data_mean, "tidy.txt", row.names = FALSE, quote = FALSE)


