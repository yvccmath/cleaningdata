Explanation of the run_analysis.R script:

===================================

    Ultimately, I will use dplyr, so the first part of my script was to make sure the package was installed.

    The second part of the script involved reading the various text files of the data and turning them into tables.  
    These include X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt, subject_train.txt, and 
    varlabels.txt.  The last file is a list of the 561 variables in the raw data that ultimately made no difference for 
    the tidy data.

    The third part of the script involved combining the tables into one giant data frame.  Using the dimensions of 
    the tables for guidance, I first combined (with rbind) X_test and X_train, then used varlabels to create the names 
    of the variables.  I likewise used rbind to combine y_test and y_train, giving it the name "Activity".  Using cbind, 
    I then combined Subject, Activity, and the combined X_test/X_train data.  An indicator variable to separate the test 
    data from the train data was also included at the end, though wasn't needed for the tidy data.

    The fourth part of the script involved turning my data frame into a dplyr-ready table.  At this point, I renamed 
    the values in Activity to more descriptive names ( 1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 
    4 = SITTING, 5 = STANDING, 6 = LAYING).  Finally, I removed most of the columns, keeping only the Subject, 
    Activity, and the 66 variables involving means or standard deviations.

    The fifth and final part of the script involved grouping the remaining data frame by subject, then by activity, 
    then finding the mean for each of the remaining columns.  This file was then uploaded as my tidy data.  Each column
    represents a different variable (see the Code Book below for an explanation of the variables.), and each row 
    represents each of the 30 subjects for each of the 6 activities.

==================================================

CODE BOOK

Subject = The 30 volunteers in this experiment.  Each volunteer is identified by a number from 1 to 30.

Activity = The activity performed by the volunteer.  Activities included WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

The remaining 66 variables are the means of either averages (avg) or standard deviations (std) of the sensor signals of the accelerometer (Acc) and gyroscope (Gyro) along the X,Y, and Z axes along body motion (Body) and gravitational (Gravity) components.  The specific variable names are given below: 

    avg_BodyAccX  
    avg_tBodyAccY  
    avg_tBodyAccZ 
    std_tBodyAccX  
    std_tBodyAccY  
    std_tBodyAccZ  
    avg_tGravityAccX 
    avg_tGravityAccY  
    avg_tGravityAccZ  
    std_tGravityAccX  
    std_tGravityAccY  
    std_tGravityAccZ 
    avg_tBodyAccJerkX  
    avg_tBodyAccJerkY  
    avg_tBodyAccJerkZ  
    std_tBodyAccJerkX  
    std_tBodyAccJerkY 
    std_tBodyAccJerkZ  
    avg_tBodyGyroX  
    avg_tBodyGyroY  
    avg_tBodyGyroZ  
    std_tBodyGyroX  
    std_tBodyGyroY  
    std_tBodyGyroZ  
    avg_tBodyGyroJerkX  
    avg_tBodyGyroJerkY  
    avg_tBodyGyroJerkZ  
    std_tBodyGyroJerkX 
    std_tBodyGyroJerkY  
    std_tBodyGyroJerkZ  
    avg_tBodyAccMag  
    std_tBodyAccMag  
    avg_tGravityAccMag 
    std_tGravityAccMag  
    avg_tBodyAccJerkMag  
    std_tBodyAccJerkMag  
    avg_tBodyGyroMag  
    std_tBodyGyroMag 
    avg_tBodyGyroJerkMag  
    std_tBodyGyroJerkMag  
    avg_fBodyAccX  
    avg_fBodyAccY  
    avg_fBodyAccZ  
    std_fBodyAccX  
    std_fBodyAccY  
    std_fBodyAccZ  
    avg_fBodyAccJerkX  
    avg_fBodyAccJerkY  
    avg_fBodyAccJerkZ 
    std_fBodyAccJerkX  
    std_fBodyAccJerkY  
    std_fBodyAccJerkZ  
    avg_fBodyGyroX  
    avg_fBodyGyroY  
    avg_fBodyGyroZ  
    std_fBodyGyroX  
    std_fBodyGyroY  
    std_fBodyGyroZ  
    avg_fBodyAccMag  
    std_fBodyAccMag 
    avg_fBodyAccJerkMag  
    std_fBodyAccJerkMag  
    avg_fBodyGyroMag  
    std_fBodyGyroMag 
    avg_fBodyGyroJerkMag  
    std_fBodyGyroJerkMag 
