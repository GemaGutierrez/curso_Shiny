library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Mini-histograma reactivo"),
  sliderInput("bins", "Número de bins:", min = 5, max = 50, value = 20),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    ggplot(data.frame(x = rnorm(500)), aes(x)) +
      geom_histogram(bins = input$bins, fill = "lightblue", color = "white") +
      theme_minimal(base_size = 14) +
      labs(title = paste("Histograma con", input$bins, "bins"))
  })
}

shinyApp(ui, server)
