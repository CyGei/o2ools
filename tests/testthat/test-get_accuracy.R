
# Mock data for testing
mock_out_acc <- data.frame(
  alpha_1 = c(NA, NA, "2"),
  alpha_2 = c("1", "1", "1"),
  alpha_3 = c("1", "2", "2")
)
class(mock_out_acc) <- c("outbreaker_chains", "data.frame")

true_tree_acc <- data.frame(
  from = c(NA, "1", "1"),
  to = c("1", "2", "3"),
  stringsAsFactors = FALSE
)

test_that("get_accuracy calculates correctly", {
  expected_accuracies <- c(3/3, 2/3, 1/3)

  acc <- get_accuracy(mock_out_acc, true_tree_acc)
  expect_equal(acc, expected_accuracies)
  expect_length(acc, nrow(mock_out_acc))
})

test_that("get_accuracy handles fully incorrect tree", {
  mock_out_incorrect <- data.frame(alpha_1 = "2", alpha_2 = "1")
  class(mock_out_incorrect) <- c("outbreaker_chains", "data.frame")
  true_tree_simple <- data.frame(from = c(NA, "1"), to = c("1", "2"), stringsAsFactors = FALSE)
  # Posterior tree 1: 2->1, 1->2. True tree: NA->1, 1->2. Correct: 1 (1->2)
  acc <- get_accuracy(mock_out_incorrect, true_tree_simple)
  expect_equal(acc, c(1/2))
})

