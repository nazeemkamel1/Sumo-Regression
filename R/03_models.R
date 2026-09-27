# Fit the four regressions explored in the original analysis.
# These objects can be inspected in the RStudio Console.

library(broom)

bmi_all <- lm(avg_win_pct ~ avg_bmi, data = sumo_wrestlers)
weight_all <- lm(avg_win_pct ~ avg_weight_kg, data = sumo_wrestlers)
bmi_2plus <- lm(avg_win_pct ~ avg_bmi, data = sumo_2plus)
weight_2plus <- lm(avg_win_pct ~ avg_weight_kg, data = sumo_2plus)

bmi_model <- bmi_all
weight_coefficients <- tidy(weight_2plus, conf.int = TRUE)
weight_fit <- glance(weight_2plus)

# To inspect the results interactively:
# summary(weight_2plus)
# confint(weight_2plus)
# summary(bmi_2plus)
