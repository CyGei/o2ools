out_high <- data.frame(
  alpha_1 = sample(c("2", "3"), 100, replace = TRUE),
  alpha_2 = sample(c("1", "3"), 100, replace = TRUE)
)

out_low <- data.frame(
  alpha_1 = sample(c("2", "3"), 100, replace = TRUE, prob = c(0.9, 0.1)),
  alpha_2 = sample(c("1", "3"), 100, replace = TRUE, prob = c(0.9, 0.1))
)

out_0_entropy <- data.frame(
  alpha_1 = rep("2", 100),
  alpha_2 = rep("1", 100)
)

class(out_high) <- c("outbreaker_chains", class(out_high))
class(out_low) <- c("outbreaker_chains", class(out_low))
class(out_0_entropy) <- c("outbreaker_chains", class(out_0_entropy))


test_that("get_entropy returns a numeric entropy value", {
  expect_type(get_entropy(out_high), "double")
})

test_that("get_entropy is consistent with expectations", {
  expect_true(get_entropy(out_high) > get_entropy(out_low))
  expect_true(get_entropy(out_0_entropy) == 0)
  expect_true(get_entropy(out_high) == round(log(2), 2))
})
