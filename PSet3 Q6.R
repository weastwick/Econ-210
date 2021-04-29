library(readxl)

schools <- read_excel("caschool.xlsx")
dim(schools)
# part a
  # There are 420 observations in the data set

schools$income <- schools$avginc * 1000

# part b, i
  # income measues the average district income in dollars

mean(schools$avginc)
sd(schools$avginc)

# part b, ii
  # [1] 15.31659 is the mean of avginc
  # [1] 7.22589 is the standard deviation of avginc

mean(schools$income)
sd(schools$income)

# part b, iii
  # [1] 15316.59 is the mean of income
  # [1] 7225.89 is the standard deviation of income








