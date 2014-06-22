Read Me
=======

description
-----------

This project is a part of the **Data Science specialization** track's course **Getting and Cleaning Data** on **Coursera** sponsored by **John Hopkins University**. The goal of this project is to collect a dataset from the internet and to clean it, make it more readable, i.e. in data science terms, make it tidy. The data was collected from the accelerometers from the Samsung Galaxy S smartphone for the purpose of activity recognition. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Included in this repo are:

* README.md - description about this repository(this file)
* run_analysis.R - the main script from producing the tidy data set
* codebook.md - descibes the original dataset, the variables in the tidy data set and transformations used to obtain them
* tidy_data.txt - the final required clean data set

run_analysis.R
--------------
This is the R file that gets data from the internet and cleans it. This file:
- Checks if the dataset is already downloaded else downloads it. Then reads in the required files for cleaning and producing a tidy dataset
- Extracts the columns that are required for the project. i.e the mean and standard deviations only. The selection is done by using R's pattern matching function(grep1). This makes the dataset considerably smaller. 
- Next the activities are renamed from numbers assigned to them from '1-6' to something more descriptive. Like '1' to 'WALKING'. This is done to enable easier understanding. 
- Next the list of variables assigned are checked and renamed appropriately to follow global standards. This is done using R's subsitute function(gsub).
- The final stage is to calculate average(mean) for all the variables and write them to a new file called tidy_data.txt with descriptive names. 