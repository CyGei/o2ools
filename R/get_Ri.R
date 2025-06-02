#' Compute case reproduction numbers (Ri) from outbreaker2 chains
#'
#' This function computes the number of secondary infections caused by each
#' individual from outbreaker2 MCMC chains. For each MCMC iteration, it counts
#' how many times each individual appears as an infector (alpha parameter).
#'
#' @param out An object of class \code{outbreaker_chains}
#'
#' @return A data frame where:
#'   \itemize{
#'     \item Each row represents an MCMC iteration
#'     \item Each column represents an individual (named by their identifier)
#'     \item Values represent the reproduction number (Ri) for that individual
#'           in that iteration
#'   }
#'
#' @examples
#' out_id <- identify(out, ids = linelist$name)
#' Ri <- get_Ri(out_id)
#' str(Ri)
#'
#' @export

get_Ri <- function(out){
  is_outbreaker_chains(out)

  # select alpha columns
  alpha_cols <- grep("^alpha_", names(out), value = TRUE)
  alphas <- gsub("^alpha_", "", alpha_cols)
  alpha_mat <- as.matrix(out[, alpha_cols])

  # for each row, count occurrences of each alpha
  Ri_mat <- t(apply(alpha_mat, 1, function(row) {
    as.integer(table(factor(row, levels = alphas)))
  }))
  colnames(Ri_mat) <- alphas

  return(as.data.frame(Ri_mat))
}


