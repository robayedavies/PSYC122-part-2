


############################################################################################################


# In Week 16, we aim to further develop skills in visualizing psychological data

# We do this to learn how to answer research questions like:

# 1. What person attributes predict success in understanding?
# 2. Can people accurately evaluate whether they correctly understand written health information?

# These kinds of research questions can be answered using methods like correlation and linear models

# First, we will consolidate learning on data visualization:
# -- Use histograms to examine the distributions of variables;
# -- Learn to edit the histograms


# -- I work through the parts, tasks and questions with similar data in:
# 2021-22-PSYC122-w16-how-to.R
# -- If you are unsure how to do something, check that out and then come back here



############################################################################################################


# -- I will put dataset names in quotes like this: 
#   'study-one-general-participants.csv'
# -- I will put variable (data column) names in quotes like this: 'variable' 
# -- And I will put value or other data object (e.g. cell value) names in quotes like this: 'studyone'

# -- This is to help you distinguish between the ordinary use of words like variable
# from the special use of these words when they are parts of datasets.


# We will take things step-by-step

# -- I will split .R scripts by parts, tasks and questions:  
# -- different parts for different phases of the analysis workflow;
# -- different tasks for different steps in each phase;
# -- different questions to examine different ideas or coding steps



############################################################################################################
## Part 1: Set-up ##########################################################################################


# -- Task 1 -- Run this code to empty the R environment
rm(list=ls())                            


# -- Task 2 -- Run this code to load relevant libraries
library("tidyverse")



############################################################################################################
############################################################################################################


# -- In this activity workbook, we use data from a second 2020 study of the response of adults from a UK national
# sample to written health information

# study-two-general-participants.csv



############################################################################################################
## Part 2: Load data #######################################################################################


# -- Task 3 -- Read in the data file we will be using: 
# study-two-general-participants.csv
# -- hint: Task 3 -- Use the read_csv() function to read the data file into R
study.two.gen <- read_csv("study-two-general-participants.csv")
# -- hint: Task 3 -- When you read the data file in, give the data object you create a clear name 
# e.g. study.two.gen


# -- Task 4 -- Inspect the data file
# -- hint: Task 4 -- Use the summary() or head() functions to take a look
head(study.two.gen)
summary(study.two.gen)


# -- Q.1. -- What is the median of 'AGE'?
# -- A.1. -- 32.50  

# -- Q.2. -- What class is the variable 'ETHNICITY'?
# -- A.2. -- character  

# -- Q.3. -- Does the summary indicate if any variable has missing values (NAs)?
# -- Q.3. -- No


# -- Task 5 -- Change the class or type of the variable 'ETHNICITY' to factor
# -- hint: Task 5 -- You can use the as.factor() function you have used before
study.two.gen$ETHNICITY <- as.factor(study.two.gen$ETHNICITY)


# -- Q.4. -- After you have done this, what information does summary() give you about the variable
# 'ETHNICITY'?
summary(study.two.gen)
# -- A.4. -- We can see that ETHNICITY lists observations (following UK Office National Statistics ethnicity grouping)
# Asian: 15
# Black: 5
# Mixed: 7
# White: 145



############################################################################################################
## Part 3: Use histograms to examine the distributions of variables ########################################


# -- Task 6 -- Draw histograms to examine the distributions of variables
# -- hint: Task 6 -- Use ggplot() with geom_histogram()

# -- The first time we do this, we do it in the new way, and we take things step-by-step
# -- Here's an example: run the line of code and see the result in the Plots window in R-Studio
ggplot(data = study.two.gen, aes(x = mean.acc)) + geom_histogram()

# These are the steps:
# -- 1 -- ggplot(...) -- you tell R you want to make a plot using the ggplot() function
# -- 2 -- ggplot(data = study.two.gen ...) -- you tell R you want to make a plot with the 'study.two.gen' data
# -- 3 -- ggplot(..., aes(x = mean.acc)) -- you tell R that you want to make a plot with the variable 'mean.acc'
# -- 3 -- here, you specify the aesthetic mapping, x = mean.acc
# -- 4 -- ggplot(...) + geom_histogram() -- you tell R you want to plot values of 'mean.acc' as a histogram


# -- Q.5. -- Did you get a message in red in the Console window in R-Studio: what does it say?
# -- A.5. -- `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

# -- Q.6. -- Draw two different histograms to examine the distributions of two different variables: SHIPLEY and HLVA
ggplot(data = study.two.gen, aes(x = SHIPLEY)) + geom_histogram()
ggplot(data = study.two.gen, aes(x = HLVA)) + geom_histogram()

# -- Q.7. -- Now re-do both plots: can you change the binwidth in geom_histogram() to make the bars wider?
# -- hint: Q.7. -- If you are going to change binwidth the number you use needs to be a number larger than   
# the minimum and smaller than the maximum for the variable
# -- Remember, min and max values are given for each numeric variable in summary()
ggplot(data = study.two.gen, aes(x = SHIPLEY)) + geom_histogram(binwidth = 2)
ggplot(data = study.two.gen, aes(x = HLVA)) + geom_histogram(binwidth = 2)


# -- Remember: this move is discussed in the how-to .R
# -- We adjust binwidth typically to improve the appearance of the plot
# -- This is a bit subjective so try different numbers and see how you feel about the changes in appearance
# -- We want histograms that show us enough detail about the frequency of occurrence of groupings (bins) of
# values for each variable
# -- But we do not histograms that show us so much detail it is difficult to see the pattern for the 
# distribution


# -- Q.8 -- How would you describe the distributions -- in a sentence -- of the distributions of the
# SHIPLEY and HLVA variable values for our sample?
# -- A.8. -- The SHIPLEY values lie between about 25 and 40, and are skewed towards high scores. The HLVA
# values lie between 4 and about 14, and peak in the middle (near 7)



############################################################################################################
## Part 4: Edit your plots to make them look good ##########################################################


# -- Task 7 -- Edit the appearance of *one variable* histogram plot step-by-step
# -- hint: Task 7 -- ggplot() code does not all have to be on the same line
# -- hint: Task 7 -- you can create a new plot for each edit so you can see what difference your edits make


# -- Q.9. -- Edit the appearance of the bars using binwidth
ggplot(data = study.two.gen, aes(x = HLVA)) + 
  geom_histogram(binwidth = 2)

# -- Q.10. -- Edit the colour of the background using theme_bw()
ggplot(data = study.two.gen, aes(x = HLVA)) + 
  geom_histogram(binwidth = 2) +
  theme_bw()

# -- Q.11. -- Edit the appearance of the labels using labs()
ggplot(data = study.two.gen, aes(x = HLVA)) + 
  geom_histogram(binwidth = 2) +
  theme_bw() +
  labs(x = "HLVA", y = "count")


# -- Notice how, if you are doing edits in steps, one line at a time, each line in your code -- except the last one 
# -- ends in a +
# -- What we are doing is telling R we want this + this + this ...
# -- Each line then adds an extra step
# -- You can break this code by not adding a + at the end of each bit (except the last line)

# -- Notice that how to break the code, and how to figure out how to fix the break, are discussed in the how-to .R



############################################################################################################