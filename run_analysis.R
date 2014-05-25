features<-read.table("./UCI HAR Dataset/features.txt",as.is=TRUE)  ## Names of the 561 attributes
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")	## Names of the 6 activities
vecCol<-grep("[Mm]ean|std",features$V2)			## Create a vector containing mean or std in the name

## After reading and naming the intermediate variables the end variable
## tst will hold the result of combining the 3 datasets.
## The intermediate variables are removed from memory after they served 
## their purpose
##=========================================================================
tst_x<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features$V2)	## 561 attributen vector: test include the names of the features as column names
tst_y<-read.table("./UCI HAR Dataset/test/Y_test.txt")	## Contains the activities performed
tst_sub<-read.table("./UCI HAR Dataset/test/subject_test.txt") ## Who performed the activities
colnames(tst_sub)<-"Subject"
colnames(tst_y)<-"Activity"
tst_x<-tst_x[,vecCol]	## Only the variables dealing with mean and stddev, remove the rest
tst<-cbind(tst_sub,tst_y,tst_x)			## Merge the three sets into one
rm(tst_x)								
rm(tst_y)							
rm(tst_sub)							

##=========================================================================
## Similar to the test group the processing and naming takes place for the
## training group.
## After reading and naming the intermediate variables the end variable
## trn will hold the result of combining the 3 datasets.
## The intermediate variables are removed from memory after they served 
## their purpose
##=========================================================================
trn_x<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features$V2)	## 561 attributen vector: train include the names of the features as column names
trn_y<-read.table("./UCI HAR Dataset/train/Y_train.txt")
trn_sub<-read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(trn_sub)<-"Subject"
colnames(trn_y)<-"Activity"
trn_x<-trn_x[,vecCol]	## Only the variables dealing with mean and stddev, remove the rest
trn<-cbind(trn_sub,trn_y,trn_x)			## Merge the three sets into one
rm(trn_x)								
rm(trn_y)								
rm(trn_sub)							

##=========================================================================
## The 2 dataframes tst and trn are now combined into a new dataframes
## called tsttrn.
## The intermediate variables tst and trn are removed from memory after
## they served their purpose
##=========================================================================
tsttrn<-rbind(tst,trn)					## Add the rows of tst and trn to one new variable
rm(tst)									
rm(trn)								

##=========================================================================
## Make the activity codes more understandable by changing it into a factor
## variable that holds the codes as well as the required labels
##=========================================================================
tsttrn$Activity <- factor(tsttrn$Activity,levels=activity$V1,labels=activity$V2) ## Make the labels of the activity better understandable

##=========================================================================
## Reshape the data frame
##=========================================================================
tidy<-melt(tsttrn,id.vars=c("Activity","Subject"))
tidy2<-dcast(tidy, Activity + Subject ~ variable, mean)
rm(tidy)

##=========================================================================
## Export the resulting dataset to the file tidy_data
##=========================================================================

fileUrl <- "./tidy_data.csv" 
write.csv(tidy2, fileUrl, row.names=FALSE)