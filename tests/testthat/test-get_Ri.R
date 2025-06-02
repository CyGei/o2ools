test_that("get_Ri works correctly", {
  # Create mock outbreaker_chains object
  mock_chains <- data.frame(
    alpha_A = c("NA", "B", "C"),
    alpha_B = c("A", "A", "C"),
    alpha_C = c("B", "B", "NA"),
    other_param = c(1, 2, 3)
  )
  class(mock_chains) <- c("outbreaker_chains", "data.frame")

  # Test function
  result <- get_Ri(mock_chains)

  # Check structure
  expect_s3_class(result, "data.frame")
  expect_equal(nrow(result), 3)  # 3 MCMC iterations
  expect_equal(ncol(result), 3)  # 3 individuals (A, B, C)
  expect_equal(colnames(result), c("A", "B", "C"))

  # Check values for first iteration
  # A appearances
  expect_equal(result[,"A"], c(1,1,0))
  # B appearances
  expect_equal(result[,"B"], c(1,2,0))
  # C appearances
  expect_equal(result[,"C"], c(0,0,2))

  # Check that each row sums <= 3
  expect_true(all(rowSums(result) <= 3))
})

test_that("get_Ri handles invalid input", {
  # Test with non-outbreaker_chains object
  invalid_input <- data.frame(x = 1:3)

  expect_error(get_Ri(invalid_input))
})
