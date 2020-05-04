\name{sto}
\alias{sto}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
soft shresholding operater
}
\description{
Run 'soft shresholding operater'.
}
\usage{
sto(M, lambda, rho)
}

\arguments{
  \item{M}{
  M is a numerical matrix.
}
  \item{lambda}{
  lambda is the tuning parameter in math model.
}
  \item{rho}{
  rho is also the tuning parameter in math model.
}
}

\value{
Matrix M is operated by soft threshold operator, and matrix B is the result.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (M, lambda, rho)
{
    k <- lambda/rho
    B <- M
    B[which(as.matrix(abs(M)) <= k)] <- 0
    B[which(as.matrix(M) > k)] <- B[which(as.matrix(M) > k)] -
        k
    B[which(as.matrix(M) < -k)] <- B[which(as.matrix(M) < -k)] +
        k
    return(B)
  }
}

M <- matrix(rnorm(16),4,4)
lambda <- 0.1
rho <- 0.2
sto(M,lambda,rho)
