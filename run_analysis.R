run_analysis<-function() {
  ## Data and labels files into variables
  activity_lab<-read.table("./Dataset/activity_labels.txt",header=FALSE)
  features  = read.table("./Dataset/features.txt",header=FALSE)
  subject_train = read.table("./Dataset/train/subject_train.txt",header=FALSE)
  x_train<-read.table("./Dataset/train/X_train.txt",header=FALSE)
  y_train<-read.table("./Dataset/train/Y_train.txt",header=FALSE)
  y_train[2] <- "TRAIN"
  
  
  subject_test = read.table("./Dataset/test/subject_test.txt",header=FALSE)
  x_test<-read.table("./Dataset/test/X_test.txt",header=FALSE)  
  y_test<-read.table("./Dataset/test/Y_test.txt",header=FALSE)
  y_test[2] <- "TEST"
  
  names(activity_lab)  <- c('activityId','activityType')
  
  names(subject_train) <- "subjectId"
  names(x_train) <- features[,2]
  names(y_train) <- c("activityId","setType")
  
  names(subject_test) <- "subjectId"
  names(x_test) <- features[,2] 
  names(y_test) <- c("activityId","setType")
  
  
  test_data <- cbind(y_test,subject_test,x_test)
  train_data <- cbind(y_train,subject_train,x_train)
    
  data  <-  rbind(train_data,test_data)
  
  # Create a vector for the column names from the finalData, which will be used
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
  cnames <- names(cleandata)
  cnames <- gsub("\\(\\)","",cnames)
  cnames <- gsub("^t","time",cnames)
  cnames <- gsub("^f","freq",cnames)
  cnames <- gsub("\\-mean","Mean",cnames)
  cnames <- gsub("\\-std","Std",cnames)
  cnames <- gsub("activityId","activityId",cnames)

  
  names(cleandata) <- cnames
  cleandata <- merge(cleandata,activity_lab,by='activityId',all.x=TRUE);
  final <- data.frame(Date=as.Date(character()),
                   File=character(), 
                   User=character(), 
                   stringsAsFactors=FALSE) 
  print(names(cleandata))
  final <- aggregate(timeBodyAccMagMean ~ activityId + subjectId,cleandata,mean)
  for (i in 5:21) {
    tmp <- cleandata[c(1,3,i)]
    origname <-  names(tmp)
    names(tmp) <- c("activityId","subjectId", "tempname")
    #print(names(tmp))
    val <- aggregate(tempname ~ activityId + subjectId,tmp,mean)
    names(val) <- origname
    #print(val)
    final <- merge(final,val,by=c("activityId","subjectId"))
    #names(final[i]) <- origname
  }
  write.table(final, './tidyData.txt',row.names=TRUE,sep='\t');
  
}
