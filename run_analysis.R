
library(dplyr)   

subject_train <- read.csv("subject_train.txt", sep=" ", stringsAsFactors=FALSE, header=FALSE)
subject_test <- read.csv("subject_test.txt", sep=" ", stringsAsFactors=FALSE, header=FALSE)
activity_labels <- read.csv("activity_labels.txt", sep=" ", stringsAsFactors=FALSE, header=FALSE)

colnames(activity_labels) <- c("ActivityType", "Activity")

X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")


X_train_tBodyAcc <- X_train[, 1:6]
X_train_tGravityAcc <- X_train[, 41:46]
X_train_tBodyAccJerk <- X_train[, 81:86]
X_train_tBodyGyro <- X_train[, 121:126]
X_train_tBodyGyroJerk <- X_train[, 161:166]
X_train_tBodyAccMag <- X_train[, 201:202]
X_train_tGravityAccMag <- X_train[, 214:215]
X_train_tBodyAccJerkMag <- X_train[, 227:228]
X_train_tBodyGyroMag <- X_train[, 240:241]
X_train_tBodyGyroJerkMag <- X_train[, 253:254]


X_train_fBodyAcc <- X_train[, 266:271]
X_train_fBodyAccJerk <- X_train[, 345:350]
X_train_fBodyGyro <- X_train[, 424:429]
X_train_fBodyAccMag <- X_train[, 503:504]
X_train_fBodyAccJerkMag <- X_train[, 516:517]
X_train_fBodyGyroMag <- X_train[, 529:530]
X_train_fBodyGyroJerkMag <- X_train[, 542:543]


X_test_tBodyAcc <- X_test[, 1:6]
X_test_tGravityAcc <- X_test[, 41:46]
X_test_tBodyAccJerk <- X_test[, 81:86]
X_test_tBodyGyro <- X_test[, 121:126]
X_test_tBodyGyroJerk <- X_test[, 161:166]
X_test_tBodyAccMag <- X_test[, 201:202]
X_test_tGravityAccMag <- X_test[, 214:215]
X_test_tBodyAccJerkMag <- X_test[, 227:228]
X_test_tBodyGyroMag <- X_test[, 240:241]
X_test_tBodyGyroJerkMag <- X_test[, 253:254]


X_test_fBodyAcc <- X_test[, 266:271]
X_test_fBodyAccJerk <- X_test[, 345:350]
X_test_fBodyGyro <- X_test[, 424:429]
X_test_fBodyAccMag <- X_test[, 503:504]
X_test_fBodyAccJerkMag <- X_test[, 516:517]
X_test_fBodyGyroMag <- X_test[, 529:530]
X_test_fBodyGyroJerkMag <- X_test[, 542:543]

X_train <- cbind(X_train_tBodyAcc, X_train_tGravityAcc
                 , X_train_tBodyAccJerk, X_train_tBodyGyro
                 , X_train_tBodyGyroJerk, X_train_tBodyAccMag
                 , X_train_tGravityAccMag, X_train_tBodyAccJerkMag
                 , X_train_tBodyGyroMag, X_train_tBodyGyroJerkMag
                 , X_train_fBodyAcc, X_train_fBodyAccJerk
                 , X_train_fBodyGyro, X_train_fBodyAccMag
                 , X_train_fBodyAccJerkMag,X_train_fBodyGyroMag
                 , X_train_fBodyGyroJerkMag)


subject_X_y_train <- cbind(y_train, subject_train, X_train)


X_test <- cbind(X_test_tBodyAcc, X_test_tGravityAcc
                , X_test_tBodyAccJerk, X_test_tBodyGyro
                , X_test_tBodyGyroJerk, X_test_tBodyAccMag
                , X_test_tGravityAccMag, X_test_tBodyAccJerkMag
                , X_test_tBodyGyroMag, X_test_tBodyGyroJerkMag
                , X_test_fBodyAcc, X_test_fBodyAccJerk
                , X_test_fBodyGyro, X_test_fBodyAccMag
                , X_test_fBodyAccJerkMag,X_test_fBodyGyroMag
                , X_test_fBodyGyroJerkMag)


subject_X_y_test <- cbind(y_test, subject_test, X_test)


subject_X_y <- rbind(subject_X_y_test, subject_X_y_train)

