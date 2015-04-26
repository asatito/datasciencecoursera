#run_analysis.R
library(data.table)
library(dplyr)

#### Read all meta data files
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#### Read all test data files
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#### Read all train data files
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

##     All files are read. Process the test data    ##
## Give meaningful column names
names(X_test) = features[,2]
## subset columns names with mean or std
subset_X_test<- X_test[,grepl("mean|std", colnames(X_test))] 
## add label to y_test
y_test_label <- inner_join(y_test, activity_labels, by=c("V1"))
names(y_test_label) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"
## Create a wide data frame
all_test_data <- cbind(as.data.table(subject_test),
                       y_test_label, subset_X_test)

##     All files are read. Process the train data    ##
## Give meaningful column names
names(X_train) = features[,2]
## subset columns names with mean or std
subset_X_train<- X_train[,grepl("mean|std", colnames(X_train))] 
## add label to y_train
y_train_label <- inner_join(y_train, activity_labels, by=c("V1"))
names(y_train_label) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"
## Create a wide data frame
all_train_data <- cbind(as.data.table(subject_train), 
                        y_train_label, subset_X_train)

###  Combine the test and train data    ####
all_data = rbind(all_train_data,all_test_data)

##   create a second, independent tidy data set with the average of each 
##   variable for each activity and each subject
tidy_data_set <- all_data %>% 
        group_by(subject,Activity_ID,Activity_Label)%>% 
        summarise_each(funs(mean))

write.table(tidy_data_set, file = "./tidy_data_set.txt", row.name=FALSE)
