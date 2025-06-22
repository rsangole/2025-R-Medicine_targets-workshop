  ## Model 6
  tar_target(
    mod_lm6,
    fn_lm_mod(tbl_NHANES,
      formula = formula(tot_chol ~ age + bmi)
    )
  ),
  tar_target(mod_lm_coeffs6, broom::tidy(mod_lm6)),

  ## Model 7
  tar_target(
    mod_lm7,
    fn_lm_mod(tbl_NHANES,
      formula = formula(tot_chol ~ age + gender + bmi + race1 + education + hh_income_mid)
    )
  ),
  tar_target(mod_lm_coeffs7, broom::tidy(mod_lm7))
