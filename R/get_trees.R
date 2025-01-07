
#' Return a list of posterior transmission trees from an outbreaker2 object.
#'
#' This function takes an \code{outbreaker_chains} object and returns a list of data frames with the 'from' and 'to' columns, and additional columns if provided.
#' The additional arguments should be vectors of values, and the name of the argument will be used as the name of the additional column.
#' The additional columns will be named 'from_' and 'to_' followed by the name of the argument.
#'
#' @param out  A data frame of class \code{outbreaker_chains}.
#' @param ids  A vector of IDs from the original linelist.
#' @param kappa A logical value indicating whether to include the kappa values in the output.
#' @param t_inf A logical value indicating whether to include the t_inf values in the output.
#' @param ... Additional columns from the original linelist to include (e.g. loc = linelist$location).
#'
#' @return A list of data frames. Each data frame has 'from' and 'to' columns,
#'         and additional columns based on the additional arguments.
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
  stopifnot(is.data.frame(out))
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
