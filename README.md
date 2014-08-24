# About
This project is my submission for the Getting and Cleaning Data Course Project. 

# How to run the script

## Steps
* Clone this repository using the following command (git must be installed) : 

  git clone https://github.com/samarthbhargav/getting-cleaning-data-project/
  
* Download the dataset from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Unzip the data into the cloned directory. The folder should be named as 'UCI HAR Dataset' 
* Run the script : run_analysis.R (no args)
* Check the folder tidy_data, It should contain two files
 
**Note:**  Output is in CSV. It can be opened using Excel or LibreOffice Calc for easy reading. 
## Output
One file in tidy_data is **combined.csv** : which is a (Subject, Y, X) combination written as a CSV. 
Note that the X part contains only underived fields related to mean and standard deviation measurements.


The other file **result.csv** is the averaged measurements of X over all combinations of Y and Subject.


For description of the output variables, read the CodeBook.md in the same directory.


