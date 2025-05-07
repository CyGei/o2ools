#' Append summaries of outbreaker results to a linelist
#'
#' For each case in `linelist`, appends summary statistics of selected parameters
#' from an `outbreaker_chains` object (e.g. infection times, number of generations).
#'
#' @param out An \code{outbreaker_chains} object containing posterior samples.
#' @param linelist A \code{data.frame} with an \code{id} column matching the IDs in \code{out}.
#' @param params Character vector of parameter prefixes to summarise (e.g. \code{"t_inf"}, \code{"kappa"}).
#' @param summary_fns A **named** list of summary functions. Each function
#'   takes a numeric vector and returns a single value.
#'   Example:
#'   \code{
#'   list(
#'     mean = function(x) mean(x, na.rm = TRUE),
#'     q25  = function(x) quantile(x, 0.25, na.rm = TRUE),
#'     q75  = function(x) quantile(x, 0.75, na.rm = TRUE)
#'   )
#'   }
#'
#' @return The input \code{linelist}, with new columns named
#'   \code{<param>_<fn>} (e.g. \code{t_inf_mean}, \code{kappa_q25}).
#'
#' @importFrom stats quantile setNames
#' @export
#'
#' @examples
#' augmented_linelist <- augment_linelist(
#'   out, linelist,
#'   params = c("t_inf", "kappa"),
#'   summary_fns = list(
#'     median = function(x) median(x, na.rm = TRUE),
#'     q25 = function(x) quantile(x, 0.25, na.rm = TRUE),
#'     q75 = function(x) quantile(x, 0.75, na.rm = TRUE)
#'   )
#' )
#'
augment_linelist <- function(out,
                          linelist,
                          params = c("t_inf", "kappa"),
                          summary_fns = list(
                            mean = function(x)
                              mean(x, na.rm = TRUE),
                            q25  = function(x)
                              quantile(x, .25, na.rm = TRUE),
                            q75  = function(x)
                              quantile(x, .75, na.rm = TRUE)
                          )) {
  is_outbreaker_chains(out)
  is_linelist(linelist)

  ids <- linelist$id

  for (param in params) {
    # find all columns for this parameter
    pat <- paste0("^", param, "_")
    cols <- grep(pat, names(out), value = TRUE)
    if (length(cols) == 0) {
      warning("No columns found for param: ", param)
      next
    }

    # extract the case suffixes, e.g. "1","2",...
    suffixes <- sub(pat, "", cols, perl = TRUE)
    # build a named list of numeric vectors, one per case
    param_list <- setNames(lapply(cols, function(col)
      out[[col]]), suffixes)

    # for each summary function
    for (fn_name in names(summary_fns)) {
      fn <- summary_fns[[fn_name]]
      # compute summary per case
      vals <- vapply(param_list, fn, numeric(1))
      # new column name
      newcol <- paste(param, fn_name, sep = "_")
      # match to linelist order
      linelist[[newcol]] <- vals[ids]
    }
  }

  linelist
}
