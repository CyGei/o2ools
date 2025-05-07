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


#' Check if the object conforms to linelist expectations
#'
#' This function checks if the input is a data frame and contains an 'id' column,
#' as expected for a linelist.
#'
#' @param linelist The object to be checked.
#'
#' @return TRUE if the object is a data frame with an 'id' column; otherwise, stops with an error.
#'
#' @keywords internal
is_linelist <- function(linelist) {
  if (!is.data.frame(linelist)) {
    stop("'linelist' must be a data frame.")
  }
  if (!"id" %in% names(linelist)) {
    stop("'linelist' must contain an 'id' column.")
  }
  return(TRUE)
}
