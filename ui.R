library("shiny")
library("shinythemes")
library("plotly")
source()
ui<-fluidPage(
  theme=shinytheme("flatly"),
  titlePanel("Employment Rates by Educational Attainment")，
  tabsetPanel(
    tabPanel("Project Overview",fluid=TRUE,sidebarLayout(
      sidebarPanel(
        h1("BACKGROUND | The Unseen Dynamics of Education and Employment In America"),
        p("In a rapidly evolving society, where the connection between education 
          and employment plays a pivotal role in shaping individual destinies, our
          project aims to delve into the intricacies of the American education system 
          and its profound impact on career trajectories."),
        p("Our project addresses fundamental life issues like education and employment
          which impact millions of Americans. The struggles and successes of individuals 
          navigating the education-to-emplopyment pipeline resonate with a broad audience,
          making the project universally relatable.")
        h2("RESEARCH QUESTION | Questions that We Should Consider"),
        p("The",strong("overarching research question"),"for this project is:
          How Much Are People Making Per Year Based On How Educated They Are?")，
        p("-What is the average annual income for individuals with different levels of education, 
          such as high school diplomas, bachelor's, master's, and doctoral degree?"),
        p("-How have changes in education levels over time impacted median household income across 
          different rural and urban areas?"),
        p(-"What is the correlation between the proportion of adults with a bachelor's degree or
          higher and median household income in different countries, and how does this vary
          across states?")，
        p(-"How have changes in education funding and policy impacted employment 
          rates and income levels over the last few decades?")，
        p(-"How does the distribution of education levels vary across different regions, and 
        what impact does this have on regional economic development?"),
  )
    )))
  )
