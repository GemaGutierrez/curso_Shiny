library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Tu primer histograma interactivo"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Sube tu CSV", accept = ".csv"),
      uiOutput("var_ui"),
      sliderInput("bins", "Número de bins:", min = 5, max = 50, value = 20)
    ),
    mainPanel(plotOutput("hist"))
  )
)

server <- function(input, output) {
  datos <- reactive({ req(input$file); read.csv(input$file$datapath) })
  output$var_ui <- renderUI({
    req(datos())
    nums <- names(Filter(is.numeric, datos()))
    selectInput("var", "Variable:", choices = nums)
  })
  output$hist <- renderPlot({
    req(input$var)
    ggplot(datos(), aes(.data[[input$var]])) +
      geom_histogram(bins = input$bins, fill = "skyblue", color = "white") +
      theme_minimal(base_size = 14) +
      labs(title = paste("Histograma de", input$var))
  })
}

shinyApp(ui, server)
