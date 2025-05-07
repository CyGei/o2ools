# Mock data for testing
mock_out <- data.frame(
  alpha_1 = c(NA, NA, "2"),
  alpha_2 = c("1", "1", "1"),
  t_inf_1 = c(1, 2, 2),
  t_inf_2 = c(3, 3, 4),
  kappa_1 = c(1, 1, 1),
  kappa_2 = c(2, 1, 2),
  mu = rnorm(3)
)
class(mock_out) <- c("outbreaker_chains", "data.frame")

mock_linelist <- data.frame(
  id = c("1", "2"),
  name = c("Alice", "Bob")
)

test_that("augment_linelist adds correct summary columns", {
  res <- augment_linelist(
    mock_out, mock_linelist,
    params = c("t_inf", "kappa"),
    summary_fns = list(med = median)
  )

  expect_true(all(c("t_inf_med", "kappa_med") %in% names(res)))
  expect_equal(res$t_inf_med[res$id == "1"], median(mock_out$t_inf_1))
  expect_equal(res$t_inf_med[res$id == "2"], median(mock_out$t_inf_2))
  expect_equal(res$kappa_med[res$id == "1"], median(mock_out$kappa_1))
  expect_equal(res$kappa_med[res$id == "2"], median(mock_out$kappa_2))
  expect_equal(nrow(res), nrow(mock_linelist))
})

test_that("augment_linelist handles custom summary functions", {
  my_range <- function(x) diff(range(x, na.rm = TRUE))
  res <- augment_linelist(
    mock_out, mock_linelist,
    params = "t_inf",
    summary_fns = list(range = my_range)
  )
  expect_true("t_inf_range" %in% names(res))
  expect_equal(res$t_inf_range[res$id == "1"], my_range(mock_out$t_inf_1))
})

test_that("augment_linelist handles missing parameters with a warning", {
  expect_warning(
    res <- augment_linelist(mock_out, mock_linelist, params = "non_existent_param"),
    "No columns found for param: non_existent_param"
  )
  expect_equal(ncol(res), ncol(mock_linelist)) # No new columns added
})

test_that("augment_linelist works with default summary functions", {
  res <- augment_linelist(mock_out, mock_linelist, params = "t_inf")
  expect_true(all(c("t_inf_mean", "t_inf_q25", "t_inf_q75") %in% names(res)))
  expect_equal(res$t_inf_mean[res$id == "1"], mean(mock_out$t_inf_1))
})

test_that("augment_linelist preserves original linelist columns", {
  res <- augment_linelist(mock_out, mock_linelist, params = "t_inf")
  expect_true(all(names(mock_linelist) %in% names(res)))
  expect_equal(res$name, mock_linelist$name)
})
