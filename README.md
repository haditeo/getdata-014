
# README.MD

## The prerequisite files
There are 3 files available in this repository:
- README.md : This file explains how all of the scripts work and how they are connected
- CodeBook.md : This file contains the data dictionary for the tidy_data_set.txt
- run_analysis.R : This file contains the logic required to produce tidy_data_set.txt

## Code behind run_analysis.R
There are 6 prerequisite files :
- subject_train.txt : This file contains the list of the person who performs the tasks. This data is classified as data collected from actual simulation.
- X_train.txt : This file contains the actual measurements for each person who performs the tasks. This data is classified as data collected from actual simulation.
- y_train.txt : This file contains the actual task performed by each individual person. This data is classified as data collected from actual simulation.
- subject_test.txt : This file contains the list of the person who performs the tasks. This data is classified as test or synthetic data.
- X_test.txt : This file contains the actual measurements for each person who performs the tasks. This data is classified as test or synthetic data.
- y_test.txt : This file contains the actual task performed by each individual person. This data is classified as test or synthetic data.

Initially the script (run_analysis.R) reads all the 6 prerequisite files into the memory.

The strategy is to combine subject_train.txt, X_train.txt and y_train.txt into a single dataset called subject_X_y_train by using cbind() method. The 3 files contains the same number of rows. This dataset is created to give the viewers the view of what each person has done and also the actual measurements taken for each person. The rows for this dataset explains the total number of person participating in the simulation. The columns for this dataset explains the type of activity (walking, standing, etc) and actual measurements taken (tBodyAcc, tGravityAcc, etc).

The same strategy is also enforced in combining subject_test.txt, X_test.txt and y_test.txt into a single dataset called subject_X_y_test.

Since both dataset subject_X_y_train and subject_X_y_test have the same number of columns or same schema, those can be merged into a single dataset by using rbind() method. The result of the dataset is subject_X_y.

After the dataset is merged, the actual column names are configured by using colnames() method. This is performed so that it is easier for user to identify the actual measurements.

Subsequently the dataset (subject_X_y) is grouped by SubjectID and followed by ActivityType in order to see the average value of each measurements using group_by() method followed by summarise() method. The result is stored in the tidy_data_set_raw.

In order to replace the ActivityID with more verbose name, the dataset (tidy_data_set_raw) is inner joined with activity_labels using inner_join() method.

Eventually the tidy data set is stored into tidy_data_set. The result is written into text file using write.table() method
