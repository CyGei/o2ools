#' Filter ancestries by generation threshold
#'
#' Filters `alpha` values in an \code{outbreaker_chains} object based on a specified threshold for `kappa`, removing ancestors beyond the given number of generations.
#'
#' @param out A data frame of class `outbreaker_chains`.
#' @param kappa_max A single integer specifying the maximum allowed number of generations (`kappa`).
#'
#' @return A modified \code{outbreaker_chains} data frame with alpha values filtered based on the kappa threshold.
#'
#' @examples
#' \dontrun{
#' filter_alpha_by_kappa(out, kappa_max = 1)
#' }
#'
#' @export
filter_alpha_by_kappa <- function(out, kappa_max) {
  is_outbreaker_chains(out)

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
