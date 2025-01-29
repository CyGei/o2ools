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

test_that("filter_alpha_by_kappa correctly filters alpha values", {
  # leads to additional NAs
  result <- filter_alpha_by_kappa(mock_out, 2L)
  expect_identical(result[,2], mock_out[,2])
  expect_true(sum(is.na(result[,3])) == 2)
  expect_true(sum(is.na(result)) > sum(is.na(mock_out)))

  # no change
  result <- filter_alpha_by_kappa(mock_out, 4L)
  expect_identical(result, mock_out)
})
