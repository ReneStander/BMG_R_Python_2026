# Data Manipulation & Visualisation
# EXERCISE: Arachnophobia

# Deactivate scientific notation.

options(scipen = 999)

# Set the working directory.

setwd("C:/BMGF2026")

# Read the data into R from a CSV file.

spiders <- read.csv("arachnophobia.csv",
                    header = TRUE,
                    sep = ",")

# Browse the data.

names(spiders)
head(spiders)
str(spiders)
View(spiders)
summary(spiders)

# Draw box plots for y and x.

boxplot(spiders$y, 
        horizontal = TRUE,
        main = "Box plot for the GSR measurements of 24 arachnophobes",
        xlab = "GSR measurements",
        border = "firebrick",
        col = "tomato")

boxplot(spiders$x, 
        horizontal = TRUE,
        main = "Box plot for the size of the spiders",
        xlab = "Size (cm)",
        border = "sienna",
        col = "peachpuff")

# Test for normality using the Shapiro-Wilk test.

shapiro.test(spiders$y)
shapiro.test(spiders$x)

# Draw a scatter plot of y against x.

plot(spiders$x, spiders$y,
     main = "Scatter plot of the GSR measurements against the sizes of the spiders",
     xlab = "Size (cm)", 
     ylab = "GSR measurement",
     cex = 2,
     pch = 19, 
     col = "yellowgreen")