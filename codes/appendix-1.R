# installing and running “psych” package
install.packages("psych")
library(psych)

# setting seed for data generation
set.seed(12)

# generating data
data_rasch <- sim.rasch(nvar = 20, n = 200, low = -2, high = 2,
                        d = NULL, a = 1, mu = 0, sd = 1)
# viewing data
data_rasch$items

# creating gender groups
x <- c(1, 0)
gender <- c(rep(1, times = 100), rep(0, times = 100))

# adding gender groups to the data
data <- cbind(data_rasch$items, gender)

# manipulating data – Item1 & Item5
data[1:50, 1] <- rep(0, times = 50)
data[1:30, 5] <- rep(0, times = 30)

# viewing final data
data