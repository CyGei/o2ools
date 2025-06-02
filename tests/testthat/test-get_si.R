test_that("get_si works with basic input", {
  # Create test data
  tree1 <- data.frame(
    from_date = c(1, 2, 3, 4),
    to_date = c(3, 5, 6, 8)
  )
  tree2 <- data.frame(
    from_date = c(2, 3, 4),
    to_date = c(4, 6, 7)
  )
  trees <- list(tree1, tree2)

  result <- get_si(trees)

  # Check structure
  expect_s3_class(result, "data.frame")
  expect_true("x" %in% names(result))
  expect_true("mean" %in% names(result))
  expect_true("lwr" %in% names(result))
  expect_true("upr" %in% names(result))

  # Check x range (serial intervals should be 2, 3, 4 from tree1 and 2, 3 from tree2)
  expect_equal(min(result$x), 2)
  expect_equal(max(result$x), 4)

  # Check that all values are numeric
  expect_true(all(sapply(result, is.numeric)))
})

test_that("get_si works with custom statistics", {
  tree1 <- data.frame(
    from_date = c(1, 2, 3),
    to_date = c(3, 4, 6)
  )
  trees <- list(tree1)

  custom_stats <- list(
    median = median,
    max_val = max
  )

  result <- get_si(trees, stats = custom_stats)

  expect_true("median" %in% names(result))
  expect_true("max_val" %in% names(result))
  expect_false("mean" %in% names(result))
})

test_that("get_si works with different date_suffix", {
  tree_time <- data.frame(
    from_time = c(1, 2, 3),
    to_time = c(3, 4, 6)
  )
  trees <- list(tree_time)

  result <- get_si(trees, date_suffix = "time")

  expect_s3_class(result, "data.frame")
  expect_true(nrow(result) > 0)
})

test_that("get_si handles NA values correctly", {
  tree_na <- data.frame(
    from_date = c(1, NA, 3, 4),
    to_date = c(3, 5, 6, 8)
  )
  trees <- list(tree_na)

  result <- get_si(trees)

  # Should work without errors and exclude NA rows
  expect_s3_class(result, "data.frame")
  expect_true(nrow(result) > 0)
})

test_that("get_si produces consistent output structure", {
  tree1 <- data.frame(
    from_date = c(1, 2),
    to_date = c(3, 5)
  )
  trees <- list(tree1)

  result <- get_si(trees)

  # Check that x values are consecutive integers
  expect_equal(result$x, seq(min(result$x), max(result$x), by = 1))

  # Check that statistics are properly bounded
  expect_true(all(result$lwr <= result$mean))
  expect_true(all(result$mean <= result$upr))
})
