## Import data to R

## If .txt tab file, use this
# my_data <- read.delim(file.choose())
## Or, if .csv file, use this
# my_data <- read.csv(file.choose())


## use the built-in R data set named ToothGrowth. It contains data from a study evaluating 
## the effect of vitamin C on tooth growth in Guinea pigs. The experiment has been performed 
## on 60 pigs, where each animal received one of three dose levels of vitamin C (0.5, 1, and 2 mg/day)
## by one of two delivery methods, (orange juice or ascorbic acid (a form of vitamin C and coded as VC).
## Tooth length was measured and a sample of the data is shown below.

## Store the data in the variable my_data
my_data <- ToothGrowth

## To get an idea of what the data look like, we display a random sample of the data using the function: 
## sample_n()[in dplyr package].
# install.packages("dplyr")

## Show a random sample
set.seed(1234)
dplyr::sample_n(my_data, 10)



