# Test for ttable
test_that("ttable builds contingency table", {
  from <- c("A", "B", "A")
  to <- c("B", "A", "A")
  tab <- ttable(from, to)
  expect_equal(tab["A", "A"], 1)
  expect_equal(tab["A", "B"], 1)

  expect_error(ttable(from, to[1:2]))
})
