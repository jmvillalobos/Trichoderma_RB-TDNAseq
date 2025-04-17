# Instalar pheatmap si no está instalado
if (!requireNamespace("pheatmap", quietly = TRUE)) {
  install.packages("pheatmap")
}

# Cargar librerías necesarias
library(pheatmap)

# Crear el dataframe con los datos
data <- data.frame(
  DropC = c(0.32466036, -0.0045795, 0.22401473, -0.1799043, -0.0164866, -0.7451106, -0.1621171, 0.09101153, -0.0705707,
            -0.0667098, 3.8362925, -0.3750244, 0.25037626, 0.02370702, -0.151386, -0.6419084, -0.2876336, -0.2850884,
            0.71435675, 0.74819285, 1.47173178, -0.4703611, -0.3326189),
  MCysC = c(-16.335765, -14.926358, -11.240803, -9.0020639, -8.0369177, -7.7281027, -7.4680948, -7.0818448, -6.978458,
            -6.4581222, -5.8324098, -5.702879, -4.9769263, -4.7500549, -4.5540043, -4.5535409, -4.5522128, -4.3902058,
            -3.811115, -3.7962334, -3.6972494, -2.9553449, -2.2400857)
)

# Definir nombres de fila (proteínas)
rownames(data) <- c(
  "sulfite reductase flavoprotein component", "homoserine o-acetyltransferase", "cysteine synthase", "mfs quinate",
  "fad binding domain-containing protein", "hypothetical protein (id299027)", "hypothetical protein (id302463)",
  "cystathionine gamma-synthase", "sphingolipid long chain base-responsive protein lsp1", "hypothetical protein (id87444)",
  "methylenetetrahydrofolate reductase 1", "asparagine synthetase domain containing protein 1", "aconitate hydratase",
  "ccr4-not complex subunit caf16", "c6 zinc finger domain protein", "hypothetical protein (id89290)", "nitrate reductase",
  "f-box lrr repeat containing protein 2", "dead deah box helicase", "mitochondrial protein",
  "hypothetical protein (id87269)", "o-methyltransferase-like protein", "fso1-like protein"
)

# Crear el heatmap con pheatmap
pheatmap(data, 
         cluster_rows = TRUE,  # Incluir dendrograma en filas
         cluster_cols = FALSE, # No agrupar columnas
         scale = "none",       # Mantener valores originales
         display_numbers = TRUE, # Mostrar valores en cada celda
         fontsize_number = 8,  # Tamaño de los números en las celdas
         color = colorRampPalette(c("blue", "white", "red"))(100), # Paleta de colores similar a Python
         main = "Heatmap de DropC y MCysC en Proteínas",
         fontsize_row = 8, 
         fontsize_col = 10)
