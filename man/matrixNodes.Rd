\name{matrixNodes}
\alias{matrixNodes}
\title{
Select nodes and edges from gene regulatory network
}
\description{
This function selects nodes and edges from gene regulatory network
}
\usage{
matrixNodes(M, edgeRank, nodeRank)
}
\arguments{
  \item{M}{
M is a numerical matrix.
}
  \item{edgeRank}{
edgeRank is the number of non-zero of matrix M.
}
  \item{nodeRank}{
nodeRank is number of nodes that are needed.
}
}

\value{
M is a matrix whose number of nodes equals to nodeRank.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (M, edgeRank, nodeRank)
{
    M <- edges(M, edgeRank)
    matrixNode <- nodes(M, nodeRank)
    return(matrixNode)
  }
}

M <- matrix(rnorm(16),4,4)
edgeRank <- 8
matrixNodes(M, edgeRank, nodeRank)
