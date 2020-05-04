\name{mixDGIE}
\alias{mixDGIE}
\title{
Mixed DGIE score for dynamic gene regulatory network
}
\description{
This function returns mixed DGIE score for dynamic gene regulatory network
}
\usage{
mixDGIE(mixnet, flag, tf)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{mixnet}{
mixnet is dynamic gene regulatory network.
}
  \item{flag}{
  Indicator of functional genes, a zero-one vector of length m, where m is gene number.
}
  \item{tf}{
  A vector of gene names.
}
}

\value{
\item{index}{A numberical matrix, stands for DGIE score for DGRN}
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

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (mixnet, flag, tf)
{
    pnet <- mixnet
    nnet <- mixnet
    for (i in c(1:length(mixnet))) {
        pnet[[i]][pnet[[i]] < 0] <- 0
        nnet[[i]][nnet[[i]] > 0] <- 0
    }
    index <- matrix(0, 3, length(mixnet))
    index[1, ] <- DGIE(mixnet, flag, tf)
    index[2, ] <- DGIE(pnet, flag, tf)
    index[3, ] <- DGIE(nnet, flag, tf)
    return(index)
  }
}

mixnet <- list()
length(mixnet) <- 3
for (i in c(1:3)){
mixnet[[i]] <- matrix(rnorm(16),4)
}
flag <- c(0,1,1,0)
tf <- c('gene1','gene2','gene3','gene4')

mixDGIE(mixnet, flag, tf)
