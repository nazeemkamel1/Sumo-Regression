# Group by both name and birth date, then calculate averages.
# Run 01_load_clean.R first, or run all scripts with R/run_analysis.R.

sumo_wrestlers <- sumo_15 |>
  group_by(Rikishi, birth_date) |>
  summarise(
    avg_bmi = mean(bmi),
    avg_weight_kg = mean(weight_kg),
    avg_win_pct = mean(win_pct),
    appearances = n(),
    .groups = "drop"
  )

shared_name_count <- sumo_15 |>
  distinct(Rikishi, birth_date) |>
  count(Rikishi) |>
  filter(n > 1) |>
  nrow()

sumo_2plus <- sumo_wrestlers |> filter(appearances >= 2)

# Keep this earlier object name available for the original BMI plot.
sumo_by_rikishi_15 <- sumo_wrestlers

descriptives <- bind_rows(lapply(
  c("avg_weight_kg", "avg_win_pct", "avg_bmi"),
  function(variable) {
    x <- sumo_2plus[[variable]]
    tibble(Variable = variable, Mean = mean(x), SD = sd(x),
           Minimum = min(x), Maximum = max(x))
  }
)) |>
  mutate(Variable = c("Average weight (kg)", "Average winning percentage (%)",
                      "Average BMI (kg/m2)"))
