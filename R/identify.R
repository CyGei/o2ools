#' Replace integers from the outbreaker2 output with unique identifiers.
#'
#' @param out A data.frame of class "outbreaker_chains".
#' @param ids A vector of IDs from the original linelist, see outbreaker2::outbreaker_data().
#'
#' @return The outbreaker_chains data.frame with the integers replaced by the corresponding IDs.
#'
#' @export
#' @examples
#' \dontrun{
#' identify(out, ids)
#' }
#'
identify <- function(out, ids) {
  # Check inputs
  stopifnot(is.data.frame(out))
  stopifnot(inherits(out, "outbreaker_chains"))
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
