library(readr)
library(ggplot2)
library(dplyr)

nhanes_clean <- read.csv("data/cleaned_nhanes.csv")

# Scatter Plot
ggplot(
  nhanes_clean,
  aes(x = BMXHT, y = BMXWT, color = Physical_Activity)
) +
  geom_point(alpha = 0.6) +
  labs(
    title = "Height vs Weight by Physical Activity",
    x = "Height (cm)",
    y = "Weight (kg)"
  )

# Histogram
ggplot(
  nhanes_clean,
  aes(x = BMXBMI, fill = Physical_Activity)
) +
  geom_histogram(
    bins = 30,
    alpha = 0.7,
    position = "identity"
  ) +
  labs(
    title = "BMI Distribution",
    x = "BMI",
    y = "Count"
  )

# Boxplot
ggplot(
  nhanes_clean,
  aes(x = Physical_Activity, y = BMXBMI, fill = Physical_Activity)
) +
  geom_boxplot() +
  labs(
    title = "BMI by Physical Activity Level",
    x = "Activity Level",
    y = "BMI"
  )
