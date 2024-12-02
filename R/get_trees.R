
#' Return a list of posterior transmission trees from an outbreaker2 object.
#'
#' This function takes an \code{outbreaker_chains} object and returns a list of data frames with the 'from' and 'to' columns, and additional columns if provided.
#' The additional arguments should be vectors of values, and the name of the argument will be used as the name of the additional column.
#' The additional columns will be named 'from_' and 'to_' followed by the name of the argument.
#'
#' @param out  A data frame of class \code{outbreaker_chains}.
#' @param ids  A vector of IDs from the original linelist.
#' @param kappa A logical value indicating whether to include the kappa values in the output.
#' @param t_inf A logical value indicating whether to include the kappa values in the output.
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

# Create a mapping of ids to their original indices
id_map <- stats::setNames(seq_along(ids), ids)

# Retrieve all columns starting with alpha_
alpha_cols <- grep("^alpha_", names(out), value = TRUE)
to <- gsub("alpha_", "", alpha_cols)

kappa_cols <- grep("^kappa_", names(out), value = TRUE)
t_inf_cols <- grep("^t_inf_", names(out), value = TRUE)

# Create a list of data frames, each with 'from' and 'to' columns
tree_list <- lapply(seq_len(nrow(out)), function(i) {
from <- unlist(out[i, alpha_cols], use.names = FALSE)
if (is.integer(from)) {
to <- as.integer(to)
}

df <- data.frame(from = from,
 to = to,
 stringsAsFactors = FALSE)

if (kappa) {
df$kappa <- unlist(out[i, kappa_cols], use.names = FALSE)
}
if (t_inf) {
df$t_inf <- unlist(out[i, t_inf_cols], use.names = FALSE)
}

# Add additional columns
for (arg in names(args)) {
map <- args[[arg]]
df[paste0("from_", arg)] <- map[id_map[df$from]]
df[paste0("to_", arg)] <- map[id_map[df$to]]
}

df
})

return(tree_list)
}
