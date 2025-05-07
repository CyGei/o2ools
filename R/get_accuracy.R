#' Calculate the accuracy of outbreak reconstruction
#'
#' Accuracy is defined as the proportion of correctly assigned ancestries across the posterior sample.
#'
#' @param out An object of class \code{outbreaker_chains}.
#' @param true_tree A data frame with the true transmission tree, including 'from' and 'to' columns.
#'
#' @return A numeric vector of accuracy values for each posterior tree.
#'
#' @export
#'
#' @examples
#' true_tree <- data.frame(from = as.character(outbreaker2::fake_outbreak$ances), to = linelist$id)
#' get_accuracy(out, true_tree)

get_accuracy <- function(out, true_tree) {
  true_pairs <- paste(true_tree$from, true_tree$to, sep = "->")
  out_trees <- get_trees(out)
  accuracy <- function(df, true_pairs) {
    posterior_pairs <- paste(df$from, df$to, sep = "->")
    correct <- sum(posterior_pairs %in% true_pairs)
    correct / length(true_pairs)
  }

  vapply(out_trees, function(x) accuracy(x, true_pairs), numeric(1))
}
