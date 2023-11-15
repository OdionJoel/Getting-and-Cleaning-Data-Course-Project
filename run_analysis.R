



data_train <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\train\\X_train.txt", header = FALSE)
data_test <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\test\\X_test.txt", header = FALSE)


labels_train <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\train\\y_train.txt", header = FALSE)
labels_test <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\test\\y_test.txt", header = FALSE)


data_train <- cbind(data_train, labels_train)
data_test <- cbind(data_test, labels_test)


merged_data <- rbind(data_train, data_test)
str(merged_data)




features <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\features.txt", header = FALSE, stringsAsFactors = FALSE)
colnames(merged_data) <- c(as.character(features$V2), "ActivityLabel")

# Step 2: Identify columns related to mean and standard deviation
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", colnames(merged_data), ignore.case = TRUE)

# Subset the dataset to include only mean and standard deviation columns
subset_data <- merged_data[, c(mean_std_cols, ncol(merged_data))]

# Explanation:
# - grep("mean\\(\\)|std\\(\\)", colnames(merged_data), ignore.case = TRUE) finds column indices with "mean()" or "std()" in their names.
# - merged_data[, c(mean_std_cols, ncol(merged_data))] selects only those columns and the last column (ActivityLabel).

# Optional: You may want to create a new data frame for the subset if needed.
# subset_data <- merged_data[, c(mean_std_cols, ncol(merged_data)), drop = FALSE]




str(features)
mean_std_cols
subset_data
str(subset_data)




# Assuming 'subset_data' is your data frame with mean and standard deviation columns
# Assuming 'activity_labels' is the data frame with activity labels

# Load activity labels
activity_labels <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\activity_labels.txt", header = FALSE, col.names = c("ActivityID", "ActivityName"))

# Merge activity labels with subset_data
subset_data <- merge(subset_data, activity_labels, by.x = "ActivityLabel", by.y = "ActivityID", all.x = TRUE)

# Drop the original ActivityID column
subset_data$ActivityID <- NULL


names(activity_labels)
names(subset_data)

activity_labels

subset_data
tail(subset_data)


names(subset_data)





names(subset_data)







# Count the number of columns
num_columns <- length(names(subset_data))
print(num_columns)
head(subset_data)


subject_test <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)
subject_train <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)

# Assuming subject_test and subject_train are text files with one value per line
subject_test <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE)$V1
subject_train <- read.table("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE)$V1

subject_train



# Combine SubjectID with the main dataset
subset_data <- cbind(subset_data, SubjectID = c(subject_test, subject_train))

# Use dplyr to calculate averages
library(dplyr)

# Group by SubjectID and ActivityLabel
grouped_data <- group_by(subset_data, SubjectID, ActivityLabel, ActivityName)

# Calculate the mean for each group
tidy_data <- summarise_all(grouped_data, mean)
head(tidy_data)
# Write the tidy data to a new file if needed
write.csv(tidy_data, "tidy_data.csv", row.names = FALSE)



length(subject_test)
length(subject_train)
nrow(subset_data)

getwd()
setwd("C:\\Users\\Dell\\Desktop\\couersera\\DS r prog\\UCI HAR Dataset")








