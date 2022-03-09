


############################################################################################################


# In Week 17, we aim to further develop skills in visualizing psychological data

# We do this to learn how to answer research questions like:

# 1. What person attributes predict success in understanding?
# 2. Can people accurately evaluate whether they correctly understand written health information?

# These kinds of research questions can be answered using methods like correlation and linear models

# We will consolidate and *extend* learning on data visualization:
# -- Use histograms to examine the distributions of variables;
# -- Use boxplots to examine the differences between groups on a variable;
# -- Use scatterplots to examine how values on one variable relate to values on another variable;
# -- Learn to edit the scatterplots
# -- Learn to edit the histograms

# We will also do some revision on using the correlation test to examine associations between variables


# -- I work through the parts, tasks and questions with similar data in:
# 2021-22-PSYC122-w17-how-to.R
# -- If you are unsure how to do something, check that out and then come back here



############################################################################################################


# -- I will put dataset names in quotes like this: 
#   'study-one-general-participants.csv'
# -- I will put variable (data column) names in quotes like this: 'variable' 
# -- And I will put value or other data object (e.g. cell value) names in quotes like this: 'studyone'

# -- This is to help you distinguish between the ordinary use of words like variable
# from the special use of these words when they are parts of datasets.


# We will take things step-by-step

# -- I will be explicit about when I will ask you to:
# -- consolidate -- where you have had the chance to practice things before;
# -- revise -- where you have started to do things and maybe can use some practice to strengthen skills;
# -- encounter -- where you are doing things that are new;
# -- extend -- where you can do things that will stretch you -- where you might need to do some independent research



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


# -- consolidation: should be no surprises here --


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
# -- hint: Task 4 -- Even though you have done this before, you will want to do it again, here, and
# pay particular attention to what you see, for the numeric variables, in the information about the
# minimum (Min.) and maximum (Max.) values for the variables



############################################################################################################
## Part 3: Now draw scatterplots to examine associations between variables #################################


# -- revision: make sure you are confident about doing these things --

# -- You have seen these code moves before, in previous classes: we are strengthening skills by practising
# coding in different contexts


# -- Task 5 -- Create a scatterplot to examine the association between the outcome 'mean.acc' and each of two numeric
# potential predictor variables 'SHIPLEY' and 'AGE'
# -- hint: Task 5 -- We are working with geom_point() and you need x and y aesthetic mappings
# -- hint: Task 5 -- The outcome variable 'mean.acc' has to be mapped to the y-axis using "...y = ..."
ggplot(data = study.two.gen, aes(x = SHIPLEY, y = mean.acc)) +
  geom_point()

ggplot(data = study.two.gen, aes(x = AGE, y = mean.acc)) +
  geom_point()


# -- encounter: make some new moves --


# -- Task 6 -- Edit the appearance of *each and every* plot step-by-step
# -- hint: Task 6 -- You may want to use the same plot appearance choices for all plots because a consistent
# appearance is generally neater and easier for your audience to process
# -- hint: Task 6 -- You can find links to reference information on colour and shape options in the how-to guide:
# -- use the information to make the plots pleasing in appearance to you
# -- hint: Task 6 -- Do not be afraid to copy then paste code you re-use
# -- hint: Task 6 -- But be careful that things like axis values are sensible for each variable


# -- Q.1. -- First, edit the appearance of the points using alpha, size, shape, and colour

ggplot(data = study.two.gen, aes(x = SHIPLEY, y = mean.acc)) +
  geom_point(alpha = 0.5, size = 2, colour = "blue", shape = 'square')

ggplot(data = study.two.gen, aes(x = AGE, y = mean.acc)) +
  geom_point(alpha = 0.5, size = 2, colour = "blue", shape = 'square')

# -- Q.2. -- Then edit the colour of the background using theme_bw()

ggplot(data = study.two.gen, aes(x = SHIPLEY, y = mean.acc)) +
  geom_point(alpha = 0.5, size = 2, colour = "blue", shape = 'square')   +
  theme_bw()

ggplot(data = study.two.gen, aes(x = AGE, y = mean.acc)) +
  geom_point(alpha = 0.5, size = 2, colour = "blue", shape = 'square')   +
  theme_bw()

# -- Q.3. -- Then edit the appearance of the labels using labs()

ggplot(data = study.two.gen, aes(x = SHIPLEY, y = mean.acc)) +
  geom_point(alpha = 0.5, size = 2, colour = "blue", shape = 'square')   +
  theme_bw() +
  labs(x = "SHIPLEY", y = "mean accuracy")

ggplot(data = study.two.gen, aes(x = AGE, y = mean.acc)) +
  geom_point(alpha = 0.5, size = 2, colour = "blue", shape = 'square')   +
  theme_bw() +
  labs(x = "Age (Years)", y = "mean accuracy")


# -- encounter: make some new moves --


# -- Q.4. -- Then set the x-axis and y-axis limits to the minimum-maximum ranges of the variables you are plotting
# -- hint: Q.4. -- For these plots the y-axis limits will be the same because the outcome stays the same
# -- hint: Q.4. -- But the x-axis limits will be different for each different predictor variable
# -- hint: Q.4. -- The minimum value will always be 0
# -- hint: Q.4. -- You can use the maximum values that you see, for the x-axis variables, in the summary() results

ggplot(data = study.two.gen, aes(x = SHIPLEY, y = mean.acc)) +
  geom_point(alpha = 0.5, size = 2, colour = "blue", shape = 'square')   +
  theme_bw() +
  labs(x = "SHIPLEY", y = "mean accuracy") +
  xlim(0, 40) + ylim(0, 1)

