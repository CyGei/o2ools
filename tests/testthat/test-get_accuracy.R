# Mock data for testing
mock_out <- data.frame(
  alpha_1 = c(NA, NA, NA, NA),
  alpha_2 = c(1, 1, 1, 3),
  alpha_3 = c(2, 2, 4, 2),
  alpha_4 = c(3, 3, 3, 1),
  kappa_1 = c(NA, NA, NA, NA),
  kappa_2 = c(1, 1, 1, 1),
  kappa_3 = c(2, 4, 4, 2),
  kappa_4 = c(1, 1, 3, 2)
)
class(mock_out) <- c("outbreaker_chains", class(mock_out))

mock_true_tt <- data.frame(
  from = c("1", "2", "3"),
  to = c("2", "3", "4")
)

mock_est_tt <- list(
  data.frame(
    from = c("1", "2", "3"),
    to = c("2", "3", "4")
  ),
  data.frame(
    from = c("3", "2", "1"),
    to = c("2", "1", "4")
  )
)

test_that("get_accuracy computes correct accuracy values", {
  result <- get_accuracy(mock_est_tt, mock_true_tt)
  expect_length(result, length(mock_est_tt))
  #expect_true(all(result >= 0 & result <= 1))
  expect_equal(result, c(1, 0))
})
