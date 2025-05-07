test_that("is_outbreaker_chains works correctly", {
  df_chains <- data.frame(a = 1)
  class(df_chains) <- c("outbreaker_chains", "data.frame")
  df_no_chains <- data.frame(a = 1)
  not_df <- list(a = 1)

  expect_true(is_outbreaker_chains(df_chains))
  expect_error(is_outbreaker_chains(df_no_chains), "'out' must be an object of class 'outbreaker_chains'.")
  expect_error(is_outbreaker_chains(not_df), "'out' must be a data frame.")
})

test_that("is_linelist works correctly", {
  df_linelist <- data.frame(id = 1:3, val = letters[1:3])
  df_no_id <- data.frame(val = letters[1:3])
  not_df <- list(id = 1:3)

  expect_true(is_linelist(df_linelist))
  expect_error(is_linelist(df_no_id), "'linelist' must contain an 'id' column.")
  expect_error(is_linelist(not_df), "'linelist' must be a data frame.")
})
