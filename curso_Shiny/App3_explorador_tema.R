library(shiny)
library(bslib)
library(ggplot2)

datos <- read.csv("datos_psico.csv")

ui <- fluidPage(
  theme = bs_theme(bootswatch = "flatly"),
  titlePanel("Dashboard de bienestar psicológico"),
  sidebarLayout(
    sidebarPanel(
      selectInput("var", "Variable:", choices = c("estres", "satisfaccion", "sueno")),
      checkboxInput("puntos", "Mostrar puntos", TRUE)
    ),
    mainPanel(plotOutput("grafico"))
  )
)

server <- function(input, output) {
  output$grafico <- renderPlot({
    ggplot(datos, aes(x = genero, y = .data[[input$var]])) +
      geom_boxplot(fill = "lightblue") +
      { if (input$puntos) geom_jitter(width = 0.2, alpha = 0.4) else NULL } +
      labs(title = paste("Distribución de", input$var, "por género"), x = "género", y = input$var) +
      theme_minimal(base_size = 14)
  })
}

shinyApp(ui, server)
