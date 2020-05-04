\name{idNodes}
\alias{idNodes}

\title{
Key regulator identification
}
\description{
This function identifies key regulators of dynamic gene regulatory network
}
\usage{
idNodes(network, flag, tf)
}

\arguments{
  \item{network}{
network is dynamic gene regulatory network, a list of matrix.
}
  \item{flag}{
  Indicator of functional genes, a zero-one vector of length m, where m is gene number.
}
  \item{tf}{
  A vector of gene names.
}
}

\value{
'genes' is the vector of identified genes.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (network, flag, tf)
{
    a <- sum(flag)
    n <- length(network)
    genes <- matrix(0, a, (n + 1))
    rownames(genes) <- tf[which(flag == 1), 1]
    for (i in c(1:a)) {
        fflag <- flag
        fflag[which(flag == 1)[i]] <- 2
        genes[i, (1:n)] <- DGIE(network, fflag, tf)
        genes[i, (n + 1)] <- sd(genes[i, 1:n])
    }
    genes <- genes[order(genes[, (n + 1)]), ]
    return(genes)
  }
}
network <- list()
length(network) <- 3
for (i in c(1:3)){
network[[i]] <- matrix(rnorm(16),4)
}
flag <- c(0,1,1,0)
tf <- c('gene1','gene2','gene3','gene4')
idNodes(network, flag, tf)
