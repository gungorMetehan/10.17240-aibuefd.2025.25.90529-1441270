# viewing data
data

# separating the focus and the reference groups
women <- subset(data, gender == 1)
men <- subset(data, gender == 0)

# calculating p values
FocColMeans <- colMeans(women[, 1:20])
RefColMeans <- colMeans(men[, 1:20])

# calculating delta values
DeltaFoc <- 4*qnorm(1 - FocColMeans) + 13
DeltaRef <- 4*qnorm(1 - RefColMeans) + 13

# calculating the required statistics
x1 <- mean(DeltaFoc)
x0 <- mean(DeltaRef)
VarFoc <- var(DeltaFoc)
VarRef <- var(DeltaRef)
Covariance <- cov(DeltaFoc, DeltaRef)

# calculating perpendicular distances, a and b
b <- (VarFoc - VarRef + sqrt((VarFoc - VarRef)^2 + 4*Covariance^2)) / (2*Covariance)
a <- x1 - b*x0
D <- (b*DeltaRef + a - DeltaFoc) / sqrt(b^2 + 1)

# flagging DIF items
Treshold <- D < -1.5 | D > 1.5
Flag <- ifelse(Treshold == "TRUE", "***", "-")

# stats
Stats <- cbind(Women_p = FocColMeans, Men_p = RefColMeans, Women_Delta = round(DeltaFoc, 4), 
               Men_Delta = round(DeltaRef, 4), Distance = round(D, 4))
cbind(as.data.frame(Stats), Flag)

# graph
plot(DeltaRef, DeltaFoc, pch = 4)
abline(a, b, col = "blue")