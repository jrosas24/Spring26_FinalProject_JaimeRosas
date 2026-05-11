library(dplyr)

# Load cleaned dataset
nhanes_clean <- read.csv("data/cleaned_nhanes.csv")

# Descriptive statistics for quantitative variables
nhanes_clean %>%
  summarise(
    Mean_BMI = mean(BMXBMI, na.rm = TRUE),
    Median_BMI = median(BMXBMI, na.rm = TRUE),
    SD_BMI = sd(BMXBMI, na.rm = TRUE),
    Min_BMI = min(BMXBMI, na.rm = TRUE),
    Max_BMI = max(BMXBMI, na.rm = TRUE),
    
    Mean_Age = mean(RIDAGEYR, na.rm = TRUE),
    Median_Age = median(RIDAGEYR, na.rm = TRUE),
    SD_Age = sd(RIDAGEYR, na.rm = TRUE),
    
    Mean_Weight = mean(BMXWT, na.rm = TRUE),
    Median_Weight = median(BMXWT, na.rm = TRUE),
    SD_Weight = sd(BMXWT, na.rm = TRUE)
  )

# Frequency tables for categorical variables
table(nhanes_clean$Sex)
prop.table(table(nhanes_clean$Sex))

table(nhanes_clean$Education)
prop.table(table(nhanes_clean$Education))

table(nhanes_clean$Activity_Level)
prop.table(table(nhanes_clean$Activity_Level))

# Mean BMI by activity level
nhanes_clean %>%
  group_by(Activity_Level) %>%
  summarise(
    Mean_BMI = mean(BMXBMI, na.rm = TRUE),
    SD_BMI = sd(BMXBMI, na.rm = TRUE),
    Count = n()
  )

# ANOVA test
anova_result <- aov(BMXBMI ~ Activity_Level, data = nhanes_clean)

summary(anova_result)

# Post-hoc test
TukeyHSD(anova_result)
