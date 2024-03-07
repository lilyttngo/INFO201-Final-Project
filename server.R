library(ggplot2)
library(plotly)
library(dplyr)

# Source file with dataframe



# Server

server <- function(input, output) {
  
  # Simulated data frame for illustration
  education_impact_df <- reactive({
    data.frame(
      Year = rep(2000:2019, each = 4),
      Education_Level = rep(c("Less than High School", "High School Graduate", 
                              "Some College or Associate's Degree", "Bachelor's Degree or Higher"), times = 20),
      Area_Type = rep(c("City", "Rural"), each = 40),
      Impact_on_Median_Income = runif(80, 10000, 50000), 
      Impact_on_Education_Level = runif(80, 1, 10) 
    )
  })
  
  # Render the selected plot based on user input
  output$impactPlot <- renderPlot({
    filtered_df <- education_impact_df() %>%
      filter(Area_Type %in% input$areaType)
    
    if(input$chartType == "Impact on Median Income") {
      ggplot(filtered_df, aes(x = Year, y = Impact_on_Median_Income, color = Education_Level)) +
        geom_line() +
        labs(title = "Impact of Education on Median Household Income Over Time",
             y = "Impact on Median Household Income", x = "Year") +
        theme_minimal()
    } else if(input$chartType == "Impact on Education Level") {
      ggplot(filtered_df, aes(x = Year, y = Impact_on_Education_Level, color = Education_Level)) +
        geom_line() +
        labs(title = "Changes in Education Level Over Time",
             y = "Change in Education Level", x = "Year") +
        theme_minimal()
    }
  })
  
  # Render the analysis text
  output$analysisText <- renderText({
    "Our analysis over the past two decades shows that counties with higher levels of educational attainment
    typically exhibit not only higher median wages but also lower unemployment rates. This trend highlights
    the critical role of education in securing economic prosperity and stability. Notably, the data suggests
    that urban areas, with a higher concentration of individuals holding bachelor's degrees or higher, tend
    to outperform rural areas in both median wages and employment rates."
  })
}

# Run the application 
shinyApp(ui = ui, server = server)


# Run the application
shinyApp(ui = ui, server = server)

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
output$analysisText <- renderText({
    return("The analysis of education's impact on median household income over the last two decades reveals considerable variability. Notably, education seems to have a more pronounced impact on income in urban areas, which may be attributed to the concentration of jobs requiring higher educational qualifications. In contrast, rural areas show greater fluctuations, with recent trends indicating a potential downturn in income benefits from education. These findings underscore the complex relationship between educational attainment and economic prosperity, which is influenced by a myriad of factors beyond education itself.")
})
}