colnames(subject_X_y) <- c("ActivityType", "SubjectID"
                           , "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z"
                           , "tBodyAcc_std_X", "tBodyAcc_std_Y", "tBodyAcc_std_Z"
                           , "tGravityAcc_mean_X", "tGravityAcc_mean_Y", "tGravityAcc_mean_Z"
                           , "tGravityAcc_std_X", "tGravityAcc_std_Y", "tGravityAcc_std_Z"
                           , "tBodyAccJerk_mean_X", "tBodyAccJerk_mean_Y", "tBodyAccJerk_mean_Z"
                           , "tBodyAccJerk_std_X", "tBodyAccJerk_std_Y", "tBodyAccJerk_std_Z"
                           , "tBodyGyro_mean_X", "tBodyGyro_mean_Y", "tBodyGyro_mean_Z"
                           , "tBodyGyro_std_X", "tBodyGyro_std_Y", "tBodyGyro_std_Z"
                           , "tBodyGyroJerk_mean_X", "tBodyGyroJerk_mean_Y", "tBodyGyroJerk_mean_Z"
                           , "tBodyGyroJerk_std_X", "tBodyGyroJerk_std_Y", "tBodyGyroJerk_std_Z"
                           , "tBodyAccMag_mean", "tBodyAccMag_std"
                           , "tGravityAccMag_mean", "tGravityAccMag_std"
                           , "tBodyAccJerkMag_mean", "tBodyAccJerkMag_std"
                           , "tBodyGyroMag_mean", "tBodyGyroMag_std"
                           , "tBodyGyroJerkMag_mean", "tBodyGyroJerkMag_std"
                           , "fBodyAcc_mean_X", "fBodyAcc_mean_Y", "fBodyAcc_mean_Z"
                           , "fBodyAcc_std_X", "fBodyAcc_std_Y", "fBodyAcc_std_Z"
                           , "fBodyAccJerk_mean_X", "fBodyAccJerk_mean_Y", "fBodyAccJerk_mean_Z"
                           , "fBodyAccJerk_std_X", "fBodyAccJerk_std_Y", "fBodyAccJerk_std_Z"
                           , "fBodyGyro_mean_X", "fBodyGyro_mean_Y", "fBodyGyro_mean_Z"
                           , "fBodyGyro_std_X", "fBodyGyro_std_Y", "fBodyGyro_std_Z"
                           , "fBodyAccMag_mean", "fBodyAccMag_std"
                           , "fBodyBodyAccJerkMag_mean", "fBodyBodyAccJerkMag_std"
                           , "fBodyBodyGyroMag_mean", "fBodyBodyGyroMag_std"
                           , "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag_std"
)




data_group_by_SubjectID_and_ActivityType <- group_by(subject_X_y, SubjectID, ActivityType)


