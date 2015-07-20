# CleaningData
R programs and Output for "Getting and Cleaning Data"

### How the Program works
The program makes the assumption that the data is in a subdirectory
underneath the location of the R script. To run it:

1. Copy the "UCI HAR Dataset" directory to the same location as the 
   run_analysis.R script.
2. Source the run_analysis.R script from within a R command window.
3. Output data will be written in UCI HAR Dataset
   a. ./UCI HAR Dataset/TidyDataSet01.txt
   b. ./UCI HAR Dataset/TidyDataSet02.txt

Program will first combine the contents of the test and training data
into multiple dataframes. For files that contained multiple samples,
the mean (average) and standard deviation was calculated for each
data sample gathered for each subject and each activity performed.
The output of that "consolidation" was stored in TidyDataSet01.txt

A second dataset was created to get the average result for each test,
grouped by subject and activity performed. This was stored in 
TidyDataSet02.txt

### Code Book
Here is the definition of the variables used in the output files
listed above and the source of where that data came from:

  Variable             ==>    Source (./test and ./train)\n
  ---------------------------------------------------------------
  Subject              ==>   ./subject_*.txt
  Activity             ==>   ./y_*.txt and ../activity_labels.txt
  X(Avg)               ==>   ./X_*.txt
  X(StdDev)            ==>   ./X_*.txt
  body_acc_x(Avg)      ==>   ./Inertial Signals/body_acc_x_*.txt
  body_acc_x(StdDev)   ==>   ./Inertial Signals/body_acc_x_*.txt
  body_acc_y(Avg)      ==>   ./Inertial Signals/body_acc_y_*.txt
  body_acc_y(StdDev)   ==>   ./Inertial Signals/body_acc_y_*.txt
  body_acc_z(Avg)      ==>   ./Inertial Signals/body_acc_z_*.txt
  body_acc_z(StdDev)   ==>   ./Inertial Signals/body_acc_z_*.txt
  body_gyro_x(Avg)     ==>   ./Inertial Signals/body_gyro_x_*.txt
  body_gyro_x(StdDev)  ==>   ./Inertial Signals/body_gyro_x_*.txt
  body_gyro_y(Avg)     ==>   ./Inertial Signals/body_gyro_y_*.txt
  body_gyro_y(StdDev)  ==>   ./Inertial Signals/body_gyro_y_*.txt
  body_gyro_z(Avg)     ==>   ./Inertial Signals/body_gyro_z_*.txt
  body_gyro_z(StdDev)  ==>   ./Inertial Signals/body_gyro_z_*.txt
  total_acc_x(Avg)     ==>   ./Inertial Signals/total_acc_x_*.txt
  total_acc_x(StdDev)  ==>   ./Inertial Signals/total_acc_x_*.txt
  total_acc_y(Avg)     ==>   ./Inertial Signals/total_acc_y_*.txt
  total_acc_y(StdDev)  ==>   ./Inertial Signals/total_acc_y_*.txt
  total_acc_z(Avg)     ==>   ./Inertial Signals/total_acc_z_*.txt
  total_acc_z(StdDev)  ==>   ./Inertial Signals/total_acc_z_*.txt

(NOTE: * refers to either test or train in the filename)
  
