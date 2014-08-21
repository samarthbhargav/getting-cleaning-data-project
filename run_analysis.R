
### STEP 1 - Merge the training and the test sets to create one data set #######

directory <- "/home/hduser/workspace/getting-cleaning-data-course-project/UCI HAR Dataset"
tidy_dir <- "/home/hduser/workspace/getting-cleaning-data-course-project/tidy_data"


# this function reads the test and train files and combines them
mergeHelper <- function(testpath, trainpath, dest) {
    message(paste("Reading", testpath))
    test = read.table(testpath)
    message(paste("Reading", trainpath))
    train = read.table(trainpath)
    message("Combining")
    com <- rbind(train, test)
    # message(paste("Writing", dest))
    # write.table(com, dest, row.names = F, col.names = T)
    # message("Writing done")        
    com # return, so it can be used
}
# read and merge X
x <- mergeHelper(paste0(directory, "/", "test/X_test.txt"),
            paste0(directory, "/", "train/X_train.txt"),
            paste0(tidy_dir, "/", "x.txt"))


# read and merge Y
y <- mergeHelper(paste0(directory, "/", "test/y_test.txt"),
            paste0(directory, "/", "train/y_train.txt"),
            paste0(tidy_dir, "/", "y.txt"))

# read and merge Z
subj <- mergeHelper(paste0(directory, "/", "test/subject_test.txt"),
            paste0(directory, "/", "train/subject_train.txt"),
            paste0(tidy_dir, "/", "subject.txt"))


##################################################################################

### STEP 2 

# Extraction of the following Columns
# 1 tBodyAcc-mean()-X
# 2 tBodyAcc-mean()-Y
# 3 tBodyAcc-mean()-Z
# 41 tGravityAcc-mean()-X
# 42 tGravityAcc-mean()-Y
# 43 tGravityAcc-mean()-Z
# 81 tBodyAccJerk-mean()-X
# 82 tBodyAccJerk-mean()-Y
# 83 tBodyAccJerk-mean()-Z
# 121 tBodyGyro-mean()-X
# 122 tBodyGyro-mean()-Y
# 123 tBodyGyro-mean()-Z
# 161 tBodyGyroJerk-mean()-X
# 162 tBodyGyroJerk-mean()-Y
# 163 tBodyGyroJerk-mean()-Z
# 201 tBodyAccMag-mean()
# 214 tGravityAccMag-mean()
# 227 tBodyAccJerkMag-mean()
# 240 tBodyGyroMag-mean()
# 253 tBodyGyroJerkMag-mean()

meanCols <- c(1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253)

# 
# 4 tBodyAcc-std()-X, 
# 5 tBodyAcc-std()-Y
# 6 tBodyAcc-std()-Z
# 44 tGravityAcc-std()-X
# 45 tGravityAcc-std()-Y
# 46 tGravityAcc-std()-Z
# 84 tBodyAccJerk-std()-X
# 85 tBodyAccJerk-std()-Y
# 86 tBodyAccJerk-std()-Z
# 124 tBodyGyro-std()-X
# 125 tBodyGyro-std()-Y
# 126 tBodyGyro-std()-Z
# 164 tBodyGyroJerk-std()-X
# 165 tBodyGyroJerk-std()-Y
# 166 tBodyGyroJerk-std()-Z
# 202 tBodyAccMag-std()
# 215 tGravityAccMag-std()
# 228 tBodyAccJerkMag-std()
# 241 tBodyGyroMag-std()
# 254 tBodyGyroJerkMag-std()

stdCols <- c(4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254)


xSubset <- x[, c(meanCols, stdCols)]

### Step 3 Uses descriptive activity names to name the activities in the data set
for( yDesc in y) {
    yDesc <- as.character(yDesc)
}

# 1 WALKING
yDesc[grepl("1",yDesc)] <- "WALKING"

# 2 WALKING_UPSTAIRS
yDesc[grepl("2",yDesc)] <- "WALKING_UPSTAIRS"

# 3 WALKING_DOWNSTAIRS
yDesc[grepl("3",yDesc)] <- "WALKING_DOWNSTAIRS"

# 4 SITTING
yDesc[grepl("4",yDesc)] <- "SITTING"

# 5 STANDING
yDesc[grepl("5",yDesc)] <- "STANDING"

# 6 LAYING
yDesc[grepl("6",yDesc)] <- "LAYING"

y$V1 <- yDesc
colnames(y) <- c("Activity")

### Step 4 Appropriately labels the data set with descriptive variable names. 
colNames <- read.table('/home/hduser/workspace/getting-cleaning-data-course-project/UCI HAR Dataset/features.txt', colClasses = c('character', 'character'))

colnames(x) <- colNames$V2
colnames(subj) <- c("Subject")
combined <- cbind(subj, y, x)

write.table(combined, paste0(tidy_dir, "/", "combined.txt"), row.names = F, col.names = T)
