# my_data <- read.csv("~/Documents/AdvancedStats/Module3/R/TravelData.csv")

## my_data <- TravelData
# str(my_data)
# 
# set.seed(1234)
# dplyr::sample_n(my_data, 5)
# 
# head(my_data)
# library("ggpubr")

# Two-way ANOVA
# In-built dataset: Warpbreaks
# Response Variable: breaks
# Two factors: wool and tension

head(warpbreaks)


summary(warpbreaks)
# 6 treatment groups(AL, AM, AH, BL, BM, BH)
# 54 observations (27+27 or 18+18+18)
# Replicate measurement in ea/ treatment group 
# Use an interaction effect

# aov (), similar to lm () -- linear model
Model_1 <-aov(breaks ~ wool + tension, data=warpbreaks)
# response var explained by two categorical vars
summary(Model_1)

# add in interaction effect
Model_2 <-aov(breaks ~ wool + tension + wool:tension, data=warpbreaks)
summary(Model_2)

# same but short-hand of model_2
Model_3 <-aov(breaks ~ wool*tension, data=warpbreaks)
summary(Model_3)
