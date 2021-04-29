library(readxl)

schools <- read_excel("caschool.xlsx")
dim(schools)
# part a
  # There are 420 observations in the data set

schools$income <- schools$avginc * 1000

# part b, i
  # income measures the average district income in dollars

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
  # mean and sd of income are what I expected because under the linear
  # transformation of multiplied by 1000, mean and sd also get
  # multiplied by 1000, which is what we see here.

mean(schools$math_scr)

# part c, i
  # [1] 653.3426 is the mean math score across all districts

small_class <- subset(schools, str <= 20)
dim(small_class) / dim(schools)
mean(small_class$math_scr)

# part c, ii
  # [1] 0.5785714 -> 57.85714% is the fraction with average class size of
  # 20 or fewer students.
  # [1] 655.7177 is the mean math score in these districts.

large_class <- subset(schools, str > 20)
dim(large_class) / dim(schools)
mean(large_class$math_scr)

# part c, iii
  # [1] 0.4214286 -> 42.14286% is the fraction with average class size
  # over 20 students
  # [1] 650.0819 is the mean math score in these districts

# part c, iv
  # part c, i's mean is a weighted average of the means in parts ii and iii
  # weighted by their percentages.

t.test(small_class$math_scr, large_class$math_scr, conf.level = 0.9)

# part c, v
  # H(0): mean(small_class$math_scr) -  mean(large_class$math_scr) = 0
  # H(1): mean(small_class$math_scr) -  mean(large_class$math_scr) != 0

  # H(0): E[math_scr | small_class] - E[math_scr | large_class] = 0
  # H(1): E[math_scr | small_class] - E[math_scr | large_class] != 0
  # From the test, p-value = 0.001928 < 0.1 so we say this is statistically
  # significant and we choose to reject H(0).

cov(schools$avginc, schools$math_scr)
cov(schools$income, schools$math_scr)

# part c, vi
  # [1] 94.7795 is the covariance between avginc and math_scr
  # [1] 94779.5 is the covariance between income and math_scr
  # The two covariances are different. One of the properties of covariance
  # is Cov(a + bX, Y) = b * Cov(X, Y), where in this case income is a 
  # linear transformation of avginc because it is avginc * 1000. Therefore
  # the covariance of income and math_scr is 1000 time the covariance of
  # avginc an math_scr.

cor(schools$avginc, schools$math_scr)
cor(schools$income, schools$math_scr)

# part c, vii
  # [1] 0.6993981 is the correlation between avginc and math_scr
  # [1] 0.6993981 is the correlation between income and math_scr
  # The correlations are the same. In calculating correlation, 
  # Cov(X, Y) / sqrt(Var(X) * Var(Y)), as seen in part vi, covariance
  # of income and math_scr is 1000 times the covariance of avginc and
  # math_scr. However, the variance of income is 1000^2 times the variance
  # of avginc because Var(bX) = b^2 * Var(X). Therefore taking the sqrt,
  # the denominator also increases by 1000, which cancels out, which is why
  # the correlations are the same.

