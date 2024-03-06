library("shiny")
library("shinythemes")
library("plotly")

ui <- fluidPage(
  theme = shinytheme("flatly"),
  titlePanel("Employment Rates by Educational Attainment From 2015 To 2019"),
  tabsetPanel(
    tabPanel("Project Overview", fluid = TRUE, sidebarLayout(
      sidebarPanel(
        h3("BACKGROUND | The Unseen Dynamics of Education and Employment In America"),
        p("In a rapidly evolving society, where the connection between education 
          and employment plays a pivotal role in shaping individual destinies, our
          project aims to delve into the intricacies of the American education system 
          and its profound impact on career trajectories."),
        p("Our project addresses fundamental life issues like education and employment
          which impact millions of Americans. The struggles and successes of individuals 
          navigating the education-to-employment pipeline resonate with a broad audience,
          making the project universally relatable."),
        h3("RESEARCH QUESTION | Questions that We Should Consider"),
        p("The", strong("overarching research question"), "for this project is:
          How Much Are People Making Per Year Based On How Educated They Are From 2015 To 2019?"),
        p("Income VS Timeline:"),
        p("- What is the average annual income for individuals with different levels of education, 
          such as less than a high school diploma, a high school diploma only,
          some college or associate's degree, and a bachelor's degree?"),
        p("Timeline:"),
        p("- How have changes in education funding and policy impacted employment 
          rates and income levels over the last few decades?"),
        p("Location:"),
        p("- How does the distribution of education levels vary across different regions, and 
          what impact does this have on regional economic development?")
        p("What is the correlation between the proportion of adults with a bachelor's degree or higher 
          and median household income in different countries, and how does this vary across states?"),
        p("How have changes in education levels over time impacted median household income across different
          rural and urban areas?"),
          h3("OUR PROJECT | Our Goal and Why Do We Care"),
        p("Our exploration doesn't shy away from questioning or contradicting common assumptions. By
          challenging preconceived notions about the direct correlation between education levels and 
          employment outcomes, our project will encourage a reevaluation of the beliefs of society."
        p("Our project aims to provide intelligent insights into the complexities of the education-
          employment chain. By doing so, we offer a thought-provoking examination that can spark discussions 
          and inspire positive change."),
        h3("THE DATA | 2015-2019 Employment Rates by Educational Attainment In the United States",
        p("The first dataset used throughout this project is called Education from kaggle.com. This document 
          lists every county within every state in the United States. Additionally, it details the population and the
          percentage of adults with educational qualifications ranging from less than a high school diploma, a high school diploma only,
          some college or associate's degree, and a bachelor's degree from the year 2015 to 2019."),
        p("The second dataset used throughout this project is called Income from kaggle.com. This document presents the mean income of 
          individuals from each county across all states in the US."), 

          

      ),
      mainPanel(
        
      )
    ))
  )
)
