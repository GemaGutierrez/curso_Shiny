# Curso: Introducción al Análisis de Datos Interactivos con Shiny
VIII Seminario - Análisis de datos avanzados en Ciencia de la Salud​

Bienvenido/a al repositorio oficial del curso: Introducción al análisis de datos interactivos con Shiny.

## Objetivo del curso

Aprender a:
   Crear aplicaciones web interactivas con Shiny sin necesidad de conocimientos web previos.
 
   Comprender la estructura reactiva (input → server → output).
 
   Visualizar y explorar datos psicológicos en tiempo real.
 
   Personalizar temas y comunicar resultados de forma atractiva.


## 🗂️ Estructura del repositorio


<pre>
curso_Shiny/
│
├── data/                      # Datos de ejemplo (p.ej. datos_psico.csv)
│
├── apps/                      # Aplicaciones Shiny usadas en el curso
│   ├── App0_mini_hist.R
│   ├── App1_explorador_bienestar.R
│   ├── App2_comparador_grupos.R
│   ├── App3_explorador_tema.R
│   └── App4_hist_final.R
│
├── slides/                    # Diapositivas y materiales de clase
│   └── Curso_Shiny.pptx
│
└── README.md                  # (este documento)
</pre>



## Requisitos 

Software

 R (≥ 4.0)
 RStudio

Paquetes de R

Instala los paquetes necesarios con:
  install.packages(c("shiny", "ggplot2", "bslib", "dplyr"))


## Cómo ejecutar las apps

Clona o descarga el repositorio:
 git clone https://github.com/tu_usuario/shiny-psicologia-course.git


Abre la carpeta en RStudio.

Abre cualquier script dentro de apps/.

Pulsa Run App o ejecuta:
   shiny::runApp("apps/App1_explorador_bienestar.R")


## Contenidos del curso

| Bloque | Título                          | App asociada |
| ------ | ------------------------------- | ------------ |
| 1      | Qué es Shiny                    | App0         |
| 2      | Funcionamiento  de Shiny        | App1         |
| 3      | Construir una App Básica        | App2         |
| 4      | Personalización y temas         | App3         |
| 5      | Ejercicio final (subida de CSV) | App4         |



## Datos de ejemplo

Archivo: data/datos_psico.csv

Dataset simulado con variables psicológicas:

| Variable       | Tipo     | Descripción                 |
| -------------- | -------- | --------------------------- |
| `genero`       | Factor   | Hombre / Mujer              |
| `edad`         | Numérica | 18–65 años                  |
| `estres`       | Numérica | Nivel de estrés percibido   |
| `satisfaccion` | Numérica | Nivel de satisfacción vital |
| `sueno`        | Numérica | Horas promedio de sueño     |


## Personalización visual (App 3)

La App3 muestra cómo aplicar temas visuales con bslib:

theme = bslib::bs_theme(
  bootswatch = "flatly",
  primary = "#2F80ED"
)

Puedes probar temas alternativos como: minty, united, yeti, cosmo.


## Créditos

Curso diseñado por Gema Gutiérrez Peña

📅 Duración: 2h 30 min

📍 Nivel: Introducción práctica

📧 Contacto: gema.gutierrez@urjc.es

## Licencia

Este material se distribuye bajo licencia

Creative Commons BY-NC-SA 4.0

Puedes reutilizarlo y adaptarlo con atribución y sin fines comerciales.
