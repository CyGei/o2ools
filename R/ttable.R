#' Compute the transmission contingency table
#'
#' Generates a contingency table based on 'from' (infector) and 'to' (infectee) vectors.
#'
#' @param from A vector of infectors.
#' @param to A vector of infectees.
#' @param levels Optional. A vector of factor levels. Defaults to the unique, sorted values of 'from' and 'to'.
#' @param ... Additional arguments passed to the \code{table} function.
#'
#' @return A contingency table of infectors (rows) and infectees (columns).
#'
#' @examples
#' from <- c("A", "A", NA, "C", "C", "C")
#' to <- c("A", "B", "B", "C", "C", "C")
#' ttable(from, to)
#' @export
#'
ttable <- function(from, to, levels = NULL, ...) {
  if (!is.vector(from) || !is.vector(to) || length(from) != length(to)) {
    stop("'from' and 'to' must be vectors of the same length.")
  }

  from <- as.character(from)
  to <- as.character(to)

  if (is.null(levels)) {
    levels <- unique(sort(c(from, to)))
  } else {
    if (!is.vector(levels) || any(is.na(levels))) {
      stop("'levels' must be a vector of non-missing values.")
    }
    if (!all(unique(sort(c(from, to))) %in% levels)) {
      stop("The unique values in 'from' and 'to' must be a subset of 'levels'.")
    }

    levels <- unique(levels)
  }

  if (length(levels) < 2) {
    stop("There must be at least two group levels in the data")
  }

  from <- factor(from, levels = levels)
  to <- factor(to, levels = levels)

  return(table(from, to, ...))
}
