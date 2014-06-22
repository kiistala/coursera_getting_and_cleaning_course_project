# You should create one R script called run_analysis.R that does the following. 
# 
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# 

# 1

dir <- "UCI HAR Dataset/train/"
group <- "train"

df <- read.table( paste0(dir, "subject_", group, ".txt") )
df <- cbind(df, read.table( paste0(dir, "y_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "X_", group, ".txt") ))

df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_acc_x_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_acc_y_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_acc_z_", group, ".txt") ))

df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_gyro_x_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_gyro_x_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_gyro_x_", group, ".txt") ))

df <- cbind(df, read.table( paste0(dir, "Inertial Signals/total_acc_x_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/total_acc_x_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/total_acc_x_", group, ".txt") ))

trainingData <- df

#

dir <- "UCI HAR Dataset/test/"
group <- "test"

df <- read.table( paste0(dir, "subject_", group, ".txt") )
df <- cbind(df, read.table( paste0(dir, "y_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "X_", group, ".txt") ))

df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_acc_x_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_acc_y_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_acc_z_", group, ".txt") ))

df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_gyro_x_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_gyro_x_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/body_gyro_x_", group, ".txt") ))

df <- cbind(df, read.table( paste0(dir, "Inertial Signals/total_acc_x_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/total_acc_x_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "Inertial Signals/total_acc_x_", group, ".txt") ))

testData <- df

allData <- rbind(trainingData, testData)

# 2 


