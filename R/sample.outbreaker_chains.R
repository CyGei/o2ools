#' Sample rows from an outbreaker_chains object
#'
#' This function samples rows from an object of class \code{outbreaker_chains}.
#'
#' @param x An object of class \code{outbreaker_chains}, which also inherits from \code{data.frame}.
#' @param ... Additional arguments to be passed to \code{sample()}, such as \code{size} or \code{replace}.
#'
#' @return An object of class \code{outbreaker_chains}, with sampled rows.
#'
#' @export
sample.outbreaker_chains <- function(x, ...) {
  if (!inherits(x, "data.frame")) {
    stop("Object must inherit from data.frame")
  }
  # if (!inherits(x, "outbreaker_chains")) {
  #   stop("Object must inherit from class 'outbreaker_chains'")
  # }

  # Sample rows from the data frame
  sampled_rows <- x[base::sample(seq_len(nrow(x)), ...), , drop = FALSE]

  # Preserve the class of the original object
  class(sampled_rows) <- class(x)

  return(sampled_rows)
}
