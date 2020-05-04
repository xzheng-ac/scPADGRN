\name{nodes}
\alias{nodes}

\title{
Node selection
}
\description{
This function selects nodes from weighted gene regulatory network.
}
\usage{
nodes(M, nodeRank)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{M}{
M is a weighted gene regulatory network, a numerical matrix.
}
  \item{nodeRank}{
nodeRank is number of nodes that are needed.
}
}

\value{
'node' is a vector of length m, m is gene number. 'node' defines weights for each gene.
}


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (M, nodeRank)
{
    node1 <- rowSums(abs(M))
    node2 <- colSums(abs(M))
    node <- node1 + node2
    node[rank(node) < length(node) - nodeRank + 1] <- 0
    return(node)
  }
}

M <- matrix(rnorm(16),4)
nodeRank <- 10
nodes(M,nodeRank)
