library(ggplot2)
library(plotly)
library(dplyr)

# Read in data
df <- read.csv("https://github.com/melaniewalsh/Neat-Datasets/blob/main/NationalNames.csv?raw=true")

# Filter the data in some way (aka pick a subset of names to examine — it's too large to include all names for all years)
top_names <- df %>% 
  group_by(Name) %>% 
  summarize(total = sum(Count)) %>% 
  slice_max(n = 100, order_by = total)

subset_df <- df %>% filter(Name %in% top_names$Name)

server <- function(input, output) {

  output$names_plot <- renderPlotly({

    filtered_df <- subset_df %>% 
      # Filter for user's gender selection
      filter(Gender %in% input$gender_selection) %>%
      # Filter for user's name selection
      filter(Name %in% input$name_selection) %>% 
      # Filter for user's year selection
      filter(Year > input$year_selection[1] & Year < input$year_selection[2])
    
    # Line plot
    names_plot <- ggplot(data = filtered_df) +
      geom_line(mapping = 
                  aes(x = Year, 
                      y = Count, 
                      color = Name))

    return(names_plot)
    
  })

}

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
