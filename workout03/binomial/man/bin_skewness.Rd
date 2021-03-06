% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/measures.R
\name{bin_skewness}
\alias{bin_skewness}
\title{Binomial Skewness}
\usage{
bin_skewness(trials, prob)
}
\arguments{
\item{trials}{integer representing n, the total number of trials}

\item{prob}{float representing p, the probability of success on a given trial}
}
\value{
skewness of the distribution
}
\description{
Calculates the skewness of a binomial distribution with given trials and probability
}
\examples{
bin_skewness(10,.3)

bin_skewness(100,2/3)
}
