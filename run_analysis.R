baseProject <- "./data"

# loads all project dependencies
requireDependencies <- function() {
  if (!require("data.table")) {
    install.packages("data.table")
  }        

  if (!require("reshape2")) {
    install.packages("reshape2")
  }        
}

# A generic function to load a file into a data frame
loadFileAsTable <- function(relativeFilePath) {
  f <- paste(baseProject, relativeFilePath, sep="/")  
  read.table(f)
}

# Load Activity Labels
loadActivityLabels <- function() {
  loadFileAsTable("activity_labels.txt")
} 

# Load Features, by optionally specifying which variables to include for analysis;
# the defaults are: mean and standard deviation
loadFeatures <- function(neededFeatures="mean()|std()") {
  result <- loadFileAsTable("features.txt")  
  result$needed <- grepl(neededFeatures, result[,2]) 
  result
}

# a function to load test or training files;
# test files are the default
loadData <- function(dataName, dataType="test") {
  fileName <- paste(paste(dataName, dataType, sep="_"), "txt", sep=".")
  f <- paste(dataType, fileName, sep="/")    
  loadFileAsTable(f)
}

# load a file, remove unneeded vars, and add labels to the 
# analysis dataset
getData <- function(dataType) {
  activityLabels <- loadActivityLabels()
  features <- loadFeatures()
    
  # load x
  x <- loadData("X", dataType)
  # assign names to variables from features
  names(x) <- features[,2]
  # drop unneeded variables (check if meanFreq variables are requried)
  x = x[,features$needed]
  
  y <- loadData("y", dataType)
  # add label for each activity
  y <- merge(y, activityLabels, by="V1", all.x=TRUE)[,1:2]
  # add names to variables
  names(y) = c("activityid", "activitylabel")
  
  # load subject data
  subject <- loadData("subject", dataType)
  # and assign a variable name 
  names(subject) = "subject"
  
  cbind(as.data.table(subject), y, x)  
}

# write the output file to the tidy.txt file
writeOutputFile <- function(ds) {
  outputFileName = paste(baseProject, "../tidy.txt", sep="/")
  write.table(ds, outputFileName, row.names=FALSE)  
}

# the tidy up function to combine test and training data
tidyUp <- function() {
  testData <- getData("test")
  trainData <- getData("train")
  
  # combine train and test data
  combinedData = rbind(testData, trainData)
  
  keyLabels = c("subject", "activityid", "activitylabel")
  varLabels = setdiff(colnames(combinedData), keyLabels)
  meltedData = melt(combinedData, id = keyLabels, measure.vars = varLabels)
  
  # calc average for each key (subject and activity label combination), and each variable
  dcast(meltedData, subject + activitylabel ~ variable, mean)  
}

# main program calls
setwd("~/Documents/Getting-and-Cleaning-Data")
requireDependencies()
tidy <- tidyUp()
writeOutputFile(tidy)
