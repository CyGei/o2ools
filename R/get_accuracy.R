#' Calculate accuracy of a outbreak reconstruction
#' Accuracy of outbreak reconstruction is defined as the proportion of correctly assigned ancestries
#' across the posterior chain.
#'
#' @param chain A list of data frames, each containing a posterior chain of transmission trees.
#' @param true_tt A data frame containing the true transmission tree. Columns 'from' and 'to' are required.
#'
#' @return A numeric vector of accuracy values for each posterior tree.
#'
#'
#' @export
#'

get_accuracy <- function(chain, true_tt) {
  true_pairs <- paste(true_tt$from, true_tt$to, sep = "->")

  accuracy <- function(df, true_pairs) {
    posterior_pairs <- paste(df$from, df$to, sep = "->")
    correct <- sum(posterior_pairs %in% true_pairs)
    correct / length(true_pairs)
  }

  vapply(chain, function(x) accuracy(x, true_pairs), numeric(1))
}