tidy_data_set_raw <- summarise(data_group_by_SubjectID_and_ActivityType
, avg_of_tBodyAcc_mean_X = mean(tBodyAcc_mean_X), avg_of_tBodyAcc_mean_Y = mean(tBodyAcc_mean_Y), avg_of_tBodyAcc_mean_Z = mean(tBodyAcc_mean_Z)
, avg_of_tBodyAcc_std_X = mean(tBodyAcc_std_X), avg_of_tBodyAcc_std_Y = mean(tBodyAcc_std_Y), avg_of_tBodyAcc_std_Z = mean(tBodyAcc_std_Z)
, avg_of_tGravityAcc_mean_X = mean(tGravityAcc_mean_X), avg_of_tGravityAcc_mean_Y = mean(tGravityAcc_mean_Y), avg_of_tGravityAcc_mean_Z = mean(tGravityAcc_mean_Z)
, avg_of_tGravityAcc_std_X = mean(tGravityAcc_std_X), avg_of_tGravityAcc_std_Y = mean(tGravityAcc_std_Y), avg_of_tGravityAcc_std_Z = mean(tGravityAcc_std_Z)
, avg_of_tBodyAccJerk_mean_X = mean(tBodyAccJerk_mean_X), avg_of_tBodyAccJerk_mean_Y = mean(tBodyAccJerk_mean_Y), avg_of_tBodyAccJerk_mean_Z = mean(tBodyAccJerk_mean_Z)
, avg_of_tBodyAccJerk_std_X = mean(tBodyAccJerk_std_X), avg_of_tBodyAccJerk_std_Y = mean(tBodyAccJerk_std_Y), avg_of_tBodyAccJerk_std_Z = mean(tBodyAccJerk_std_Z)
, avg_of_tBodyGyro_mean_X = mean(tBodyGyro_mean_X), avg_of_tBodyGyro_mean_Y = mean(tBodyGyro_mean_X), avg_of_tBodyGyro_mean_Z = mean(tBodyGyro_mean_Z)
, avg_of_tBodyGyro_std_X = mean(tBodyGyro_std_X), avg_of_tBodyGyro_std_Y = mean(tBodyGyro_std_Y), avg_of_tBodyGyro_std_Z = mean(tBodyGyro_std_Z)
, avg_of_tBodyGyroJerk_mean_X = mean(tBodyGyroJerk_mean_X), avg_of_tBodyGyroJerk_mean_Y = mean(tBodyGyroJerk_mean_Y), avg_of_tBodyGyroJerk_mean_Z = mean(tBodyGyroJerk_mean_Z)
, avg_of_tBodyGyroJerk_std_X = mean(tBodyGyroJerk_std_X), avg_of_tBodyGyroJerk_std_Y = mean(tBodyGyroJerk_std_Y), avg_of_tBodyGyroJerk_std_Z = mean(tBodyGyroJerk_std_Z)
, avg_of_tBodyAccMag_mean = mean(tBodyAccMag_mean), avg_of_tBodyAccMag_std = mean(tBodyAccMag_std)
, avg_of_tGravityAccMag_mean = mean(tGravityAccMag_mean), avg_of_tGravityAccMag_std = mean(tGravityAccMag_std)
, avg_of_tBodyAccJerkMag_mean = mean(tBodyAccJerkMag_mean), avg_of_tBodyAccJerkMag_std = mean(tBodyAccJerkMag_std)
, avg_of_tBodyGyroMag_mean = mean(tBodyGyroMag_mean), avg_of_tBodyGyroMag_std = mean(tBodyGyroMag_std)
, avg_of_tBodyGyroJerkMag_mean = mean(tBodyGyroJerkMag_mean), avg_of_tBodyGyroJerkMag_std = mean(tBodyGyroJerkMag_std)
, avg_of_fBodyAcc_mean_X = mean(fBodyAcc_mean_X), avg_of_fBodyAcc_mean_Y = mean(fBodyAcc_mean_Y), avg_of_fBodyAcc_mean_Z = mean(fBodyAcc_mean_Z)
, avg_of_fBodyAcc_std_X = mean(fBodyAcc_std_X), avg_of_fBodyAcc_std_Y = mean(fBodyAcc_std_Y), avg_of_fBodyAcc_std_Z = mean(fBodyAcc_std_Z)
, avg_of_fBodyAccJerk_mean_X = mean(fBodyAccJerk_mean_X), avg_of_fBodyAccJerk_mean_Y = mean(fBodyAccJerk_mean_Y), avg_of_fBodyAccJerk_mean_Z = mean(fBodyAccJerk_mean_Z)
, avg_of_fBodyAccJerk_std_X = mean(fBodyAccJerk_std_X), avg_of_fBodyAccJerk_std_Y = mean(fBodyAccJerk_std_Y), avg_of_fBodyAccJerk_std_Z = mean(fBodyAccJerk_std_Z)
, avg_of_fBodyGyro_mean_X = mean(fBodyGyro_mean_X), avg_of_fBodyGyro_mean_Y = mean(fBodyGyro_mean_Y), avg_of_fBodyGyro_mean_Z = mean(fBodyGyro_mean_Z)
, avg_of_fBodyGyro_std_X = mean(fBodyGyro_std_X), avg_of_fBodyGyro_std_Y = mean(fBodyGyro_std_Y), avg_of_fBodyGyro_std_Z = mean(fBodyGyro_std_Z)
, avg_of_fBodyAccMag_mean = mean(fBodyAccMag_mean), avg_of_fBodyAccMag_std = mean(fBodyAccMag_std)
, avg_of_fBodyBodyAccJerkMag_mean = mean(fBodyBodyAccJerkMag_mean), avg_of_fBodyBodyAccJerkMag_std = mean(fBodyBodyAccJerkMag_std)
, avg_of_fBodyBodyGyroMag_mean = mean(fBodyBodyGyroMag_mean), avg_of_fBodyBodyGyroMag_std = mean(fBodyBodyGyroMag_std)
, avg_of_fBodyBodyGyroJerkMag_mean = mean(fBodyBodyGyroJerkMag_mean), avg_of_fBodyBodyGyroJerkMag_std = mean(fBodyBodyGyroJerkMag_std)
)

