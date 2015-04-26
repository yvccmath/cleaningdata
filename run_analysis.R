install.packages("dplyr")
library(dplyr)

## Upload the files from the working directory that are necessary for this project.

X_test <- read.table("test/X_test.txt")  # dim = 2947 x 561
y_test <- read.table("test/y_test.txt")  # dim = 2947 x 1
subject_test <- read.table("test/subject_test.txt")  # dim = 2947 X 1
X_train <- read.table("train/X_train.txt")  # dim = 7352 x 561
y_train <- read.table("train/y_train.txt")  # dim = 7352 x 1
subject_train <- read.table("train/subject_train.txt")  # dim =7352 X 1
varlabels <- read.table("varlabels.txt")  # dim = 561 x 1

## Combine the tables into one big table, with appropriate variable names.

combdata <- rbind(X_test,X_train)  # dim = 10299 X 561
colnames(combdata) <- t(varlabels)
test.ind <- c(rep(1,2947),rep(0,7352))  # Created an indicator variable with 1 = Test and 0 = Train
combdata2 <- cbind(combdata,test.ind)  # dim = 10299 X 562
y <- rbind(y_test, y_train)  # dim = 10299 X 1
colnames(y) <- c("Activity")
subject <- rbind(subject_test, subject_train)  # dim = 10299 X 1
colnames(subject) <- c("Subject")
combdata3 <- cbind(subject,y,combdata2)  # dim = 10299 X 564

## Create a table for dplyr and give the activities descriptive names.

project <- tbl_df(combdata3)
project$Activity <- as.character(project$Activity)
project$Activity[project$Activity == "1"] <- "WALKING"
project$Activity[project$Activity == "2"] <- "WALKING_UPSTAIRS"
project$Activity[project$Activity == "3"] <- "WALKING_DOWNSTAIRS"
project$Activity[project$Activity == "4"] <- "SITTING"
project$Activity[project$Activity == "5"] <- "STANDING"
project$Activity[project$Activity == "6"] <- "LAYING"
project$Activity <- as.factor(project$Activity)

## Extract only the variables that involve means or standard deviations.

project2 <- project[,c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,
                       127,128,163,164,165,166,167,168,203,204,216,217,229,230,242,243,255,
                       256,268,269,270,271,272,273,347,348,349,350,351,352,426,427,428,429,
                       430,431,505,506,518,519,531,532,544,545)]  # dim = 10299 X 68

## Now create a table that gives the means for all of the above variables, broken down by subject and activity.

