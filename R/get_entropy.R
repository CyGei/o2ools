#' Compute the entropy of transmission trees
#'
#' Computes the mean entropy of inferred transmission trees from `outbreaker2`.
#' Entropy quantifies uncertainty in outbreak reconstruction, with higher values indicating greater ambiguity in who infected whom.
#'
#' @param out A data frame of class \code{outbreaker_chains} containing posterior samples of transmission ancestries (alpha).
#'
#' @details
#' Entropy is a measure of uncertainty in who infected whom.
#' The entropy of a discrete variable \(X\) with probabilities \(p_i\) is computed as:
#'
#' \deqn{H(X) = -\sum p_i \log p_i}
#'
#' where \(p_i\) is the proportion of times each infector appears in a posterior sample for a given case.
#'
#' @return A numeric value representing the mean entropy of transmission trees across posterior samples.
#'
#' @examples
#' # High entropy
#' out <- data.frame(alpha_1 = sample(c("2", "3"), 100, replace = TRUE),
#'                   alpha_2 = sample(c("1", "3"), 100, replace = TRUE))
#' class(out) <- c("outbreaker_chains", class(out))
#' get_entropy(out)
#'
#' # Low entropy
#' out <- data.frame(alpha_1 = sample(c("2", "3"), 100, replace = TRUE, prob = c(0.9, 0.1)),
#'                   alpha_2 = sample(c("1", "3"), 100, replace = TRUE, prob = c(0.9, 0.1)))
#' class(out) <- c("outbreaker_chains", class(out))
#' get_entropy(out)
#'
#' @export
get_entropy <- function(out) {
  is_outbreaker_chains(out)

  i <- grep('alpha_', names(out))
  ent <- vapply(out[i], entropy, numeric(1))
  return(round(mean(ent), 2))
}


#' Compute entropy of a categorical variable
#'
#' Computes the entropy of a categorical variable based on its observed probabilities.
#'
#' @param x A character vector representing observed categorical values.
#'
#' @return A numeric value representing the entropy of `x`.
#' @keywords internal
entropy <- function(x) {
  x <- as.character(x)
  p <- table(x) / sum(table(x))
  return(-sum(p * log(p)))
}
