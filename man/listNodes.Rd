\name{listNodes}
\alias{listNodes}
\title{
Select nodes and edges
}
\description{
This function selects nodes and edges from a list of gene regulatory networks
}
\usage{
listNodes(A, edgeRank, nodeRank)
}
\arguments{
  \item{A}{
A is dynamic gene regulatory network, a list of numerical matrix.
}
  \item{edgeRank}{
edgeRank is the edges number of a matrix.
}
  \item{nodeRank}{
nodeRank is the nodes number of a matrix.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{

}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (A, edgeRank, nodeRank)
{
    listNode <- list()
    length(listNode) <- length(A)
    for (i in c(1:length(A))) {
        listNode[[i]] <- matrixNodes(A[[i]], edgeRank, nodeRank)
    }
    return(listNode)
  }
}

A <- list()
length(A) <- 3
for (i in c(1:3)){
A[[i]] <- matrix(rnorm(16),4,4)
}
edgeRank <- 10
nodeRank <- 2
listNodes(A, edgeRank, nodeRank)
