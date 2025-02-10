

out <- data.frame(
  step = 1:3,
  post = runif(3),
  like = runif(3),
  prior = runif(3)
)

ids <- c("A", "B", "C")
node_indices <- 1:length(ids)
for (id in node_indices) {
  out[[paste0("alpha_", id)]] <- sample(c(NA, node_indices), 3, replace = TRUE)
  out[[paste0("kappa_", id)]] <- sample(1:3, 3, replace = TRUE)
  out[[paste0("t_inf_", id)]] <- sample(1:10, 3, replace = TRUE)
}
class(out) <- c("outbreaker_chains", "data.frame")
out_identified <- identify(out, ids)


test_that("identify replaces integers with IDs in alpha_ columns and updates column names",
          {
            alpha_cols_original <- grep("^alpha_", names(out), value = TRUE)
            alpha_cols_identified <- grep("^alpha_", names(out_identified), value = TRUE)

            expect_equal(length(alpha_cols_original),
                         length(alpha_cols_identified))

            # Check that column names have been updated correctly
            expected_alpha_cols <- paste0("alpha_", ids)
            expect_equal(sort(alpha_cols_identified), sort(expected_alpha_cols))

            # Check that the values in alpha_ columns are replaced with correct IDs
            for (i in seq_along(ids)) {
              original_col <- alpha_cols_original[i]
              identified_col <- alpha_cols_identified[i]
              original_values <- out[[original_col]]
              identified_values <- out_identified[[identified_col]]

              # Map original integer values to IDs
              expected_values <- ids[original_values]
              expected_values[is.na(original_values)] <- NA  # Preserve NAs

              expect_equal(identified_values, expected_values)
            }

            # Test that other columns ending with digits have their names updated
            numeric_cols_idx <- grep("(\\d+)$", names(out))
            numeric_cols_original <- names(out)[numeric_cols_idx]
            numeric_cols_identified <- names(out_identified)[numeric_cols_idx]

            digits <- as.numeric(gsub("[^0-9]", "", numeric_cols_original))
            expected_cols <- paste0(gsub("\\d+$", "", numeric_cols_original), ids[digits])

            expect_equal(sort(numeric_cols_identified), sort(expected_cols))

            # Test that the data in other columns remains unchanged
            other_cols <- setdiff(names(out), numeric_cols_original)
            for (col in other_cols) {
              expect_equal(out_identified[[col]], out[[col]])
            }
          })
