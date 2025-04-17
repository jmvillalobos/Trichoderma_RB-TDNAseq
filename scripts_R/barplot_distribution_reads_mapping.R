# Cargar las librerías necesarias
install.packages("ggplot2")
library(ggplot2)

# Crear el dataframe con los datos
data <- data.frame(
  Category = c("Reads without recognizable, compliant barcodes", 
               "Query sequences with compliant barcodes", 
               "Reads mapped to genome", 
               "Reads mapped to insertion/plasmid sequence"),
  Reads = c(542197, 9570254, 7174709, 1640341)
)  
print(data)
ggplot(data, aes(x = Category, y = Reads, fill = Category)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(
    title = "Distribución de Reads",
    x = "Categoría de Reads",
    y = "Número de Reads",
    fill = "Categoría"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    plot.title = element_text(size = 16, face = "bold")
  )



library(ggplot2)

# Crear el dataframe con los datos y sus respectivos códigos
data <- data.frame(
  Code = c("R1", "R2", "R3", "R4"),  # Códigos abreviados para cada categoría
  Category = c("Reads without recognizable barcodes", 
               "Query sequences with compliant barcodes", 
               "Reads mapped to genome", 
               "Reads mapped to insertion/plasmid sequence"),
  Reads = c(542197, 9570254, 7174709, 1640341)
)

# Crear la gráfica de barras en inglés con nombres acortados en el eje X
ggplot(data, aes(x = Code, y = Reads, fill = Category)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(
    title = "Distribution of Reads",
    x = "Read Category (Code)",
    y = "Number of Reads",
    fill = "Category"
  ) +
  scale_x_discrete(labels = c("R1" = "No barcode", 
                              "R2" = "Compliant barcodes", 
                              "R3" = "Mapped to genome", 
                              "R4" = "Mapped to plasmid")) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12),  # Rotar etiquetas de X 45 grados
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    plot.title = element_text(size = 16, face = "bold")
  )
