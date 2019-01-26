# Two-way ANOVA
# Dataset: GradProgramAcceptanceRate
# Description: A simplified dataset of 12 observations of students whose GRE scores
# range between 320 and 325 shows their likelihood of acceptance to a certain graduate
# school program based on their undergraudate college ranking and experience in research
# Response Variable: chance of admit (in %)
# Two factors: college ranking (top25, -50, -75) & Research (0-no, 1-yes)

my_data <- read.csv("~/Documents/AdvancedStats/Module3/R/GradProgramAcceptanceRate.csv")

# aov (), similar to lm () -- linear model
Model_1 <-aov(Acceptance ~ Rank + Research, data=my_data)
# response var explained by two categorical vars
summary(Model_1)

# add in interaction effect
Model_2 <-aov(Acceptance ~ Rank + Research + Rank:Research, data=my_data)
summary(Model_2)

# Two-way interaction plot
interaction.plot(x.factor = my_data$Rank, trace.factor = my_data$Research, 
                 response = my_data$Acceptance, fun = mean, 
                 type = "b", legend = TRUE, 
                 xlab = "Undergrad Ranking", ylab="Acceptance Rate",
                 pch=c(1,19), col = c("#00AFBB", "#E7B800"))

