# Mock data for testing
mock_out_filter <- data.frame(
  kappa_1 = c(0.5, 1.5, 1.0),
  kappa_2 = c(2.0, 0.8, 1.2),
  alpha_1 = c(10, 20, 30),
  alpha_2 = c(40, 50, 60),
  t_inf_1 = c(1,2,3), # another target
  t_inf_2 = c(4,5,6)
)
class(mock_out_filter) <- c("outbreaker_chains", "data.frame")

test_that("filter_chain masks target based on param and threshold", {
  res <- filter_chain(mock_out_filter, param = "kappa", thresh = 1, comparator = "<=", target = "alpha")
  expect_equal(res$alpha_1, c(10, NA, 30))
  expect_equal(res$alpha_2, c(NA, 50, NA))

  res_gt <- filter_chain(mock_out_filter, param = "kappa", thresh = 1, comparator = ">", target = "alpha")
  expect_equal(res_gt$alpha_1, c(NA, 20, NA))
  expect_equal(res_gt$alpha_2, c(40, NA, 60))
})

test_that("filter_chain works with different targets", {
  res <- filter_chain(mock_out_filter, param = "kappa", thresh = 1, comparator = "<=", target = "t_inf")
  expect_equal(res$t_inf_1, c(1, NA, 3))
  expect_equal(res$t_inf_2, c(NA, 5, NA))
})

test_that("filter_chain errors on mismatched param/target columns", {
  mock_out_mismatch <- data.frame(
    kappa_1 = c(0.5, 1.5, 1.0),
    alpha_1 = c(10, 20, 30),
    alpha_2 = c(40, 50, 60)
  )
  class(mock_out_mismatch) <- c("outbreaker_chains", "data.frame")
  expect_error(
    filter_chain(mock_out_mismatch, param = "kappa", thresh = 1, target = "alpha"),
    "Mismatch between 'kappa_\\*' and 'alpha_\\*' columns."
  )
})

test_that("filter_chain errors on invalid comparator", {
  expect_error(
    filter_chain(mock_out_filter, param = "kappa", thresh = 1, comparator = "invalid", target = "alpha"),
    "comparator %in% c"
  )
})

test_that("filter_chain preserves class", {
  res <- filter_chain(mock_out_filter, param = "kappa", thresh = 1, target = "alpha")
  expect_s3_class(res, "outbreaker_chains")
})
