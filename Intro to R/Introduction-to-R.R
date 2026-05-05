# Introduction to R

# EXAMPLE: Calculate the circumference of a circle.

# Assign the value of the radius to a variable
# named radius.

radius <- 7

# Assign the calculated value of the circumference
# to a variable named circumference.

circumference <- 2 * pi * radius

# EXAMPLE: Function to calculate the area of a circle.

# Create a function called area() to calculate the
# area of a circle using the argument radius.

area <- function(radius){
  f <- pi * (radius ^ 2)
  return(f)
}

# Calculate the area for a specified value of
# the radius.

area(13)

# EXAMPLE: Determine whether a person is a teenager.

# Use an if statement to verify whether the person
# is a teenager.

age <- 13
if(age > 12 & age < 20){
  print("Person is a teenager")
}

# Use if and else statements to assign TRUE or
# FALSE to the Boolean variable teen based on
# the value of age.

age <- 7
if(age > 12 & age < 20){
  teen <- TRUE
} else{
  teen <- FALSE
}

# EXAMPLE: Gauss summation.

# Calculate 1 + 2 + 3 + ... + 100.

n <- 100
sum <- 0
for(j in 1:n){
  sum <- sum + j
}