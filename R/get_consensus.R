#' Get the consensus transmission tree
#'
#' Computes the most frequent ancestor for each case across the posterior sample.
#'
#' @param out An object of class \code{outbreaker_chains}
#'
#' @return A data frame showing the most frequent ancestor for each case.
#' @export
#'
#' @examples
#' get_consensus(out)
#'
get_consensus <- function(out) {
  is_outbreaker_chains(out)

  trees <- get_trees(out)
  n_iter <- length(trees)

  df <- do.call(rbind, lapply(seq_len(n_iter), function(i) {
    cbind(iter = i, trees[[i]])
  }))

  tab <- ttable(df[, "from"], df[, "to"], useNA = "ifany")
  to_ids   <- colnames(tab)
  from_ids <- rownames(tab)
  consensus <- data.frame(
    from      = NA_character_,
    to        = to_ids,
    frequency = NA_real_,
    stringsAsFactors = FALSE
  )

  for (j in seq_along(to_ids)) {
    counts <- tab[, j]
    if (!all(counts == 0L)) {
      best <- which.max(counts)
      consensus$from[j] <- from_ids[best]
      consensus$frequency[j] <- counts[best] / n_iter
    }
  }

  consensus
}
