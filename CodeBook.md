# Code Book - Human Activity Recognition Tidy Data Set

## Overview

This Code Book provides information about the variables, data, and transformations performed to obtain the tidy data set from the Human Activity Recognition Using Smartphones dataset.

## Data Source

The original data set used in this analysis is the Human Activity Recognition Using Smartphones dataset, collected from the accelerometers of the Samsung Galaxy S smartphone.

## Tidy Data Set

The tidy data set, `tidy_data.txt`, is a tab-delimited text file containing the average of each variable for each activity and each subject.

## Variables

The tidy data set consists of the following variables:

1. **SubjectID**: Identification number for the subject who performed the activity. Integer.
2. **ActivityLabel**: Numeric code representing the activity performed by the subject.
3. **ActivityName**: Descriptive name corresponding to the numeric ActivityLabel.

For the remaining variables, each variable represents the mean value of a specific feature for a given activity and subject.

Please refer to the original dataset documentation for details on the feature names. The features are normalized and bounded within [-1,1].

## Transformation Steps

1. Loaded the training and test datasets.
2. Merged the training and test datasets to create one dataset.
3. Extracted only the measurements on the mean and standard deviation for each measurement.
4. Used descriptive activity names to name the activities in the data set.
5. Appropriately labeled the data set with descriptive variable names.
6. Created a second, independent tidy data set with the average of each variable for each activity and each subject.

## Notes

- The tidy data set, `tidy_data.txt`, was created using the R script `run_analysis.R`.
- The script utilizes the `dplyr` library for data manipulation.

For any additional details or questions, please refer to the `run_analysis.R` script or contact [OdionJoel].
