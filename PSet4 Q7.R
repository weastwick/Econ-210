library(readxl)

data <- read_excel("~/Documents/GitHub/Econ-210/birthweight_smoking.xlsx")

#part a

lm(birthweight ~ smoker, data = data)

#part a
    # Estimated difference in average birthweight for smokers vs.
    # non-smokers is 253.2 grams

#part b

model <- lm(birthweight ~ smoker + alcohol + nprevist, data = data)

#part b, i
    # If we wish to interpret part (a)'s regression as causal, other variables
    # such as Alcohol and Nprevist that may have a causal effect will be
    # excluded, which constitutes as omitted variable bias.

model

#part b, ii
    # Yes it is substantially different from the regression in (a).
    # An estimated effect of 253.2 grams changing to 217.58 grams is significant
    # therefore this is suggestive that there was omitted variable bias before
    # that this regression at least helps to fix.

predict(model, newdata = data.frame(smoker = 1, alcohol = 0, nprevist = 8))

#part b, iii
    # Predicted birth weight from the model is 3106.228 grams.

summary(model)

#part b, iv
    # R^2 = 0.07285, Adjusted R^2 = 0.07192
    # These are very similar because the sample size is very large (3000)
    # and the number of regressors is small in comparison so the penalty for
    # adding regressors is small ((n-1) / (n-k-1)) ~ 1.

#part b, v
    # Given Nprevist is a control variable, we should NOT interpret it as
    # causal. It should be solely interpreted as what makes our other coefficients
    # in the model consistent for our causal interpretation. It does NOT
    # measure a causal effect of prenatal visits on birth weight.

#part c

smoker <- lm(smoker ~ alcohol + nprevist, data = data)

birthweight <- lm(birthweight ~ alcohol + nprevist, data = data)

residuals <- data.frame(U1 = residuals(smoker), U2 = residuals(birthweight))

verification <- lm(U2 ~ U1, data = residuals)

verification


