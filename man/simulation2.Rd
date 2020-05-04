\name{simulation2}
\alias{simulation2}
\title{
simulated data generation
}
\description{
This is the function to generate simulation data.
}
\usage{
simulation2(ngene, ncell, ngroup, ntime, noise)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ngene}{
  number of genes
}
  \item{ncell}{
  number of cells
}
  \item{ngroup}{
  number of groups/clusters
}
  \item{ntime}{
  number of time points
}
  \item{noise}{
  standard derivation of white noises that were added onto cluster-level data
}
}
\details{
This is the function to generate data for Table 1 and Table 2 in manuscript
}
\value{
\item{cluExp}{cluExp is a list of matrices, each of them is cluster-level data at each time point.}
\item{Net}{Net is a list of matrices, every matrix is the true network.}
}


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (ngene, ncell, ngroup, ntime, noise)
{
    m <- ngene
    n <- ncell
    k <- ngroup
    p <- 0.01
    N <- ntime
    sim.groups <- simgroups(m, n, k)
    Exp <- list()
    length(Exp) <- N
    Exp[[1]] <- logcounts(sim.groups)
    cluExp <- list()
    length(cluExp) <- N
    for (i in c(1:N)) {
        cluExp[[i]] <- matrix(0, m, k)
    }
    groupInfo <- colData(sim.groups)[3]
    for (j in c(1:k)) {
        tExp <- Exp[[1]]
        ij <- rowMeans(as.matrix(tExp[, which(groupInfo[, 1] ==
            paste("Group", j, sep = ""))]))
        cluExp[[1]][, j] <- ij
    }
    Net <- list()
    length(Net) <- N - 1
    for (i in c(1:(N - 1))) {
        Net[[i]] <- gzomat(m, m, p)
    }
    for (i in c(2:N)) {
        cluExp[[i]] <- cluExp[[i - 1]] + Net[[i - 1]] \%*\% cluExp[[i -
            1]]
    }
    for (i in c(1:N)) {
        cluExp[[i]] <- cluExp[[i]] + noise * matrix(runif(m *
            k), m)
    }
    return(list(cluExp, Net))
  }
}

ngene <- 50
ncell <- 100
ngroup <- 20
ntime <- 5
noise <- 0.1
simulation2(ngene, ncell, ngroup, ntime, noise)
