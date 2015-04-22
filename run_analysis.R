run_analysis<-function() {
  ## Data and labels files into variables
  activity_lab<-read.table("./Dataset/activity_labels.txt",header=FALSE)
  features  = read.table("./Dataset/features.txt",header=FALSE)
  
  # Each measure data file is load into the script variables
  subject_train = read.table("./Dataset/train/subject_train.txt",header=FALSE)
  x_train<-read.table("./Dataset/train/X_train.txt",header=FALSE)
  y_train<-read.table("./Dataset/train/Y_train.txt",header=FALSE)
  
  # Add the type of measure
  y_train[2] <- "TRAIN"
  
  subject_test = read.table("./Dataset/test/subject_test.txt",header=FALSE)
  x_test<-read.table("./Dataset/test/X_test.txt",header=FALSE)  
  y_test<-read.table("./Dataset/test/Y_test.txt",header=FALSE)
  y_test[2] <- "TEST"
  
  # Set names for the variables to work in this script
  names(activity_lab)  <- c('activityId','activityType')
  
  names(subject_train) <- "subjectId"
  names(x_train) <- features[,2]
  names(y_train) <- c("activityId","setType")
  
  names(subject_test) <- "subjectId"
  names(x_test) <- features[,2] 
  names(y_test) <- c("activityId","setType")
  
  # Create a variable which concatenate the variables with the data
  test_data <- cbind(y_test,subject_test,x_test)
  train_data <- cbind(y_train,subject_train,x_train)
  
  # Concatenate the two types of measurment
  data  <-  rbind(train_data,test_data)
  
  # Create a vector for the column names of the finalData, which will be used
  # to select the desired mean() & stddev() columns
  colnames <- names(data);
  selcols <- (
                grepl("activityId",colnames) | 
                grepl("subjectId",colnames) | 
                grepl("-mean..",colnames) & 
                !grepl("-meanFreq..",colnames) & 
                !grepl("mean..-",colnames) | 
                grepl("-std..",colnames) & 
                !grepl("-std()..-",colnames) |
                grepl("setType",colnames)  
  )
  cleandata <- data[selcols==TRUE]

  # Anotations for the activity label
  cleandata <- merge(cleandata,activity_lab,by='activityId',all.x=TRUE);
  
  
  # Routine for clean the variable names
  cnames <- names(cleandata)
  cnames <- gsub("\\(\\)","",cnames)
  cnames <- gsub("^t","time",cnames)
  cnames <- gsub("^f","freq",cnames)
  cnames <- gsub("\\-mean","Mean",cnames)
  cnames <- gsub("\\-std","Std",cnames)
  cnames <- gsub("activityId","activityId",cnames)

  names(cleandata) <- cnames
  
  # Initializing the final (tidy) df
  final <- aggregate(timeBodyAccMagMean ~ activityId + subjectId,cleandata,mean)
  
  # Summarize by each column and create the tidy data set
  for (i in 5:21) {
    tmp <- cleandata[c(1,3,i)]
    origname <-  names(tmp)
    names(tmp) <- c("activityId","subjectId", "tempname")
    val <- aggregate(tempname ~ activityId + subjectId,tmp,mean)
    names(val) <- origname
    final <- merge(final,val,by=c("activityId","subjectId"))
  }
  
  # Write the file
  write.table(final, './tidyData.txt',row.names=TRUE,sep='\t');
  
}
