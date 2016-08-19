#CodeBook for the project

##Source:

The project uses [**Human Activity Recognition Using Smartphones Data Set**](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) which is available in separate text files to practice merging, cleaning and extracting useful data. The origional data can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

##Processes:
Specifically, the file `run_analysis.R` does the followings:
- Loading the training and testing data; merging tem into one dataset
- Loading activity labels and feature list
- Extracting desired features (mean and standard deviation) using `grep` and `gsub`; extracting desired data based on the desired features.
- Passing descriptive column names to the dataset using `colnames`
- Write the tidy table to a seperate text file using `write.table`

##Variables:
- `subject` - The ID of the subject
- `activity` - The activity performed when the measurement is taken. There are 6 types of activities, including:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING
- `train_subject`, `train_x`, `train_y`, `test_subject`, `test_x`, `test_y`, `activity_labels`, `all_features`: origional data loaded from the data set
- `final_data`: the raw combined data set of `train` and `test`
- `original_column_number`: the column number of the mean and deviation data in the dataset
- `feature_names`: the names of the features mentioned above
- `final_data_mean`: the tidy dataset with average values 
