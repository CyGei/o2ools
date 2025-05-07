#' Extract posterior transmission trees
#'
#' Generates a list of data frames representing posterior transmission trees from an
#' \code{outbreaker_chains} object. Each tree contains 'from' and 'to' columns, and may
#' optionally include \code{kappa}, \code{t_inf}, and user-supplied columns.
#'
#' @param out A data frame of class \code{outbreaker_chains}.
#' @param kappa Logical. If \code{TRUE}, includes \code{kappa} values in the output. Default is \code{FALSE}.
#' @param t_inf Logical. If \code{TRUE}, includes infection times (\code{t_inf}) in the output. Default is \code{FALSE}.
#' @param ... Additional vectors to include as columns in the output. Must be given in the same order as used in \code{outbreaker()}.
#'
#' @return A list of data frames, one per posterior sample. Each data frame has at least 'from' and 'to' columns.
#'
#' @export
#'
#' @examples
#' get_trees(out, id = linelist$id,
#'                name = linelist$name,
#'                group = linelist$group,
#'                onset = linelist$onset)

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
