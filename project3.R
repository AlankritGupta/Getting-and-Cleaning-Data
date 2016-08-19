library(data.table)




labels <- read.table("activity_labels.txt")
labels[,2] <- as.character(labels[,2])
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])
