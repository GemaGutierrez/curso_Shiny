library(shiny)
library(ggplot2)

datos <- read.csv("datos_psico.csv")

ui <- fluidPage(
  titlePanel("Comparador de bienestar entre grupos"),
  sidebarLayout(
    sidebarPanel(
      selectInput("var", "Variable a analizar:", choices = c("estres", "satisfaccion", "sueno")),
      radioButtons("test", "Tipo de prueba:",
                   choices = c("t-test (paramétrico)" = "t",
                               "Wilcoxon (no paramétrico)" = "w"))
    ),
    mainPanel(plotOutput("plot"), verbatimTextOutput("resultado"))
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(datos, aes(x = genero, y = .data[[input$var]])) +
      geom_boxplot(fill = "lightgreen") +
      theme_minimal(base_size = 14) +
      labs(title = paste("Distribución de", input$var, "por género"), x = "género", y = input$var)
  })
  output$resultado <- renderPrint({
    y <- datos[[input$var]]
    g <- as.factor(datos$genero)
    if (input$test == "t") print(t.test(y ~ g)) else print(wilcox.test(y ~ g))
  })
}

shinyApp(ui, server)
