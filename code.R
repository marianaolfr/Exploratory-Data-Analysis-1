install.packages("UsingR")
library(UsingR)

## dataset of heighs of fathers and sons
x = father.son$fheight

## how many individuas we have
length(x)

## report a sample of twenty | also round the returning values
round(sample(x, 20), 1)

## histogram: is a visual description of date
bins <- seq(floor(min(x)), ceiling(max(x)))
hist(x,
     breaks = bins,
     xlab = "Height in inches",
     main = "Height histogram")

## CDF
xs <- seq(floor(min(x)), ceiling(max(x)), 0.1)
plot(xs,
     ecdf(x)(xs),
     type = "l",
     xlab = "Height in inches",
     ylab = "F(x)")

## Normal approximation (Gaussian distribution)
# checking what is the percent of individuals above 70 inches
mean(x > 70)
# now using pnorm function
1 - pnorm(70, mean(x), sd(x))

## QQ-plot
ps <- seq(0.01, 0.99, 0.01)
qs <- quantile(x, ps)
normalqs <- qnorm(ps, mean(x), sd(x))
plot(normalqs, qs, xlab = "Normal percentiles", ylab = "Height percentiles")
abline(0, 1) #identity line

# using r function 
qqnorm(x)
qqline(x)
