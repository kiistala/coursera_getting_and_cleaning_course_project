# Ilkka Kiistala
# Coursera: Getting and Cleaning Data
# 2014-06-23

# empty workspace
rm(list = ls(all = TRUE))

# read files:

# training data:
dir <- "UCI HAR Dataset/train/"
group <- "train"
df <- read.table( paste0(dir, "subject_", group, ".txt") )
df <- cbind(df, read.table( paste0(dir, "y_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "X_", group, ".txt") ))
trainingData <- df

# testing data:
dir <- "UCI HAR Dataset/test/"
group <- "test"
df <- read.table( paste0(dir, "subject_", group, ".txt") )
df <- cbind(df, read.table( paste0(dir, "y_", group, ".txt") ))
df <- cbind(df, read.table( paste0(dir, "X_", group, ".txt") ))
testData <- df

# combine:
allData <- rbind(trainingData, testData)

# add column names
namesData <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=F)
namesData <- namesData[,2]
names(allData) <- c("subject", "activityCode", namesData)

# these columns have "mean" or "std" in their name:
meanOrStd <- grepl("mean|std", names(allData))

# dont't forget these, though:
meanOrStd[1:2] <- TRUE

# select all rows, but only specific columns:
selectedData <- allData[, meanOrStd]


# Wanted result: 30 subjects x 6 activities = 180 rows
# this will be our result data set:
meanDF <- selectedData[NULL,]

# the code above copies the columns names info meanDF, but somehow they get vanished in the double for loop

# make a shortcut variable to reference selectedData:
d <- selectedData

# the double for loop
for (s in sort(unique(d$subject)))
{
  # this will tell where we are going:
  print (s)

  for (a in sort(unique(d$activityCode)))
  {
    sel <- d[ d$subject==s & d$activityCode==a, ]

    # this is why it's handy to keep the activity code column remain as numeric:
    means <- colMeans(sel)

    # combine previous "means rows" with this new one:
    meanDF <- rbind(meanDF, means, deparse.level=0)
  }
}

# if you want to check that the target combinations exist:
# meanDF[,1:2]

ncol(meanDF)
# should return 81

nrow(meanDF)
# should return 180

# names(meanDF)
# copy names from d data.frame because they get written over in the rbind():
names(meanDF) <- names(d)

# re-value activity values last:
actNames <- read.table("UCI HAR Dataset/activity_labels.txt")
meanDF$activityCode <- actNames[meanDF$activityCode,2]

# it's user-friendly to rename the column accordingly:
colnames(meanDF)[2] <- "activity"

names(meanDF)


# with these snippets you can check the data is refined as it was supposed to:
mean( selectedData[selectedData$subject==30 & selectedData$activityCode==6, "tBodyGyro-mean()-X"] )
# [1] -0.02678122
meanDF[ meanDF$subject==30 & meanDF$activity=="LAYING", "tBodyGyro-mean()-X"]
# [1] -0.02678122

# save as a file:
write.table(meanDF, "means.txt")

# this is a code snippet I used to write me a list of column names:
for (name in names(meanDF)) { cat( sprintf("%s\n", name)) }
