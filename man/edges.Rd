\name{edges}
\alias{edges}
\title{
Cut certain entries from a matrix.
}
\description{
This function returns to M. M is a matrix whose number of non-zero entries equals to edgeRank.
}
\usage{
edges(M, edgeRank)
}
\arguments{
  \item{M}{
M is a numerical matrix.
}
  \item{edgeRank}{
edgeRank is the number of non-zero of matrix M.
}
}

\value{
M is a matrix whose number of non-zero entries equals to edgeRank.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (M, edgeRank)
{
    M[rank(abs(M)) < (nrow(M) * ncol(M) - edgeRank + 1)] <- 0
    return(M)
  }
}

M <- matrix(rnorm(16),4,4)
edgeRank <- 8
edge(M,edgeRank)
