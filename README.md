# Getting and Cleaning Data Coursera Project

## Overview
The purpose of this project is to demonstrate the ability to collect, work with, and 
clean a data set. The goal is to prepare tidy data that can be used for later analysis.
This repo explains how all of the scripts work and how they are connected.

The source data for the project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Usage
1. Clone this github repository to your computer.
2. Verify that the working directory in the run_analysis.R program matches one on 
your computer.
2. Run run_analysis.R program.
3. The program verifies that the required dependent packages are installed. If they
need to be installed, you may need to restart R-Studio and re-run the program.

## Project Summary
run_analysis.R does the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set.
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the 
average of each variable for each activity and each subject.

## Additional Information
CodeBook.md describes the variables, the data, and any transformations or work that have
been performed to clean up the source data.
