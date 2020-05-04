\name{DGIE}
\alias{DGIE}
\title{
DGIE score to analyze network differences
}
\description{
This function compute the DGIE score for scPADGRN.
}
\usage{
DGIE(network, flag, tf)
}
\arguments{
  \item{network}{
  Dynamic gene regulatroy network, computed by scPADGRN, a list of numerical matrix.
}
  \item{flag}{
  Indicator of functional genes, a zero-one vector of length m, where m is gene number.
}
  \item{tf}{
  A vector of gene names.
}
}
\value{
\item{index}{A numberical vector, stands for DGIE score for DGRN}
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
    links <- tf[, 1]
    index <- rep(0, n)
    links <- as.data.frame(links)
    index <- as.data.frame(index)
    fflag <- flag
    index <- rep(0, n)
    for (i in c(1:n)) {
        network[[i]] <- abs(network[[i]])
        vertice <- 100 - sum((colSums(network[[i]]) == 0) * (rowSums(network[[i]]) ==
            0))
        index[i] <- (vertice/a) * ((sum(network[[i]][fflag ==
            1, fflag == 1]) + sum(network[[i]][fflag == 1, fflag !=
            1]) + sum(network[[i]][fflag != 1, fflag == 1]))/sum(network[[i]]))
    }
    return(index)
  }
}

network <- list()
length(network) <- 3
for (i in c(1:3)){
network[[i]] <- matrix(rnorm(16),4)
}
flag <- c(0,1,1,0)
tf <- c('gene1','gene2','gene3','gene4')

DGIE(network, flag, tf)
