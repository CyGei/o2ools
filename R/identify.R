#' Replace integers in outbreaker2 output with unique identifiers
#'
#' @param out A data frame of class \code{outbreaker_chains}.
#' @param ids A vector of IDs from the original linelist (see \code{outbreaker2::outbreaker_data()}).
#'
#' @return A data frame of class \code{outbreaker_chains} with integers replaced by the corresponding IDs.
#'
#' @export
#' @examples
#' identify(out, id = linelist$name)
#'
identify <- function(out, ids) {
  # Check inputs
  is_outbreaker_chains(out)
  stopifnot(is.character(ids))

  alpha_cols <- grep("^alpha_", names(out), value = TRUE)
  stopifnot(length(ids) == length(alpha_cols))

  out[alpha_cols] <- lapply(out[alpha_cols], function(x) {
    ids[x]
  })
  cols_idx <- grep("(\\d+)$", names(out))
  cols <- names(out)[cols_idx]
  digits <- as.numeric(gsub("[^0-9]", "", cols))
  cols_replaced <- paste0(gsub("\\d+$", "", cols), ids[digits])
  names(out)[cols_idx] <- cols_replaced

  return(out)
}
