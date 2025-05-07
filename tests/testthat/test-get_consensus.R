# Mock data
mock_out_consensus <- data.frame(
  alpha_A = c(NA, NA, "B"),
  alpha_B = c("A", "A", "A"),
  alpha_C = c("A", "B", "B")
)
class(mock_out_consensus) <- c("outbreaker_chains", "data.frame")

test_that("get_consensus identifies most frequent ancestor", {
  consensus_tree <- get_consensus(mock_out_consensus)

  expect_named(consensus_tree, c("from", "to", "frequency"))
  expect_equal(nrow(consensus_tree), 3) # Number of cases

  # Case A: NA (2/3), B (1/3) -> from NA, freq 2/3
  # Case B: A (3/3) -> from A, freq 1.0
  # Case C: A (1/3), B (2/3) -> from B, freq 2/3

  # For case A (to="A")
  expect_true(is.na(consensus_tree$from[consensus_tree$to == "A"]))
  expect_equal(consensus_tree$frequency[consensus_tree$to == "A"], 2/3)

  # For case B (to="B")
  expect_equal(consensus_tree$from[consensus_tree$to == "B"], "A")
  expect_equal(consensus_tree$frequency[consensus_tree$to == "B"], 1.0)

  # For case C (to="C")
  expect_equal(consensus_tree$from[consensus_tree$to == "C"], "B")
  expect_equal(consensus_tree$frequency[consensus_tree$to == "C"], 2/3)
})

test_that("get_consensus handles single iteration", {
  mock_out_single_iter <- data.frame(alpha_A = "B", alpha_B = "A")
  class(mock_out_single_iter) <- c("outbreaker_chains", "data.frame")
  consensus_tree <- get_consensus(mock_out_single_iter)

  expect_equal(consensus_tree$from, c("B", "A"))
  expect_equal(consensus_tree$to, c("A", "B"))
  expect_equal(consensus_tree$frequency, c(1.0, 1.0))
})

test_that("get_consensus handles cases with no inferred ancestor", {
  mock_out_no_ancestor <- data.frame(alpha_A = c(NA, NA), alpha_B = c(NA, NA))
  class(mock_out_no_ancestor) <- c("outbreaker_chains", "data.frame")
  consensus <- get_consensus(mock_out_no_ancestor)
  expect_true(all(is.na(consensus$from)))
  expect_equal(consensus$frequency, c(1.0, 1.0))
})
