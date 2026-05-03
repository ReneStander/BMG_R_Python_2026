# Data Manipulation & Visualisation

# Deactivate scientific notation.

options(scipen = 999)

# Set the working directory.

setwd("C:/BMGF2026")

# Read the data into R from a CSV file.

animals <- read.csv("SuperAnimals.csv",
                    header = TRUE,
                    sep = ",")

# Browse the data.

names(animals)
head(animals)
str(animals)
View(animals)
summary(animals)

# Convert the variables habitat, species and
# vulnerability to factors.

animals$Habitat <- factor(animals$Habitat)
animals$Species <- factor(animals$Species)
animals$Vulnerability <- factor(animals$Vulnerability)

str(animals)
summary(animals)

# Consider only the birds.

birds <- subset(animals,
                animals$Species == "Bird")

head(birds)
str(birds)
View(birds)
summary(birds)

# Create frequency tables for the vulnerability
# and the habitat of the birds.

table(birds$Vulnerability)
table(birds$Habitat)

# Draw bar plots for the vulnerability and 
# the habitat of the birds.

barplot(table(birds$Vulnerability),
        main = "Bar plot for the vulnerability of the birds",
        xlab = "Vulnerability scaled from 1 (highest risk) to 4 (lowest risk)",
        ylab = "Frequency",
        border = "purple",
        col = "violet")

barplot(table(birds$Habitat),
        main = "Bar plot for the habitat of the birds",
        xlab = "Habitat",
        ylab = "Frequency",
        border = "darkgoldenrod",
        col = "seashell")

# Summarise the age, speed, size and weight of the
# birds by calculating 5-number summaries and means.

summary(birds$Age)
summary(birds$Speed)
summary(birds$Size)
summary(birds$Weight)

# Draw box plots and histograms for the age, speed,
# size and weight of the birds.

boxplot(birds$Age, 
        horizontal = TRUE,
        main = "Box plot for the age of the birds",
        xlab = "Age (years)",
        border = "forestgreen",
        col = "lawngreen")

hist(birds$Age,
     main = "Histogram of the age of the birds",
     xlab = "Age (years)",
     border = "forestgreen",
     col = "lawngreen")

boxplot(birds$Speed, 
        horizontal = TRUE,
        main = "Box plot for the speed of the birds",
        xlab = "Speed (km per hour)",
        border = "peru",
        col = "papayawhip")

hist(birds$Speed,
     main = "Histogram of the speed of the birds",
     xlab = "Speed (km per hour)",
     border = "peru",
     col = "papayawhip")

boxplot(birds$Size, 
        horizontal = TRUE,
        main = "Box plot for the size of the birds",
        xlab = "Size (cm)",
        border = "hotpink",
        col = "pink")

hist(birds$Size,
     main = "Histogram of the size of the birds",
     xlab = "Size (cm)",
     border = "hotpink",
     col = "pink")

boxplot(birds$Weight, 
        horizontal = TRUE,
        main = "Box plot for the weight of the birds",
        xlab = "Weight (kg)",
        border = "midnightblue", 
        col = "skyblue")

hist(birds$Weight,
     main = "Histogram of the weight of the birds",
     xlab = "Weight (kg)",
     border = "midnightblue", 
     col = "skyblue")

# Apply logarithmic transformations to the size
# and to the weight of the birds.

birds$logSize <- log(birds$Size)
birds$logWeight <- log(birds$Weight)

# Draw box plots and histograms for the log-transformed
# size and the log-transformed weight of the birds.

boxplot(birds$logSize, 
        horizontal = TRUE,
        main = "Box plot for the log-transformed size of the birds",
        xlab = "ln(Size) where Size is in cm",
        border = "deeppink", 
        col = "pink")

hist(birds$logSize,
     main = "Histogram of the log-transformed size of the birds",
     xlab = "ln(Size) where Size is in cm",
     border = "deeppink", 
     col = "pink")

boxplot(birds$logWeight, 
        horizontal = TRUE,
        main = "Box plot for the log-transformed weight of the birds",
        xlab = "ln(Weight) where Weight is in kg",
        border = "navyblue",
        col = "skyblue")

hist(birds$logWeight,
     main = "Histogram of the log-transformed weight of the birds",
     xlab = "ln(Weight) where Weight is in kg",
     border = "navyblue",
     col = "skyblue")

# Test for normality using the Shapiro-Wilk test.

shapiro.test(birds$Size)
shapiro.test(birds$Weight)
shapiro.test(birds$logSize)
shapiro.test(birds$logWeight)

# Draw a scatter plot of the weight against the
# size of the birds.

plot(birds$Size, birds$Weight,
     main = "Scatter plot of the weight against the size of the birds",
     xlab = "Size (cm)", 
     ylab = "Weight (kg)",
     cex = 2,
     pch = 19, 
     col = "limegreen")

# Draw a scatter plot of the log-transformed weight
# against the log-transformed size of the birds.

plot(birds$logSize, birds$logWeight,
     main = "Scatter plot of the log-transformed weight against the log-transformed size of the birds",
     xlab = "ln(Size) where Size is in cm",
     ylab = "ln(Weight) where Weight is in kg",
     cex = 2,
     pch = 18,
     col = "seagreen")