\name{simgroups}
\alias{simgroups}
\title{
Simulate group data through R package Splatter
}
\description{
This function simulate group data through R package Splatter
}
\usage{
simgroups(m, n, k)
}

\arguments{
  \item{m}{
m is the gene number
}
  \item{n}{
n is the cell number
}
  \item{k}{
k is the group/cluster number
}
}

\value{
Returned value 'sim.group' is an S4 structure, and it contains single cell data with group/cluster information of each cell.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (m, n, k)
{
    params <- newSplatParams()
    params <- setParams(params, nGenes = m)
    params <- setParams(params, batchCells = n)
    rk <- 1/k
    params <- setParams(params, group.prob = c(rep(rk, k - 1),
        1 - (k - 1) * rk))
    sim.groups <- splatSimulate(params, method = "group", verbose = FALSE)
    sim.groups <- normalize(sim.groups)
    return(sim.groups)
  }
}

m <- 50
n <- 100
k <- 20
simgroup(m, n, k)
