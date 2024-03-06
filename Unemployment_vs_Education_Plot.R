library(shiny)
library(dplyr)
library(ggplot2)


education <- read.csv("education.csv")
unemployment <- read.csv("unemployment.csv")

combined_df <- merge(unemployment, education, by = "FIPS_Code")

ui <- fluidPage(
  titlePanel("Unemployment vs Education"),
  sidebarLayout(
    sidebarPanel(
      # Education level dropdown
      selectInput("edu_level", "Select Education Level:",
                  choices = unique(combined_df$Education_Level),
                  selected = "Less than High School")
    ),
    mainPanel(
      plotOutput("education_unemployment_plot")
    )
  )
)


server <- function(input, output) {
  # Filter data based on selected education level
  filtered_data <- reactive({
    combined_df %>%
      filter(Education_Level == input$edu_level)
  })
  
  output$education_unemployment_plot <- renderPlot({
    ggplot(filtered_data(), aes(x = Year, y = Unemployment_Rate)) +
      geom_line() +
      labs(y = "Unemployment Rate", title = paste("Unemployment vs Education -", input$edu_level),
           x = "Year") +
      theme_minimal()
  })
}

shinyApp(ui, server)
