library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)


education <- read.csv("education.csv")
unemployment <- read.csv("unemployment.csv")

combined_df <- merge(unemployment, education, by = "FIPS_Code")

ui <- fluidPage(
  titlePanel("Median Household Income vs. Education Level"),
  sidebarLayout(
    sidebarPanel(
      selectInput("education_level", "Select Education Level:",
                  choices = unique(combined_df$Education_Level),
                  selected = unique(combined_df$Education_Level)[1])
    ),
    mainPanel(
      plotOutput("median_income_plot")
    )
  )
)


server <- function(input, output) {

  filtered_data <- reactive({
    combined_df %>%
      filter(Education_Level == input$education_level)
  })
  
  output$median_income_plot <- renderPlot({
    ggplot(filtered_data(), aes(x = Year, y = Median_Household_Income_2019, color = Education_Level)) +
      geom_line() +
      labs(y = "Median Household Income", title = "Impact of Education Levels on Median Household Income Over Time") +
      theme_minimal()
  })
}

shinyApp(ui, server)