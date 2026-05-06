# Basic Statistical Analysis
# EXERCISE: Arachnophobia

# Deactivate scientific notation.

options(scipen = 999)

# Set the working directory.

setwd("C:/BMGF2026")

# Read the data into R from a CSV file.

spiders <- read.csv("arachnophobia.csv",
                    header = TRUE,
                    sep = ",")

# Calculate the mean, standard deviation, median
# and interquartile range for y and x.

mean(spiders$y)
sd(spiders$y)
median(spiders$y)
IQR(spiders$y)

mean(spiders$x)
sd(spiders$x)
median(spiders$x)
IQR(spiders$x)

# Test whether the mean size of the spiders is 
# significantly different from 10cm.

t.test(spiders$x,
       alternative = "two.sided",
       mu = 10)

# Test whether the mean mean GSR measurement is
# significantly more than 25.

t.test(spiders$y,
       alternative = "greater",
       mu = 25)

# Calculate the correlation coefficient between the
# GSR measurements and the sizes of the spiders.

cor(spiders$y, spiders$x)

# Fit a simple linear regression model in which the
# GSR measurements are explained by the sizes of
# the spiders.

lrm <- lm(y ~ x, data = spiders)
summary(lrm)

# Use the fitted linear regression model to predict
# the GSR measurement for Nosnow Cannotski who had
# to interact with a spider of 13cm.

# Observed sizes of the spiders:

spiders$x

# Observed GSR measurements:

spiders$y

# Predicted GSR measurements:

lrm$fitted.values

# Give the observed size of the spider with which
# Nosnow Cannotski interacted, the observed GSR 
# measurement for Nosnow Cannotski and the predicted
# GSR measurement for Nosnow Cannotskiweight.

which(spiders$x == 13)

spiders$x[5]
spiders$y[5]
lrm$fitted.values[5]

# Draw a scatter plot of the GSR measurements
# against the sizes of the spiders.
# Add the fitted regression line to the plot and
# indicate the predicted GSR measurement
# for Nosnow Cannotski.

plot(spiders$x, spiders$y,
     main = "Scatter plot of the GSR measurements against the sizes of the spiders",
     xlab = "Size (cm)", 
     ylab = "GSR measurement",
     cex = 2,
     pch = 19, 
     col = "yellowgreen")
abline(lrm,
       lwd = 2,
       col = "springgreen")
points(spiders$x[5],
       lrm$fitted.values[5],
       pch = 15,
       cex = 2,
       col = "black")