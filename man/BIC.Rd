\name{BIC}
\alias{BIC}
\title{
Determine parameters of scPADGRN model using Bayesion information criterion
}
\description{
Determine parameters of scPADGRN model using Bayesion information criterion.
}
\usage{
BIC(Y, eps, Lambda)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{
  Cluster-level data, a list of matrix, stand for gene expression data at different time points.
}
  \item{eps}{
  Threshold, controls "Dim" function in objective function of BIC optimization problem.
}
  \item{Lambda}{
  Candidates for parameter selection, a vector that contains different value.
}
}

\value{
\item{Bi}{a matrix, each entry is objective value of BIC optimizaiton problem for different alphas and betas}
}


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Y, eps, Lambda)
{
    lenL <- length(Lambda)
    N <- length(Y)
    Bi <- matrix(0, lenL, lenL)
    for (i in c(1:lenL)) {
        for (j in c(1:lenL)) {
            A <- preADMM(N, Y, Lambda[i], Lambda[j], 0.01)
            A <- A[[1]]
            Bi[i, j] <- BI(Y, A, Lambda[i], Lambda[j], eps)
        }
    }
    return(Bi)
  }
}

Y <- list()
length(Y) <- 3
for (i in c(1:3)){
Y[[i]] <- matrix(rnorm(16),4)
}
eps <- 0.5
Lambda <- c(0,0.01,0.1,1)
BIC(Y, eps, Lambda)
