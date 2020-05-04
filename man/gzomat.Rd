\name{gzomat}
\alias{gzomat}

\title{
Generate a zero-one matrix.
}
\description{
This function returns a zero-one matrix with given dimension and non-zero probability
}
\usage{
gzomat(m, n, p)
}
\arguments{
  \item{m}{
m is the row dimension of matrix.
}
  \item{n}{
n is the column dimension of matrix.
}
  \item{p}{
p is the non-zero probability of matrix.
}
}

\value{
M is a zero-one matrix with given dimension and non-zero probability.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (m, n, p)
{
    M <- matrix(0, m, n)
    index <- c(1:(m * n))
    index <- sample(index, round(p * m * n), replace = FALSE)
    M[index] <- 1
    return(M)
  }
}

gzomat(4,5,0.1)
