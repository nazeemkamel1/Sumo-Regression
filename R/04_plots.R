# Define plots here; the report chooses where to display them.

library(ggplot2)

weight_plot <- ggplot(sumo_2plus, aes(avg_weight_kg, avg_win_pct)) +
  geom_point(alpha = 0.45, size = 1.4) +
  geom_smooth(method = "lm", formula = y ~ x, se = TRUE,
              color = "#285B87", fill = "#C8D7E5", linewidth = 0.8) +
  labs(x = "Average weight (kg)", y = "Average winning percentage (%)") +
  theme_minimal(base_size = 11)

# Preserve the original BMI plot for exploration in the Console.
bmi_plot <- ggplot(sumo_by_rikishi_15, aes(avg_bmi, avg_win_pct)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", formula = y ~ x, se = TRUE) +
  labs(title = "Average BMI and Winning Percentage",
       x = "Average BMI (kg/m²)", y = "Average winning percentage (%)") +
  theme_minimal()

# Base R diagnostic plots must be drawn when the report requests them.
plot_weight_diagnostics <- function() {
  old_par <- par(mfrow = c(1, 2), mar = c(4, 4, 2, 1), cex = 0.75)
  on.exit(par(old_par))
  plot(weight_2plus, which = c(1, 2), id.n = 0)
}