ggplot(data = study.two.gen, aes(x = AGE, y = mean.acc)) +
  geom_point(alpha = 0.5, size = 2, colour = "blue", shape = 'square')   +
  theme_bw() +
  labs(x = "Age (Years)", y = "mean accuracy") +
  xlim(0, 80) + ylim(0, 1)


# -- I am going to ask some questions, next, that rely on your subjective impression
# given what you see in the plots
# -- Do not worry that there is no "right" answer here
# -- What we are doing is helping you to build experience so that you can develop an intuitive sense
# of patterns


# -- Q.5. -- Which predictor variables do or do not show an identifiable association with the outcome?
# -- A.5. -- An association is apparent between the outcome and SHIPLEY but not between the outcome and AGE

# -- Q.6. -- What do you see that leads you to this conclusion?
# -- A.6. -- The scatter of points appears to trend upwards for the outcome and SHIPLEY only.
# It is hard to identify a pattern for the outcome and AGE



############################################################################################################
## Part 3: Use histograms to examine the distributions of variables ########################################


# -- revision: make sure you are confident about doing these things --


# -- Task 7 -- Draw histograms to examine the distributions of variables
# -- Task 7 -- Practice editing the appearance of the plot step-by-step
# -- hint: Task 7 -- Choose whichever numeric variable from the study.two.gen dataset you please
# -- hint: Task 7 -- Use the step-by-step line-by-line format to break the plot code into steps
# -- it will make it easier to read, and it will make it easier to add edits e.g.
ggplot(data = study.two.gen, aes(x = SHIPLEY)) + 
  geom_histogram()

# -- We are going to revise editing:
# -- 1 -- the appearance of the bars using binwidth
# -- 2 -- the colour of the background using theme_bw()
# -- 3 -- the appearance of the labels using labs()
# -- Then we are going to try some new moves:
# -- 4 -- setting the x-axis limits to reflect the full range of possible scores on the x-axis variable

# -- Q.7. -- Edit the appearance of the bars by specifying a binwidth value
ggplot(data = study.two.gen, aes(x = SHIPLEY)) + 
  geom_histogram(binwidth = 2)

# -- Q.8. -- Then add an edit to the appearance of the background using theme_bw()
ggplot(data = study.two.gen, aes(x = SHIPLEY)) + 
  geom_histogram(binwidth = 2) +
  theme_bw()

# -- Q.9. -- Then add an edit to the appearance of the labels using labs()
ggplot(data = study.two.gen, aes(x = SHIPLEY)) + 
  geom_histogram(binwidth = 2) +
  theme_bw() +
  labs(x = "SHIPLEY", y = "frequency count")


# -- encounter: make some new moves --


# -- Q.10. -- Now add an edit by setting the x-axis limits using xlim()
ggplot(data = study.two.gen, aes(x = SHIPLEY)) + 
  geom_histogram(binwidth = 2) +
  theme_bw() +
  labs(x = "Vocabulary (SHIPLEY)", y = "frequency count") +
  xlim(0,40)

# -- Q.11. -- Can you find information on how to define the limits on the x-axis and on the y-axis?
# -- hint: Q.11. -- You can see the information in this week's how-to but try a search online for "ggplot reference xlim"
# -- A.11. -- See ggplot reference information on setting limits here:
# https://ggplot2.tidyverse.org/reference/lims.html


# -- encounter: make some new moves --


# -- Q.12. -- Now use the information in histograms to evaluate what you see in the scatterplots
# -- Q.12. -- Produce histograms for each of the variables you visualized using scatterplots:
# is there anything salient about the distributions you plotted that may be relevant, here, to your
# understanding of why you may or may not be able to identify an association between the outcome and any 
# one of the predictor variables?
# -- A.12. -- If you look at the histogram showing the distribution of sample ages then you can see that
# most people in the sample were quite young: there were few older participants. Maybe this makes it harder
# to identify a relationship between ages and mean accuracy



############################################################################################################
## Part 4: Use correlation to to answer the research questions #############################################


# -- revision: make sure you are confident about doing these things --

# -- You have seen these code moves before, in previous classes: we are strengthening skills by practising
# coding in different contexts


# -- One of our research questions is:
# 1. What person attributes predict success in understanding?

# -- We can answer this question by examining whether vocabulary knowledge correlates with mean accuracy of understanding
# -- The logic is that if our capacity to understand what we read depends on our knowledge of the words we may read
# i.e. on our vocabulary knowledge then vocabulary test scores should be associated -- should be correlated with -- 
# how accurately we can actually respond to questions that test that understanding


# -- Task 8 -- Examine the correlation between mean accuracy (mean.acc) and vocabulary scores (SHIPLEY)
# -- hint: Task 8 -- We use cor.test()
cor.test(study.two.gen$mean.acc, study.two.gen$SHIPLEY, method = "pearson",  alternative = "two.sided")

# -- Q.3. -- What is r, the correlation coefficient?
# -- A.3. -- r = 0.4650537
# -- Q.4. -- Is the correlation significant?
# -- A.4. -- r is significant
# -- Q.5. -- What are the values for t and p for the significance test for the correlation?
# -- A.5. -- t = 6.8493, p = 1.299e-10

# -- Q.6. -- What do you conclude, given the correlation results?
# -- hint: Q.6 -- Maybe draw a scatterplot to examine the shape of the association
# -- A.6. -- SHIPLEY and mean.acc are positively correlated suggesting that as vocabulary scores increase so also do
# mean.acc scores



############################################################################################################