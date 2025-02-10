out_high <- data.frame(
  alpha_1 = sample(c("2", "3"), 100, replace = TRUE, prob = c(0.7, 0.3)),
  alpha_2 = sample(c("1", "3"), 100, replace = TRUE, prob = c(0.7, 0.3))
)


out_low <- data.frame(
  alpha_1 = sample(c("2", "3"), 100, replace = TRUE, prob = c(0.9, 0.1)),
  alpha_2 = sample(c("1", "3"), 100, replace = TRUE, prob = c(0.9, 0.1))
)

out_0 <- data.frame(alpha_1 = rep("2", 100), alpha_2 = rep("1", 100))

out_1 <- data.frame(alpha_1 = rep(c("2", "3"), 50), alpha_2 = rep(c("1", "3"), 50))

class(out_high) <- c("outbreaker_chains", class(out_high))
class(out_low) <- c("outbreaker_chains", class(out_low))
class(out_0) <- c("outbreaker_chains", class(out_0))
class(out_1) <- c("outbreaker_chains", class(out_1))


en_high <- round(mean(get_entropy(out_high)), 2)
en_low <- round(mean(get_entropy(out_low)), 2)
en_0 <- round(mean(get_entropy(out_0)), 2)
en_1 <- round(mean(get_entropy(out_1)), 2)

test_that("get_entropy returns a numeric vector", {
  expect_true(is.numeric(get_entropy(out_high)))
  expect_true(length(get_entropy(out_low)) == 2)
})

test_that("get_entropy is consistent with expectations", {
  expect_true(en_high > en_low)
  expect_true(en_0 == 0)
  expect_true(round(mean(get_entropy(out_0, FALSE)), 2) == 0)
  expect_true(en_1 == 1)
  expect_true(round(mean(get_entropy(out_1, FALSE)), 2) == round(log(2), 2))
})
