#' Extract posterior transmission trees
#'
#' Generates a list of data frames representing posterior transmission trees from an \code{outbreaker_chains} object.
#' Each tree is represented as a data frame with 'from' and 'to' columns, and optionally includes additional columns.
#'
#' @param out A data frame of class \code{outbreaker_chains}.
#' @param ids A character or integer vector of case IDs from the original linelist.
#' @param kappa A logical indicating whether to include `kappa` values in the output. Default is \code{FALSE}.
#' @param t_inf A logical indicating whether to include infection times (`t_inf`) in the output. Default is \code{FALSE}.
#' @param ... Additional named vectors from the original linelist to include as columns (e.g., \code{loc = linelist$location}).
#'
#' @return A list of data frames. Each data frame contains 'from' and 'to' columns, and optionally includes kappa, t_inf, and additional columns.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_trees(out, ids = ids, group = group, dates = dates)
#' }
#'
get_trees <- function(out,
                      ids,
                      kappa = FALSE,
                      t_inf = FALSE,
                      ...) {
  # Check inputs
  is_outbreaker_chains(out)
  args <- list(...)
  stopifnot(all(sapply(args, is.atomic)))

  # Default columns from outbreaker2
  cols <- names(out)
  alpha_cols <- grep("^alpha_", cols, value = TRUE)
  kappa_cols <- grep("^kappa_", cols, value = TRUE)
  t_inf_cols <- grep("^t_inf_", cols, value = TRUE)


  # Determine type of 'alpha' values are characters or integers
  # see o2ools::identify() for more details
  from_class <- class(out[[alpha_cols[1]]])

  # Helper to map values
  map_ids <- function(x) {
    if (from_class == "character") {
      x
    } else if (from_class == "integer") {
      ids[as.integer(x)]
    } else {
      stop("Unknown class for 'alpha' values")
    }
  }


  # Generate trees
  tree_list <- lapply(seq_len(nrow(out)), function(i) {
    from <- map_ids(unlist(out[i, alpha_cols], use.names = FALSE))
    to <- map_ids(gsub("alpha_", "", alpha_cols))

    df <- data.frame(from = from,
                     to = to,
                     stringsAsFactors = FALSE)

    if (kappa) {
      df$kappa <- unlist(out[i, kappa_cols], use.names = FALSE)
    }
    if (t_inf) {
      df$t_inf <- unlist(out[i, t_inf_cols], use.names = FALSE)
    }

    # Add additional columns from 'args'
    for (arg in names(args)) {
      vec <- args[[arg]]
      names(vec) <- ids
      df[paste0("from_", arg)] <- vec[from]
      df[paste0("to_", arg)] <- vec[to]
    }

    df
  })

  return(tree_list)
}
