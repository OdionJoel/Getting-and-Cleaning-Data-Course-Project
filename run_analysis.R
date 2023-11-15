#Merges the training and the test sets to create one data set.



data_train <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
data_test <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\test\\X_test.txt", header = FALSE)


labels_train <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
labels_test <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\test\\y_test.txt", header = FALSE)


data_train <- cbind(data_train, labels_train)
data_test <- cbind(data_test, labels_test)


merged_data <- rbind(data_train, data_test)
str(merged_data)


#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set



features <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\features.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(merged_data) <- c(as.character(features$V2), "ActivityLabel")
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", colnames(merged_data), ignore.case = TRUE)

subset_data <- merged_data[, c(mean_std_cols, ncol(merged_data))]




activity_labels <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\activity_labels.txt", header = FALSE, col.names = c("ActivityID", "ActivityName"))


subset_data <- merge(subset_data, activity_labels, by.x = "ActivityLabel", by.y = "ActivityID", all.x = TRUE)


subset_data$ActivityID <- NULL


names(activity_labels)
names(subset_data)

activity_labels

subset_data
tail(subset_data)


names(subset_data)



num_columns <- length(names(subset_data))
print(num_columns)
head(subset_data)


subject_test <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)
subject_train <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)


subject_test <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)$V1
subject_train <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)$V1

subject_train



subset_data <- cbind(subset_data, SubjectID = c(subject_test, subject_train))




#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)


grouped_data <- group_by(subset_data, SubjectID, ActivityLabel, ActivityName)


tidy_data <- summarise_all(grouped_data, mean)
head(tidy_data)

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)












