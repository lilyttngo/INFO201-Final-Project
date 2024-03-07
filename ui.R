library("shiny")
library("shinythemes")
library("plotly")
source(" ")
## OVERVIEW TAB INFO 
ui <- fluidPage(
  theme = shinytheme("flatly"),
  titlePanel("Employment Rates by Educational Attainment From 2015 To 2019"),w
  tabsetPanel(
    tabPanel("Project Overview", fluid = TRUE, sidebarLayout(
      sidebarPanel(
        h1("BACKGROUND | The Unseen Dynamics of Education and Employment In America"),
        p("In a rapidly evolving society, where the connection between education 
          and employment plays a pivotal role in shaping individual destinies, our
          project aims to delve into the intricacies of the American education system 
          and its profound impact on career trajectories."),
        p("Our project addresses fundamental life issues like education and employment
          which impact millions of Americans. The struggles and successes of individuals 
          navigating the education-to-employment pipeline resonate with a broad audience,
          making the project universally relatable."),
        h1("RESEARCH QUESTION | Questions that We Should Consider"),
        p("The", strong("overarching research question"), "for this project is:
          How Much Are People Making Per Year Based On How Educated They Are From 2015 To 2019?"),
        p("Income VS Education Levels:"),
        p("- What is the average annual income for individuals with different levels of education, 
          such as less than a high school diploma, a high school diploma only,
          some college or associate's degree, and a bachelor's degree?"),
        p("Timeline:"),
        p("- Over the past two decades, how has the evolution of educational attainment levels
          within counties influenced their median wages and unemployment rates"),
        p("Location:"),
        p("- How does the distribution of education levels vary across different regions, and 
          what impact does this have on regional economic development?"),
        p("What is the correlation between the proportion of adults with a bachelor's degree or higher 
          and median household income in different countries, and how does this vary across states?"),
        p("How have changes in education levels over time impacted median household income across different
          rural and urban areas?"),
        h1("OUR PROJECT | Our Goal and Why Do We Care"),
        p("Our exploration doesn't shy away from questioning or contradicting common assumptions. By
          challenging preconceived notions about the direct correlation between education levels and 
          employment outcomes, our project will encourage a reevaluation of the beliefs of society."),
        p("Our project aims to provide intelligent insights into the complexities of the education-
          employment chain. By doing so, we offer a thought-provoking examination that can spark discussions 
          and inspire positive change."),
        h1("THE DATA | 2015-2019 Employment Rates by Educational Attainment In the United States",
        p("The first dataset used throughout this project is called Education from kaggle.com. This document 
          lists every county within every state in the United States. Additionally, it details the population and the
          percentage of adults with educational qualifications ranging from less than a high school diploma, a high school diploma only,
          some college or associate's degree, and a bachelor's degree from the year 2015 to 2019."),
        p("The second dataset used throughout this project is called Income from kaggle.com. This document presents the mean income of 
          individuals from each county across all states in the US."), 
        h1("ABOUT US | Authors and Affiliation"),
             p(strong("Authors:"),"Joel Elangovan, Ziwen Meng, Lily Ngo, Connor Yan"),
             p(strong("Affiliation:"),"INFO 201: Foundational Skills for Data Science"),
             p("The Information School, The University of Washington"),
             p("Winter 2024")
          ),
          
          mainPanel(
            img(src = "https://files.stlouisfed.org/files/htdocs/publications/images/uploads/2016/POE201701icon_20161228040109.png",
                width = "95%", height = "95%"),
            p(""),
            img(src="https://scholasticadministrator.typepad.com/.a/6a00e54f8c25c9883401348777dc53970c-popup",
                width="95%", height="95%"),
            p(""),
            img(src="https://bachelors-completion.northeastern.edu/wp-content/uploads/2020/06/iStock-1162366190-1-1.jpg",
                width="95%", height="95%"),
          ) 
        )
      )
    )
  )
)
## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_1_main_panel <- mainPanel(
  h2("Vizualization 1 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_1_tab <- tabPanel("Viz 1 tab title",
  sidebarLayout(
    viz_1_sidebar,
    viz_1_main_panel
  )
)

## VIZ 2 TAB INFO

ui <- fluidPage(
  titlePanel("Educational Impact on Wages and Unemployment"),
  sidebarLayout(
    sidebarPanel(
      selectInput("chartType", 
                  label = "Select Chart Type",
                  choices = c("Impact on Median Wages", "Impact on Unemployment Rates"),
                  selected = "Impact on Median Wages")
    ),
    mainPanel(
      plotOutput("plot"),
      hr(), # Add a horizontal line for better separation
      h3("Analysis Overview")
    )
  )
)

shinyApp(ui, server)

## VIZ 3 TAB INFO

ui <- fluidPage(
  titlePanel("Education Impact Analysis"),
  sidebarLayout(
    sidebarPanel(
      selectInput("chartType", 
                  label = "Select Chart Type",
                  choices = c("Impact on Median Income", "Impact on Education Level"),
                  selected = "Impact on Median Income"),
      checkboxGroupInput("areaType", 
                         label = "Select Area Type",
                         choices = c("City", "Rural"),
                         selected = c("City", "Rural"))
    ),
    mainPanel(
      plotOutput("impactPlot"),
      hr(),  # Horizontal line for separation
      h4("Analysis"),  # Header for the analysis section
      textOutput("analysisText")  # Output for analysis text
    )
  )
)
## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Conclusion Tab Title",
 h1("Some title"),
 p("some conclusions")
)



ui <- navbarPage("Example Project Title",
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)
