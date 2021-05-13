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

#part b, ii
    # 