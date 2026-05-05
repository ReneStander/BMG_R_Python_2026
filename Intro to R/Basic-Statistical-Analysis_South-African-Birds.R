# Basic Statistical Analysis

# Deactivate scientific notation.

options(scipen = 999)

# Set the working directory.

setwd("C:/BMGF2026")

# Read the data into R from a CSV file.

animals <- read.csv("SuperAnimals.csv",
                    header = TRUE,
                    sep = ",")

# Consider only the birds.

birds <- subset(animals,
                animals$Species == "Bird")

# Calculate the mean and the median size of the birds.

mean(birds$Size)
median(birds$Size)

# Calculate the standard deviation and the
# interquartile range for the sizes of the birds.

sd(birds$Size)
IQR(birds$Size)

# Calculate the mean and the median weight of the birds.

mean(birds$Weight)
median(birds$Weight)

# Calculate the standard deviation and the
# interquartile range for the weights of the birds.

sd(birds$Weight)
IQR(birds$Weight)

# Test whether the mean size of the birds is
# significantly different from 90cm.

t.test(birds$Size,
       alternative = "two.sided",
       mu = 90)

# Test whether the mean weight of the birds is
# significantly more than 1kg.

t.test(birds$Weight,
       alternative = "greater",
       mu = 1)

# Test whether the mean log-transformed size of the
# birds is significantly different from 4.5.

t.test(birds$logSize,
       alternative = "two.sided",
       mu = 4.5)

# Test whether the mean log-transformed weight of the
# birds is significantly more than 0.

t.test(birds$logWeight,
       alternative = "greater",
       mu = 0)

# Calculate the correlation coefficient between the
# weight and the size of the birds.

cor(birds$Weight, birds$Size)

# Calculate the correlation coefficient between the
# log-transformed weight and the log-transformed
# size of the birds.

cor(birds$logWeight, birds$logSize)

# Fit a simple linear regression model in which the
# log-transformed weight of the birds is explained
# by the log-transformed size of the birds.

lrm <- lm(logWeight ~ logSize, data = birds)
summary(lrm)

# Draw a scatter plot of the log-transformed weight
# against the log-transformed size of the birds.
# Add the fitted regression line to the plot.

plot(birds$logSize, birds$logWeight,
     main = "Scatter plot of the log-transformed weight against the log-transformed size of the birds",
     xlab = "ln(Size) where Size is in cm",
     ylab = "ln(Weight) where Weight is in kg",
     cex = 2,
     pch = 18,
     col = "seagreen")
abline(lrm,
       lwd = 2,
       col = "darkolivegreen")

# Use the fitted linear regression model to predict
# the weight of the arctic tern. 

# Observed log-transformed sizes of the birds:

birds$logSize

# Observed log-transformed weights of the birds:

birds$logWeight

# Predicted log-transformed weights of the birds:

lrm$fitted.values

# For the blue crane:

which(birds$Animal == "Arctic tern")

birds$logSize[27]
birds$logWeight[27]
lrm$fitted.values[27]

# Draw a scatter plot of the log-transformed weight
# against the log-transformed size of the birds.
# Add the fitted regression line to the plot and
# indicate the predicted log-transformed weight
# of the arctic tern.

plot(birds$logSize, birds$logWeight,
     main = "Scatter plot of the log-transformed weight against the log-transformed size of the birds",
     xlab = "ln(Size) where Size is in cm",
     ylab = "ln(Weight) where Weight is in kg",
     cex = 2,
     pch = 18,
     col = "seagreen")
abline(lrm,
       lwd = 2,
       col = "darkolivegreen")
points(birds$logSize[27],
       lrm$fitted.values[27],
       pch = 15,
       cex = 2,
       col = "black")

# Give the arctic tern's observed size, observed
# weight and predicted weight.

birds$Size[27]
birds$Weight[27]
exp(lrm$fitted.values[27])