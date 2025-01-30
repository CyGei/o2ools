#' Compute the entropy of transmission trees
#'
#' Computes the mean entropy of inferred transmission trees from `outbreaker2`, quantifying uncertainty in who infected whom.
#' By default, entropy is normalised to range from 0 (complete certainty) to 1 (maximum uncertainty).
#'
#' @param out A data frame of class \code{outbreaker_chains} containing posterior samples of transmission ancestries (alpha).
#' @param normalise Logical. If \code{TRUE} (default), entropy is normalised between 0 and 1. If \code{FALSE}, raw Shannon entropy is returned.
#'
#' @details
#' Entropy measures uncertainty in inferred infectors across posterior samples. It is computed as:
#'
#' \deqn{H(X) = -\sum p_i \log p_i}
#'
#' where \(p_i\) is the proportion of times each infector is inferred for a case.
#'
#' If \code{normalise = TRUE}, entropy is scaled by its maximum possible value, \(\log K\), where \(K\) is the number of distinct inferred infectors:
#'
#' \deqn{H^*(X) = \frac{H(X)}{\log K}}
#'
#' This ensures values range from 0 to 1, where:
#' - **0** complete certainty — the same infector is inferred across all samples.
#' - **1** maximum uncertainty — all infectors are equally likely.
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
get_entropy <- function(out, normalise = TRUE) {
  is_outbreaker_chains(out)

  i <- grep('alpha_', names(out))
  ent <- vapply(out[i], entropy, normalise = normalise, FUN.VALUE = numeric(1))
  return(round(mean(ent), 2))
}


#' Compute entropy of a categorical variable
#'
#' Computes the entropy of a categorical variable, with optional normalisation.
#'
#' @param x A character vector representing observed categorical values.
#' @param normalise Logical. If \code{TRUE}, entropy is normalised to range between 0 and 1. If \code{FALSE}, raw Shannon entropy is returned.
#'
#' @return A numeric value representing the entropy of `x`.
#' @keywords internal
entropy <- function(x, normalise = TRUE) {
  x <- as.character(x)
  p <- table(x) / sum(table(x))
  H <- -sum(p * log(p))

  if (!normalise) return(H)

  K <- length(p)
  if (K == 1) return(0)  # Avoid division by zero
  return(H / log(K))
}
