\name{orderCluster}
\alias{orderCluster}
\title{
Clustering cells according to pseudotime.
}
\description{
This function returned cluster-level data.
}
\usage{
orderCluster(M, k)
}
\arguments{
  \item{M}{
M is a matrix. Rows for genes, and columns for cells.
}
  \item{k}{
k is the cluster number.
}
}

\value{
Returned value 'N' is cluster-level data, a m*k dimension matrix.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (M, k)
{
    n <- ncol(M)
    N <- matrix(0, nrow(M), k)
    distance <- dist(t(M))
    distance <- as.matrix(distance)
    distance <- diag(distance[2:n, 1:(n - 1)])
    link <- rank(distance) <= n - k
    j <- 1
    N[, 1] <- M[, 1]
    for (i in c(1:(n - 1))) {
        if (link[i] == 1) {
            N[, j] <- N[, j] + M[, i + 1]
        }
        else {
            j <- j + 1
            N[, j] <- M[, i]
        }
    }
    shre <- !link
    shre <- which(shre == 1)
    shre <- c(0, shre, n)
    cluNumber <- shre[2:length(shre)] - shre[1:(length(shre) -
        1)]
    for (i in c(1:k)) {
        N[, i] <- N[, i]/cluNumber[i]
    }
    return(N)
  }
}

a <- matrix(rnorm(16),4)
k <- 3
orderCluster(a,k)
