\name{dimList}
\alias{dimList}
\title{
Dimension of a list that composed by some matrix.
}
\description{
This function returns to the dimension of a list that composed by some matrix.
}
\usage{
dimList(A, eps)
}

\arguments{
  \item{A}{
A is a list, composed by several matrix.
}
  \item{eps}{
eps is the threshold.
}
}
\value{
Returned value 'count' is the defined dimension of list A.
}


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (A, eps)
{
    count <- 0
    for (i in c(1:length(A))) {
        count <- count + dimMatrix(A[[i]], eps)
    }
    return(count)
  }
}

A <- list()
length(A) <- 3
for (i in c(1:3)){
A[[i]] <- matrix(rnorm(16),4,4)
}

eps <- 0.5
dimList(M,eps)
