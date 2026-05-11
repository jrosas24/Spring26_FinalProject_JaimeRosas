library(readr)
library(ggplot2)
library(dplyr)

nhanes_clean <- read.csv("data/cleaned_nhanes.csv")

# Scatter Plot: Height vs Weight by Activity Level
ggplot(
  nhanes_clean,
  aes(x = BMXHT, y = BMXWT, color = Activity_Level)
) +
  geom_point(alpha = 0.6) +
  labs(
    title = "Height vs Weight by Physical Activity Level",
    x = "Height (cm)",
    y = "Weight (kg)",
    color = "Activity Level"
  )

# Histogram: BMI Distribution by Activity Level
ggplot(
  nhanes_clean,
  aes(x = BMXBMI, fill = Activity_Level)
) +
  geom_histogram(
    bins = 30,
    alpha = 0.7,
    position = "identity"
  ) +
  labs(
    title = "BMI Distribution by Physical Activity Level",
    x = "BMI",
    y = "Count",
    fill = "Activity Level"
  )

# Boxplot: BMI by Activity Level
ggplot(
  nhanes_clean,
  aes(x = Activity_Level, y = BMXBMI, fill = Activity_Level)
) +
  geom_boxplot() +
  labs(
    title = "BMI by Physical Activity Level",
    x = "Physical Activity Level",
    y = "BMI",
    fill = "Activity Level"
  )

# Multivariate Plot: BMI by Activity Level and Sex
ggplot(
  nhanes_clean,
  aes(x = Activity_Level, y = BMXBMI, fill = Activity_Level)
) +
  geom_boxplot() +
  facet_wrap(~ Sex) +
  labs(
    title = "BMI by Physical Activity Level and Sex",
    x = "Physical Activity Level",
    y = "BMI",
    fill = "Activity Level"
  )