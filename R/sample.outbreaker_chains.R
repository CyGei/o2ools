#' Sample rows from an outbreaker_chains object
#'
#' This function samples rows from an object of class \code{outbreaker_chains}.
#'
#' @param out A data frame of class \code{outbreaker_chains}.
#' @param ... Additional arguments to be passed to \code{sample()}, such as \code{size} or \code{replace}.
#'
#' @return An object of class \code{outbreaker_chains}, with sampled rows.
#'
#' @export
sample.outbreaker_chains <- function(out, ...) {
  is_outbreaker_chains(out)

  # Sample rows from the data frame
  sampled_rows <- out[base::sample(seq_len(nrow(out)), ...), , drop = FALSE]

  # Preserve the class of the original object
  class(sampled_rows) <- class(out)

  return(sampled_rows)
}
