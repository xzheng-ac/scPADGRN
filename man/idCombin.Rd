\name{idCombin}
\alias{idCombin}
\title{
Identify the combination of key regulators.
}
\description{
This function identifies the combination of key regulators.
}
\usage{
idCombin(net, flag, tf)
}

\arguments{
  \item{net}{
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
'sd' is the standard derivation of each combination, and it ranks from low to high.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (net, flag, tf)
{
    keyNodes <- idNodes(net, flag, tf)[1:5, ]
    keyNames <- rownames(keyNodes)
    keyFlag <- rep(0, length(keyNames))
    sd <- rep(0, length(keyNames))
    for (i in c(1:length(keyNames))) {
        keyFlag[i] <- tf[keyNames[i], 2]
    }
    for (j in c(1:length(keyNames))) {
        fflag <- flag
        fflag[keyFlag[1:j]] <- 0
        sd[j] <- sd(DGIE(net, fflag, tf))
    }
    sd <- as.matrix(sd)
    rownames(sd) <- keyNames
    return(sd)
  }
}

net <- list()
length(net) <- 3
for (i in c(1:3)){
net[[i]] <- matrix(rnorm(16),4)
}
flag <- c(0,1,1,0)
tf <- c('gene1','gene2','gene3','gene4')
idCombin(net, flag, tf)
