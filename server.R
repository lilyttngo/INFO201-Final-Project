library(ggplot2)
library(plotly)
library(dplyr)

# Source file with dataframe



# Server
server <- function(input, output) {
  # Simulated data frame for illustration
  education_impact_df <- reactive({
    data.frame(
      Year = rep(2000:2019, 2),
      Education_Level = rep(c("Less than High School", "High School Graduate", 
                              "Some College or Associate's Degree", "Bachelor's Degree or Higher"), each = 20),
      Area_Type = rep(c("City", "Rural"), each = 20),
      Impact_on_Median_Income = runif(40, 10000, 50000), 
      Impact_on_Education_Level = runif(40, 1, 10) 
    )
  })
  
  # Render the selected plot based on user input
  output$impactPlot <- renderPlot({
    filtered_df <- education_impact_df() %>%
      filter(Area_Type %in% input$areaType)
    
    if(input$chartType == "Impact on Median Income") {
      ggplot(filtered_df, aes(x = Year, y = Impact_on_Median_Income, color = Area_Type)) +
        geom_line() +
        labs(title = "Impact of Education on Median Household Income Over Time",
             y = "Impact on Median Household Income", x = "Year") +
        theme_minimal()
    } else if(input$chartType == "Impact on Education Level") {
      ggplot(filtered_df, aes(x = Year, y = Impact_on_Education_Level, color = Area_Type)) +
        geom_line() +
        labs(title = "Changes in Education Level Over Time",
             y = "Change in Education Level", x = "Year") +
        theme_minimal()
    }
  })
}
