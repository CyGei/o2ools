#' outbreaker2 toy dataset
#'
#' The outbreaker2 result generated from the example in the
#' \href{https://www.repidemicsconsortium.org/outbreaker2/articles/introduction.html}{outbreaker2 vignette}.
#' This dataset was produced by running \code{outbreaker()} on the \code{fake_outbreak} data.
#'
#' @format An \code{outbreaker_chains} object.
#'
#' @source \url{https://www.repidemicsconsortium.org/outbreaker2/articles/introduction.html}
"out"


#' Simulated linelist with group labels
#'
#' A simulated linelist derived from \code{fake_outbreak}, where cases are assigned to the patient or hcw group.
#' First names are randomly generated using the \pkg{randomNames} package.
#'
#' @format A data frame with 30 rows and 5 columns:
#' \describe{
#'   \item{id}{Case ID}
#'   \item{name}{Simulated first name}
#'   \item{group}{Group label: \code{"patient"} or \code{"hcw"}}
#'   \item{onset}{Date of symptom onset}
#'   \item{sample}{Date of sample collection}
#' }
#'
#' @seealso \code{\link[outbreaker2]{fake_outbreak}}
#'
#' @examples
#' head(linelist)
"linelist"