projectgroups <- group_by(project2,Subject,Activity)
tidydata <- summarize(projectgroups, avg_BodyAccX = mean(tBodyAccmeanX), 
          avg_tBodyAccY = mean(tBodyAccmeanY), 
          avg_tBodyAccZ = mean(tBodyAccmeanZ),
          std_tBodyAccX = mean(tBodyAccstdX), 
          std_tBodyAccY = mean(tBodyAccstdY), 
          std_tBodyAccZ = mean(tBodyAccstdZ), 
          avg_tGravityAccX = mean(tGravityAccmeanX),
          avg_tGravityAccY = mean(tGravityAccmeanY), 
          avg_tGravityAccZ = mean(tGravityAccmeanZ), 
          std_tGravityAccX = mean(tGravityAccstdX), 
          std_tGravityAccY = mean(tGravityAccstdY), 
          std_tGravityAccZ = mean(tGravityAccstdZ),
          avg_tBodyAccJerkX = mean(tBodyAccJerkmeanX), 
          avg_tBodyAccJerkY = mean(tBodyAccJerkmeanY), 
          avg_tBodyAccJerkZ = mean(tBodyAccJerkmeanZ), 
          std_tBodyAccJerkX = mean(tBodyAccJerkstdX), 
          std_tBodyAccJerkY = mean(tBodyAccJerkstdY),
          std_tBodyAccJerkZ = mean(tBodyAccJerkstdZ), 
          avg_tBodyGyroX = mean(tBodyGyromeanX), 
          avg_tBodyGyroY = mean(tBodyGyromeanY), 
          avg_tBodyGyroZ = mean(tBodyGyromeanZ), 
          std_tBodyGyroX = mean(tBodyGyrostdX), 
          std_tBodyGyroY = mean(tBodyGyrostdY), 
          std_tBodyGyroZ = mean(tBodyGyrostdZ), 
          avg_tBodyGyroJerkX = mean(tBodyGyroJerkmeanX), 
          avg_tBodyGyroJerkY = mean(tBodyGyroJerkmeanY), 
          avg_tBodyGyroJerkZ = mean(tBodyGyroJerkmeanZ), 
          std_tBodyGyroJerkX = mean(tBodyGyroJerkstdX),
          std_tBodyGyroJerkY = mean(tBodyGyroJerkstdY), 
          std_tBodyGyroJerkZ = mean(tBodyGyroJerkstdZ), 
          avg_tBodyAccMag = mean(tBodyAccMagmean), 
          std_tBodyAccMag = mean(tBodyAccMagstd), 
          avg_tGravityAccMag = mean(tGravityAccMagmean),
          std_tGravityAccMag = mean(tGravityAccMagstd), 
          avg_tBodyAccJerkMag = mean(tBodyAccJerkMagmean), 
          std_tBodyAccJerkMag = mean(tBodyAccJerkMagstd), 
          avg_tBodyGyroMag = mean(tBodyGyroMagmean), 
          std_tBodyGyroMag = mean(tBodyGyroMagstd),
          avg_tBodyGyroJerkMag = mean(tBodyGyroJerkMagmean), 
          std_tBodyGyroJerkMag = mean(tBodyGyroJerkMagstd), 
          avg_fBodyAccX = mean(fBodyAccmeanX), 
          avg_fBodyAccY = mean(fBodyAccmeanY), 
          avg_fBodyAccZ = mean(fBodyAccmeanZ), 
          std_fBodyAccX = mean(fBodyAccstdX), 
          std_fBodyAccY = mean(fBodyAccstdY), 
          std_fBodyAccZ = mean(fBodyAccstdZ), 
          avg_fBodyAccJerkX = mean(fBodyAccJerkmeanX), 
          avg_fBodyAccJerkY = mean(fBodyAccJerkmeanY), 
          avg_fBodyAccJerkZ = mean(fBodyAccJerkmeanZ),
          std_fBodyAccJerkX = mean(fBodyAccJerkstdX), 
          std_fBodyAccJerkY = mean(fBodyAccJerkstdY), 
          std_fBodyAccJerkZ = mean(fBodyAccJerkstdZ), 
          avg_fBodyGyroX = mean(fBodyGyromeanX), 
          avg_fBodyGyroY = mean(fBodyGyromeanY), 
          avg_fBodyGyroZ = mean(fBodyGyromeanZ), 
          std_fBodyGyroX = mean(fBodyGyrostdX), 
          std_fBodyGyroY = mean(fBodyGyrostdY), 
          std_fBodyGyroZ = mean(fBodyGyrostdZ), 
          avg_fBodyAccMag = mean(fBodyAccMagmean), 
          std_fBodyAccMag = mean(fBodyAccMagstd),
          avg_fBodyAccJerkMag = mean(fBodyBodyAccJerkMagmean), 
          std_fBodyAccJerkMag = mean(fBodyBodyAccJerkMagstd), 
          avg_fBodyGyroMag = mean(fBodyBodyGyroMagmean), 
          std_fBodyGyroMag = mean(fBodyBodyGyroMagstd),
          avg_fBodyGyroJerkMag = mean(fBodyBodyGyroJerkMagmean), 
          std_fBodyGyroJerkMag = mean(fBodyBodyGyroJerkMagstd))

## Now create a text file of the tidy data.

write.table(tidydata, file = "tidydata.txt", row.name = FALSE)
