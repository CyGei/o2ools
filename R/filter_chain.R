#' Filter chain by parameter threshold
#'
#' Mask target columns whenever a parameter column fails a threshold test.
#'
#' @param out A data frame of class \code{outbreaker_chains}.
#' @param param Name of the parameter prefix (e.g. \code{"kappa"}).
#' @param thresh Numeric threshold.
#' @param comparator A string comparator: one of \code{"<="}, \code{">="}, \code{"<"}, \code{">"}, \code{"=="}.
#' @param target Name of the target prefix to mask (e.g. \code{"alpha"}).
#'
#' @return An \code{outbreaker_chains} data frame with \code{target_*} entries set to \code{NA}
#'   wherever \code{param_*} \code{comparator} \code{thresh} is \code{FALSE}.
#'
#' @examples
#' # Mask alpha_i whenever kappa_i > 1
#' filter_chain(out, param = "kappa", thresh = 1, comparator = "<=", target = "alpha")
#'
#' @export
filter_chain <- function(out,
                          param,
                          thresh,
                          comparator = "<=",
                          target = "alpha") {
  is_outbreaker_chains(out)
  stopifnot(
    is.character(param),
    is.numeric(thresh),
    is.character(comparator),
    is.character(target),
    comparator %in% c("<=", ">=", "<", ">", "==")
  )

  # find matching columns
  pcols <- grep(paste0("^", param, "_"), names(out), value = TRUE)
  tcols <- grep(paste0("^", target, "_"), names(out), value = TRUE)
  if (length(pcols) != length(tcols)) {
    stop("Mismatch between '",
         param,
         "_*' and '",
         target,
         "_*' columns.")
  }

  # get comparator function
  cmp <- get(comparator, mode = "function")

  # loop and mask
  for (i in seq_along(pcols)) {
    keep <- cmp(out[[pcols[i]]], thresh)
    out[[tcols[i]]][!keep] <- NA
  }

  out
}
