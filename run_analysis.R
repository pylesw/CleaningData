## This R program merges the data from 2 sets of files

## First, store the current directory and set the working directory
curdir <- getwd()
setwd("./UCI HAR Dataset")

## Function to convert the numeric Activities to User Friendly descriptions
descriptiveActivity <- function(act_value){
    DAT <- read.table("./activity_labels.txt",col.names = c("ID","Activity"))
    DA <- DAT[act_value,]
}

## Function to merge the columns from TEST and TRAIN that have a single column 
##  (Activity and Subject)
singleColumn <- function(varname) {
    if (varname == "y") {
        cName <- "Activity"
    } else {
        cName <- "Subject"
    }
    DAT1 <- read.table(paste("./test/",varname,"_test.txt",sep=""),col.names=c(cName))
    DAT2 <- read.table(paste("./train/",varname,"_train.txt",sep=""),col.names=c(cName))
    DAT <- rbind(DAT1,DAT2)
}

## Function to calculate the MEAN or Standard Deviation for the files that have 
##  multiple samples per test per subject
CalcRow <- function(varname,rfunction) {
    if ((varname == "subject") || (varname == "X") || (varname == "y")) {
        
        DAT1 <- read.table(paste("./test/",varname,"_test.txt",sep=""))
        DAT2 <- read.table(paste("./train/",varname,"_train.txt",sep=""))
    } else {        
        DAT1 <- read.table(paste("./test/Inertial Signals/",varname,"_test.txt",sep=""))
        DAT2 <- read.table(paste("./train/Inertial Signals/",varname,"_train.txt",sep=""))
    }
    if (rfunction == "mean") {
        rmDAT1 <- data.frame(x=apply(DAT1,1,mean))
        names(rmDAT1)[names(rmDAT1)=="x"] <- paste(varname,"(Avg)",sep="")
        rmDAT2 <- data.frame(x=apply(DAT2,1,mean))
        names(rmDAT2)[names(rmDAT2)=="x"] <- paste(varname,"(Avg)",sep="")
    } else {
        ## Assume standard deviation
        rmDAT1 <- data.frame(x=apply(DAT1,1,sd))
        names(rmDAT1)[names(rmDAT1)=="x"] <- paste(varname,"(StdDev)",sep="")
        rmDAT2 <- data.frame(x=apply(DAT2,1,sd))
        names(rmDAT2)[names(rmDAT2)=="x"] <- paste(varname,"(StdDev)",sep="")
    }
    DAT <- rbind(rmDAT1,rmDAT2)
}

## Start processing the individual files and calculate the Mean and Standard
##  Deviation
Subject <- singleColumn("subject")
Activity <- singleColumn("y")
for (i in 1:6) {
    Activity[Activity==i] <- as.character(descriptiveActivity(i)$Activity)
}
MeanOfX <- CalcRow("X","mean")
SDofX <- CalcRow("X","sd")
MeanBAX <- CalcRow("body_acc_x","mean")
SDBAX <- CalcRow("body_acc_x","sd")
MeanBAY <- CalcRow("body_acc_y","mean")
SDBAY <- CalcRow("body_acc_y","sd")
MeanBAZ <- CalcRow("body_acc_z","mean")
SDBAZ <- CalcRow("body_acc_z","sd")
MeanBGX <- CalcRow("body_gyro_x","mean")
SDBGX <- CalcRow("body_gyro_x","sd")
MeanBGY <- CalcRow("body_gyro_y","mean")
SDBGY <- CalcRow("body_gyro_y","sd")
MeanBGZ <- CalcRow("body_gyro_z","mean")
SDBGZ <- CalcRow("body_gyro_z","sd")
MeanTAX <- CalcRow("total_acc_x","mean")
SDTAX <- CalcRow("total_acc_x","sd")
MeanTAY <- CalcRow("total_acc_y","mean")
SDTAY <- CalcRow("total_acc_y","sd")
MeanTAZ <- CalcRow("total_acc_z","mean")
SDTAZ <- CalcRow("total_acc_z","sd")

## Build the final dataframe (Tasks 1-4) needed to combine individual
##  variables into a single dataframe
DF_FINAL1 <- cbind(Subject,Activity)
DF_FINAL1 <- cbind(DF_FINAL1,MeanOfX)
DF_FINAL1 <- cbind(DF_FINAL1,SDofX)
DF_FINAL1 <- cbind(DF_FINAL1,MeanBAX)
DF_FINAL1 <- cbind(DF_FINAL1,SDBAX)
DF_FINAL1 <- cbind(DF_FINAL1,MeanBAY)
DF_FINAL1 <- cbind(DF_FINAL1,SDBAY)
DF_FINAL1 <- cbind(DF_FINAL1,MeanBAZ)
DF_FINAL1 <- cbind(DF_FINAL1,SDBAZ)
DF_FINAL1 <- cbind(DF_FINAL1,MeanBGX)
DF_FINAL1 <- cbind(DF_FINAL1,SDBGX)
DF_FINAL1 <- cbind(DF_FINAL1,MeanBGY)
DF_FINAL1 <- cbind(DF_FINAL1,SDBGY)
DF_FINAL1 <- cbind(DF_FINAL1,MeanBGZ)
DF_FINAL1 <- cbind(DF_FINAL1,SDBGZ)
DF_FINAL1 <- cbind(DF_FINAL1,MeanTAX)
DF_FINAL1 <- cbind(DF_FINAL1,SDTAX)
DF_FINAL1 <- cbind(DF_FINAL1,MeanTAY)
DF_FINAL1 <- cbind(DF_FINAL1,SDTAY)
DF_FINAL1 <- cbind(DF_FINAL1,MeanTAZ)
DF_FINAL1 <- cbind(DF_FINAL1,SDTAZ)

## Write the dataframe to an output file
write.table(DF_FINAL1,file="TidyDataSet01.txt",row.names = FALSE)

## Build the 2nd dataframe (Task 5)
DF_FINAL2 <- cbind(Subject,Activity)
DF_FINAL2 <- cbind(DF_FINAL2,MeanOfX)
DF_FINAL2 <- cbind(DF_FINAL2,MeanBAX)
DF_FINAL2 <- cbind(DF_FINAL2,MeanBAY)
DF_FINAL2 <- cbind(DF_FINAL2,MeanBAZ)
DF_FINAL2 <- cbind(DF_FINAL2,MeanBGX)
DF_FINAL2 <- cbind(DF_FINAL2,MeanBGY)
DF_FINAL2 <- cbind(DF_FINAL2,MeanBGZ)
DF_FINAL2 <- cbind(DF_FINAL2,MeanTAX)
DF_FINAL2 <- cbind(DF_FINAL2,MeanTAY)
DF_FINAL2 <- cbind(DF_FINAL2,MeanTAZ)

## Get the average for each activity by subject
DF_FINAL3 <- aggregate(DF_FINAL2[,3:12],list(DF_FINAL2$Subject,DF_FINAL2$Activity),mean)
names(DF_FINAL3)[names(DF_FINAL3)=="Group.1"] <- "Subject"
names(DF_FINAL3)[names(DF_FINAL3)=="Group.2"] <- "Activity"

## Write the dataframe to a second output file
write.table(DF_FINAL3,file="TidyDataSet02.txt",row.names = FALSE)

## go back to the starting directory
setwd(curdir)
