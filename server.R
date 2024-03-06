library(ggplot2)
library(plotly)
library(dplyr)

# Source file with dataframe



# Server
server <- function(input, output) {
#Viz 3
# Render plot for Question 1
  output$viz_3_output_education <- renderPlotly({
    # 
  ggplot(results_df, aes(x = Year, y = Impact_on_Median_Wages, color = Education_Level)) +
  geom_line() +
  labs(y = "Impact on Median Wages", title = "Impact of Education Levels on Median Wages Over Time") +
  theme_minimal()

ggplot(results_df, aes(x = Year, y = Impact_on_Unemployment, color = Education_Level)) +
  geom_line() +
  labs(y = "Impact on Unemployment Rates", title = "Impact of Education Levels on Unemployment Rates Over Time") +
  theme_minimal()
  })
}
  # Render plot for Question 2
  output$viz_3_output_income <- renderPlotly({
    # ggplot(education_impact_df, aes(x = Year, y = Impact_on_Median_Income, color = Area_Type)) +
  geom_line() +
  labs(title = "Impact of Education on Median Household Income Over Time",
       y = "Impact on Median Household Income", x = "Year") +
  theme_minimal()


ggplot(education_impact_df, aes(x = Year, y = Impact_on_Education_Level, color = Area_Type)) +
  geom_line() +
  labs(title = "Changes in Education Level Over Time",
       y = "Change in Education Level", x = "Year") +
  theme_minimal()
  })
