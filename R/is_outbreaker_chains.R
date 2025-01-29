#' Check if an object is a data frame of class 'outbreaker_chains'
#'
#' This function checks if the input is a data frame and of class 'outbreaker_chains'.
#'
#' @param out The object to be checked.
#'
#' @return TRUE if the object is a data frame and of class 'outbreaker_chains', otherwise stops with an error.
#'
#' @keywords internal
is_outbreaker_chains <- function(out) {
  if (!is.data.frame(out)) {
    stop("'out' must be a data frame.")
  }
  if (!inherits(out, "outbreaker_chains")) {
    stop("'out' must be an object of class 'outbreaker_chains'.")
  }
  return(TRUE)
}
