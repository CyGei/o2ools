% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_consensus.R
\name{get_consensus}
\alias{get_consensus}
\title{Get the consensus transmission tree}
\usage{
get_consensus(out)
}
\arguments{
\item{out}{An object of class \code{outbreaker_chains}}
}
\value{
A data frame showing the most frequent ancestor for each case.
}
\description{
Computes the most frequent ancestor for each case across the posterior sample.
}
\examples{
get_consensus(out)

}
