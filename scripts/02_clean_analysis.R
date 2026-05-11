library(haven)
library(dplyr)
library(ggplot2)

demo <- read_xpt("data/P_DEMO (5).xpt")
bmx  <- read_xpt("data/P_BMX.xpt")
paq  <- read_xpt("data/P_PAQ.xpt")

nhanes <- demo %>%
  inner_join(bmx, by = "SEQN") %>%
  inner_join(paq, by = "SEQN")

nhanes_clean <- nhanes %>%
  select(
    SEQN,
    RIAGENDR,
    RIDAGEYR,
    RIDRETH3,
    DMDEDUC2,
    BMXBMI,
    BMXWT,
    BMXHT,
    PAQ605,
    PAQ620,
    PAD680
  ) %>%
  filter(RIDAGEYR >= 18) %>%
  filter(
    !is.na(BMXBMI),
    !is.na(BMXWT),
    !is.na(BMXHT),
    !is.na(PAQ605),
    !is.na(PAQ620),
    !is.na(PAD680)
  ) %>%
  filter(
    RIAGENDR %in% c(1, 2),
    DMDEDUC2 %in% c(1, 2, 3, 4, 5),
    PAQ605 %in% c(1, 2),
    PAQ620 %in% c(1, 2)
  ) %>%
  mutate(
    Sex = factor(
      RIAGENDR,
      levels = c(1, 2),
      labels = c("Male", "Female")
    ),
    
    Education = factor(
      DMDEDUC2,
      levels = c(1, 2, 3, 4, 5),
      labels = c(
        "Less than 9th grade",
        "9th-11th grade",
        "High school graduate",
        "Some college/AA",
        "College graduate or above"
      )
    ),
    
    Activity_Level = case_when(
      PAQ605 == 1 ~ "Vigorous Activity",
      PAQ605 == 2 & PAQ620 == 1 ~ "Moderate Activity",
      PAQ605 == 2 & PAQ620 == 2 ~ "Low Activity"
    ),
    
    Activity_Level = factor(
      Activity_Level,
      levels = c(
        "Low Activity",
        "Moderate Activity",
        "Vigorous Activity"
      )
    )
  )

write.csv(
  nhanes_clean,
  "data/cleaned_nhanes.csv",
  row.names = FALSE
)

View(nhanes_clean)