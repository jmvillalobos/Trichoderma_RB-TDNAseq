library(tidyverse)

# Datos
df <- tribble(
  ~id, ~name, ~glucose, ~xylose,
  255855, "hypothetical protein (id255855)", -0.290720826, -9.652346176,
  46181,  "hypothetical protein (id46181)", -0.084345243, -5.321522549,
  7394,   "hypothetical protein (id7394)", -0.934720038, -3.542491534,
  152072, "proteasome activator subunit (id152072)", -0.915749495, -2.478464029,
  38402,  "glycosyltransferase family 15 protein (id38402)", 0.106789479, -3.672933296,
  88442,  "xylose isomerase domain-containing protein (id88442)", -0.81032441, -5.382478623,
  78601,  "transcriptional activator xlnr (id78601)", 0.426956758, -2.201404809,
  168459, "hypothetical protein (id168459)", -0.598100704, -6.914346486,
  303042, "xylitol dehydrogenase (id303042)", -0.352707742, -2.029074373,
  300478, "duf323 domain-containing protein (id300478)", -0.024566194, -5.046483396
)

# Transformar datos a formato largo
df_long <- df %>%
  pivot_longer(cols = c(glucose, xylose), names_to = "condition", values_to = "fitness") %>%
  mutate(label = sprintf("%.2f", fitness))

# Heatmap con escala centrada en 0: azul-negativo, blanco-cero, rojo-positivo
ggplot(df_long, aes(x = condition, y = fct_reorder(name, fitness), fill = fitness)) +
  geom_tile(color = "white") +
  geom_text(aes(label = label), color = "black", size = 3.5) +
  scale_fill_gradient2(
    low = "blue", mid = "white", high = "red",
    midpoint = 0, name = "Fitness"
  ) +
  theme_minimal(base_size = 12) +
  labs(
    title = "Heatmap de valores de fitness (negativo = azul, positivo = rojo)",
    x = "Condición",
    y = "Proteína"
  ) +
  theme(axis.text.y = element_text(size = 9))
