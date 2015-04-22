Cleaning data collected from the accelerometers from the Samsung Galaxy S smartphone 
===========================================================================================

This work is made for the final project of the Getting and Cleaning Data course on Coursera.com webpage.

The original data are from the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

On this script, the data are transformed to its analysis following the next steps

1. Each dataset file and its labels files are loaded into script variables.  
   Additionaly add the type of measure for future reference if necessary
2. Set names for the variables to work in this script
3. Create a variable which concatenate horizontally the variables from each file according with the type of measurement.
4. Concatenate verticaly the two types of measurment
5. Create a vector for the column names of the final data which will be used to select the desired mean() & stddev() columns. The selected columns are stored in the variable cleandata
6. With some text substitutions make clear the names of the variables
7. Calculate the average for each variable for summarize the data by activity and subject
8. Write the tidy data in the tidyData.txt file  


