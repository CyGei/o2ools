#' Extract posterior transmission trees
#'
#' Generates a list of data frames representing posterior transmission trees from an \code{outbreaker_chains} object.
#' Each tree is represented as a data frame with 'from' and 'to' columns, and optionally includes additional columns.
#'
#' @param out A data frame of class \code{outbreaker_chains}.
#' @param kappa A logical indicating whether to include `kappa` values in the output. Default is \code{FALSE}.
#' @param t_inf A logical indicating whether to include infection times (`t_inf`) in the output. Default is \code{FALSE}.
#' @param ... Additional named vectors from the original linelist to include as columns (e.g., \code{loc = linelist$location}).
#'
#' @return A list of data frames. Each data frame contains 'from' and 'to' columns, and optionally includes kappa, t_inf, and additional columns.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_trees(out, ids = ids, group = group, dates = dates)
#' }
#'
get_trees <- function(out,
                      kappa = FALSE,
                      t_inf = FALSE,
                      ...) {
  # Check inputs
  is_outbreaker_chains(out)
  args <- list(...)
  stopifnot(all(sapply(args, is.atomic)))

  # Default columns from outbreaker2
  cols <- names(out)
  alpha_cols <- grep("^alpha_", cols, value = TRUE)
  kappa_cols <- grep("^kappa_", cols, value = TRUE)
  t_inf_cols <- grep("^t_inf_", cols, value = TRUE)

  to <- as.character(sub("alpha_", "", alpha_cols))

  # Generate trees
  trees <- lapply(seq_len(nrow(out)), function(i) {
    from <- as.character(unlist(out[i, alpha_cols], use.names = FALSE))

    df <- data.frame(from = from,
                     to = to,
                     stringsAsFactors = FALSE)

    if (kappa) {
      kappa_values <- unlist(out[i, kappa_cols], use.names = FALSE)
      names(kappa_values) <- to
      df$from_kappa <- kappa_values[from]
      df$to_kappa <- kappa_values[to]
    }
    if (t_inf) {
      t_inf_values <- unlist(out[i, t_inf_cols], use.names = FALSE)
      names(t_inf_values) <- to
      df$from_t_inf <- t_inf_values[from]
      df$to_t_inf <- t_inf_values[to]
    }

    # Add additional columns from 'args'
    for (arg in names(args)) {
      vec <- args[[arg]]
      names(vec) <- to
      df[paste0("from_", arg)] <- vec[from]
      df[paste0("to_", arg)] <- vec[to]
    }

    df
  })

  return(trees)
}
