#' Filter alpha values based on kappa threshold
#'
#' This function filters the alpha values in an outbreaker2 data.frame based on a given threshold for kappa. i.e. it keeps only the ancestors that are below a given number of generations.
#'
#' @param out The outbreaker2 data.frame.
#' @param kappa_max The threshold value for kappa.
#'
#' @return The modified outbreaker2 data.frame with filtered alpha values.
#'
#'
#' @export
filter_alpha_by_kappa <- function(out, kappa_max) {
  if (!is.data.frame(out)) {
    stop("'out' must be of class outbreaker2_chains data.frame.")
  }
  if (!is.integer(kappa_max) ||
      length(kappa_max) != 1) {
    stop("The 'kappa_max' argument must be a single integer value.")
  }

  alpha_cols <- grep("^alpha_", names(out), value = TRUE)
  kappa_cols <- grep("^kappa_", names(out), value = TRUE)

  if (length(alpha_cols) != length(kappa_cols)) {
    stop("The number of 'alpha_' and 'kappa_' columns do not match.")
  }

  for (i in seq_along(alpha_cols)) {
    alpha_col <- alpha_cols[i]
    kappa_col <- kappa_cols[i]
    out[[alpha_col]][out[[kappa_col]] > kappa_max] <- NA
  }

  return(out)
}