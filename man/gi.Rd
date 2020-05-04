\name{gi}
\alias{gi}
\title{
General inverse of a matrix
}
\description{
This function returns general inverse of a matrix.
}
\usage{
gi(A)
}

\arguments{
  \item{A}{
A is a numberical matrix
}
}

\value{
aplus is the general inverse of A.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (A)
{
    svda <- svd(A, nu = nrow(A), nv = ncol(A))
    dplus <- t(A)
    dplus[] <- 0
    diag(dplus) <- svda$d
    dplus[which(as.matrix(dplus) < 0.1^(4))] <- 0
    dplus[which(as.matrix(dplus) != 0)] <- 1/dplus[which(as.matrix(dplus) !=
        0)]
    aplus <- svda$v \%*\% dplus \%*\% t(svda$u)
    return(aplus)
  }
}

A <- matrix(rnorm(16),4,4)
gi(A)
