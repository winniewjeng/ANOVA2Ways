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

## Check the structure
str(my_data)

## Convert dose as a factor and recode the levels as "D0.5", "D1", "D2"
my_data$dose <- factor(my_data$dose, 
                       levels = c(0.5, 1, 2),
                       labels = c("D0.5", "D1", "D2"))

## Display the beginning of the data table
head(my_data)

## Generate frequency table
table(my_data$supp, my_data$dose)


## Visualize the data

## Install for an easy ggplot2-based data visualization
# if(!require(devtools)) install.packages("devtools")
# devtools::install_github("kassambara/ggpubr")


# Box plot with multiple groups
# +++++++++++++++++++++
# Plot tooth length ("len") by groups ("dose")
# Color box plot by a second group: "supp"
library("ggpubr")
ggboxplot(my_data, x = "dose", y = "len", color = "supp",
          palette = c("#00AFBB", "#E7B800"))

# Line plots with multiple groups
# +++++++++++++++++++++++
# Plot tooth length ("len") by groups ("dose")
# Color box plot by a second group: "supp"
# Add error bars: mean_se
# (other values include: mean_sd, mean_ci, median_iqr, ....)
library("ggpubr")
ggline(my_data, x = "dose", y = "len", color = "supp",
       add = c("mean_se", "dotplot"),
       palette = c("#00AFBB", "#E7B800"))


# Box plot with two factor variables
boxplot(len ~ supp * dose, data=my_data, frame = FALSE, 
        col = c("#00AFBB", "#E7B800"), ylab="Tooth Length")

# Two-way interaction plot
interaction.plot(x.factor = my_data$dose, trace.factor = my_data$supp, 
                 response = my_data$len, fun = mean, 
                 type = "b", legend = TRUE, 
                 xlab = "Dose", ylab="Tooth Length",
                 pch=c(1,19), col = c("#00AFBB", "#E7B800"))


