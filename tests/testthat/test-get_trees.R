
set.seed(123)
out <- data.frame(
  step = 1:3,
  post = runif(3),
  like = runif(3),
  prior = runif(3)
)
ids <- c("A", "B", "C", "D", "E")
node_indices <- 1:length(ids)
node_ids <- as.character(node_indices)

for (id in node_indices) {
  out[[paste0("alpha_", id)]] <- sample(c(NA, node_indices), 3, replace = TRUE)
  out[[paste0("kappa_", id)]] <- sample(1:3, 3, replace = TRUE)
  out[[paste0("t_inf_", id)]] <- sample(1:10, 3, replace = TRUE)
}

class(out) <- c("outbreaker_chains", "data.frame")
out_identified <- identify(out, ids)

test_that("get_trees works without identify()", {
  trees <- get_trees(out, kappa = TRUE, t_inf = TRUE)

  # Basic checks
  expect_true(is.list(trees))
  expect_true(all(sapply(trees, is.data.frame)))
  expect_equal(length(trees), nrow(out))

  # Column checks
  expected_cols <- c("from",
                     "to",
                     "from_kappa",
                     "to_kappa",
                     "from_t_inf",
                     "to_t_inf")
  for (df in trees) {
    expect_true(all(expected_cols %in% names(df)))
    expect_true(all(df$to %in% seq_along(ids)))

    #character columns
    expect_true(is.character(df$from))
    expect_true(is.character(df$to))

    #expect other columns integers
    expect_true(all(is.integer(df$from_kappa)))
    expect_true(all(is.integer(df$to_kappa)))
    expect_true(all(is.integer(df$from_t_inf)))
    expect_true(all(is.integer(df$to_t_inf)))
  }
})

test_that("get_trees works with identify()", {
  trees <- get_trees(out_identified, kappa = TRUE, t_inf = TRUE)

  # Basic checks
  expect_true(is.list(trees))
  expect_true(all(sapply(trees, is.data.frame)))
  expect_equal(length(trees), nrow(out))

  # Column checks
  expected_cols <- c("from",
                     "to",
                     "from_kappa",
                     "to_kappa",
                     "from_t_inf",
                     "to_t_inf")
  for (df in trees) {
    expect_true(all(expected_cols %in% names(df)))
    expect_true(all(df$to %in% ids))

    #character columns
    expect_true(is.character(df$from))
    expect_true(is.character(df$to))

    #expect other columns integers
    expect_true(all(is.integer(df$from_kappa)))
    expect_true(all(is.integer(df$to_kappa)))
    expect_true(all(is.integer(df$from_t_inf)))
    expect_true(all(is.integer(df$to_t_inf)))
  }
})



test_that("get_trees produces consistent trees with and without identify()", {
  trees_default <- get_trees(out, kappa = TRUE, t_inf = TRUE)
  trees_identified <- get_trees(out_identified, kappa = TRUE, t_inf = TRUE)

  # Number of trees should be the same
  expect_equal(length(trees_default), length(trees_identified))

  # Create a mapping from character IDs back to numeric indices
  id_to_index <- setNames(node_indices, ids)

  for (i in seq_along(trees_default)) {
    df_default <- trees_default[[i]]
    df_identified <- trees_identified[[i]]

    # Map 'from' and 'to' IDs in df_identified back to numeric indices
    from_mapped <- id_to_index[df_identified$from]
    to_mapped <- id_to_index[df_identified$to]

    # Replace the character IDs with numerical indices in df_identified
    df_identified_mapped <- df_identified
    df_identified_mapped$from <- as.character(from_mapped)
    df_identified_mapped$to <- as.character(to_mapped)

    # Ensure that 'from' and 'to' in both data frames are comparable
    expect_equal(df_default$from, df_identified_mapped$from)
    expect_equal(df_default$to, df_identified_mapped$to)

    # Compare other columns (e.g., kappa, t_inf)
    # Make sure column orders are the same
    df_default_ordered <- df_default[order(df_default$to), ]
    df_identified_mapped_ordered <- df_identified_mapped[order(df_identified_mapped$to), ]

    # Compare data frames excluding 'from' and 'to' columns
    cols_to_compare <- setdiff(names(df_default), c("from", "to"))
    expect_true(identical(df_default_ordered[cols_to_compare],
                          df_identified_mapped_ordered[cols_to_compare]))
  }
})

