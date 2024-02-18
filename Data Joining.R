library(dplyr)

income_by_state <- income_df %>%
  group_by(State_Name) %>%
  summarize(Average_Income = mean(Mean, na.rm = TRUE))

combined_df <- inner_join(income_df, education_df, by = c("Mean" = "Total"))