tidy_data_set_with_ActivityID <- inner_join(tidy_data_set_raw, activity_labels)


tidy_data_set <- tidy_data_set_with_ActivityID[c("SubjectID", "Activity"
                                                 , "avg_of_tBodyAcc_mean_X",  "avg_of_tBodyAcc_mean_Y", "avg_of_tBodyAcc_mean_Z"
                                                 , "avg_of_tBodyAcc_std_X", "avg_of_tBodyAcc_std_Y", "avg_of_tBodyAcc_std_Z"
                                                 , "avg_of_tGravityAcc_mean_X", "avg_of_tGravityAcc_mean_Y", "avg_of_tGravityAcc_mean_Z"
                                                 , "avg_of_tGravityAcc_std_X", "avg_of_tGravityAcc_std_Y", "avg_of_tGravityAcc_std_Z"
                                                 , "avg_of_tBodyAccJerk_mean_X", "avg_of_tBodyAccJerk_mean_Y", "avg_of_tBodyAccJerk_mean_Z"
                                                 , "avg_of_tBodyAccJerk_std_X", "avg_of_tBodyAccJerk_std_Y", "avg_of_tBodyAccJerk_std_Z"
                                                 , "avg_of_tBodyGyro_mean_X", "avg_of_tBodyGyro_mean_Y", "avg_of_tBodyGyro_mean_Z"
                                                 , "avg_of_tBodyGyro_std_X", "avg_of_tBodyGyro_std_Y", "avg_of_tBodyGyro_std_Z"
                                                 , "avg_of_tBodyGyroJerk_mean_X", "avg_of_tBodyGyroJerk_mean_Y", "avg_of_tBodyGyroJerk_mean_Z"
                                                 , "avg_of_tBodyGyroJerk_std_X", "avg_of_tBodyGyroJerk_std_Y", "avg_of_tBodyGyroJerk_std_Z"
                                                 , "avg_of_tBodyAccMag_mean", "avg_of_tBodyAccMag_std"
                                                 , "avg_of_tGravityAccMag_mean", "avg_of_tGravityAccMag_std"
                                                 , "avg_of_tBodyAccJerkMag_mean", "avg_of_tBodyAccJerkMag_std"
                                                 , "avg_of_tBodyGyroMag_mean", "avg_of_tBodyGyroMag_std"
                                                 , "avg_of_tBodyGyroJerkMag_mean", "avg_of_tBodyGyroJerkMag_std"
                                                 , "avg_of_fBodyAcc_mean_X", "avg_of_fBodyAcc_mean_Y", "avg_of_fBodyAcc_mean_Z"
                                                 , "avg_of_fBodyAcc_std_X", "avg_of_fBodyAcc_std_Y", "avg_of_fBodyAcc_std_Z"
                                                 , "avg_of_fBodyAccJerk_mean_X", "avg_of_fBodyAccJerk_mean_Y", "avg_of_fBodyAccJerk_mean_Z"
                                                 , "avg_of_fBodyAccJerk_std_X", "avg_of_fBodyAccJerk_std_Y", "avg_of_fBodyAccJerk_std_Z"
                                                 , "avg_of_fBodyGyro_mean_X", "avg_of_fBodyGyro_mean_Y", "avg_of_fBodyGyro_mean_Z"
                                                 , "avg_of_fBodyGyro_std_X", "avg_of_fBodyGyro_std_Y", "avg_of_fBodyGyro_std_Z"
                                                 , "avg_of_fBodyAccMag_mean", "avg_of_fBodyAccMag_std"
                                                 , "avg_of_fBodyBodyAccJerkMag_mean", "avg_of_fBodyBodyAccJerkMag_std"
                                                 , "avg_of_fBodyBodyGyroMag_mean", "avg_of_fBodyBodyGyroMag_std"
                                                 , "avg_of_fBodyBodyGyroJerkMag_mean", "avg_of_fBodyBodyGyroJerkMag_std"
                                                 
                                                 
                                                 
)]

write.table(tidy_data_set, "tidy_data_set.txt", row.name=FALSE)