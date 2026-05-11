library(readr)
library(ggplot2)
library(dplyr)
library(psych)

# Load cleaned dataset
nhanes_clean <- read.csv("data/cleaned_nhanes.csv")

# Multivariate Scatter Plot
ggplot(
  nhanes_clean,
  aes(
    x = BMXHT,
    y = BMXWT,
    color = Sex
  )
) +
  geom_point(alpha = 0.6) +
  facet_wrap(~Education) +
  labs(
    title = "Height vs Weight by Sex and Education",
    x = "Height (cm)",
    y = "Weight (kg)",
    color = "Sex"
  )

# Correlation Matrix
pairs.panels(
  nhanes_clean[, c("RIDAGEYR", "BMXWT", "BMXHT", "BMXBMI")],
  method = "pearson",
  hist.col = "lightblue",
  density = TRUE,
  ellipses = TRUE
)

# Save correlation matrix output
sink("output/multivariate_results.txt")

cor(
  nhanes_clean[, c("RIDAGEYR", "BMXWT", "BMXHT", "BMXBMI")],
  use = "complete.obs"
)

sink()
