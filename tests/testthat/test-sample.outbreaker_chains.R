# Mock data
mock_out_sample <- data.frame(
  iter = 1:10,
  alpha_1 = sample(c(NA,1,2), 10, replace = TRUE)
)
class(mock_out_sample) <- c("outbreaker_chains", "data.frame")

test_that("sample.outbreaker_chains samples correct number of rows", {
  sampled <- sample.outbreaker_chains(mock_out_sample, size = 3)
  expect_equal(nrow(sampled), 3)

  sampled_replace <- sample.outbreaker_chains(mock_out_sample, size = 15, replace = TRUE)
  expect_equal(nrow(sampled_replace), 15)
})

test_that("sample.outbreaker_chains preserves class", {
  sampled <- sample.outbreaker_chains(mock_out_sample, size = 1)
  expect_s3_class(sampled, "outbreaker_chains")
  expect_s3_class(sampled, "data.frame")
})

test_that("sample.outbreaker_chains handles size = 0", {
  sampled <- sample.outbreaker_chains(mock_out_sample, size = 0)
  expect_equal(nrow(sampled), 0)
  expect_s3_class(sampled, "outbreaker_chains")
})

