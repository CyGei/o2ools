% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ttable.R
\name{ttable}
\alias{ttable}
\title{Compute the transmission contingency table}
\usage{
ttable(from, to, levels = NULL, ...)
}
\arguments{
\item{from}{A vector of infectors.}

\item{to}{A vector of infectees.}

\item{levels}{Optional. A vector of factor levels. Defaults to the unique, sorted values of 'from' and 'to'.}

\item{...}{Additional arguments passed to the \code{table} function.}
}
\value{
A contingency table of infectors (rows) and infectees (columns).
}
\description{
Generates a contingency table based on 'from' (infector) and 'to' (infectee) vectors.
}
\examples{
from <- c("A", "A", NA, "C", "C", "C")
to <- c("A", "B", "B", "C", "C", "C")
ttable(from, to)
}
