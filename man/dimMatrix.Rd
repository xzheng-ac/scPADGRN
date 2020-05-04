\name{dimMatrix}
\alias{dimMatrix}
\title{
Dimension of a matrix
}
\description{
This function returns to the defined dimension of a matrix.
}
\usage{
dimMatrix(M, eps)
}

\arguments{
  \item{M}{
M is a numerical matrix.
}
  \item{eps}{
eps is the threshold.
}
}

\value{
\item{count}{count is the dimension of matrix M with threshold eps.}
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (M, eps)
{
    M <- M/max(abs(M))
    count <- sum(abs(M) < eps)
    return(count)
  }
}

M <- matrix(rnorm(16),4,4)
eps <- 0.5
dimMatrix(M,eps)
