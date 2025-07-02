# installing and running “difR” package
install.packages("difR")
library(difR)

# viewing data
dim(data)
head(data)

# analyzing the data by Angoff’s Method
difTID(data[, 1:20], group = data[, 21], focal.name = 1)

# perpendicular distances – graph
plot(difTID(data[, 1:20], group = data[, 21], focal.name = 1))

# delta points – graph
plot(difTID(data[, 1:20], group = data[, 21], focal.name = 1), plot = "delta")
