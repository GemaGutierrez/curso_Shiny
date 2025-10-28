library(shiny)
library(ggplot2)

datos <- read.csv("datos_psico.csv")

ui <- fluidPage(
  titlePanel("Explorador de bienestar psicológico"),
  sidebarLayout(
    sidebarPanel(
      selectInput("var_y", "Variable de interés:", choices = c("estres", "satisfaccion", "sueno")),
      selectInput("var_x", "Agrupar por:", choices = c("genero", "edad")),
      checkboxInput("puntos", "Mostrar puntos individuales", TRUE)
    ),
    mainPanel(plotOutput("grafico"), textOutput("texto"))
  )
)

server <- function(input, output) {
  output$grafico <- renderPlot({
    ggplot(datos, aes(x = .data[[input$var_x]], y = .data[[input$var_y]])) +
      geom_boxplot(fill = "lightblue") +
      { if (input$puntos) geom_jitter(width = 0.1, alpha = 0.5) else NULL } +
      theme_minimal(base_size = 14) +
      labs(x = input$var_x, y = input$var_y,
           title = paste("Distribución de", input$var_y, "por", input$var_x))
  })
  output$texto <- renderText({
    paste("Visualizando", input$var_y, "por", input$var_x)
  })
}

shinyApp(ui, server)
