\name{BI}
\alias{BI}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Objective function of Beyesion information criterion (BIC)
}
\description{
This function returns the object function of Beyesion information
criterion (BIC) under designated parameters.
}
\usage{
BI(Y, A, alpha, beta, eps)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{
  Cluster-level data, a list of matrix, stand for gene expression data at different time points.
}
  \item{A}{
  Dynamic gene regulatory network, a list of numerical matrix, obtained by scPADGRN.
}
  \item{alpha}{
  Turing parameter in scPADGRN model, controls the weight of sparsity.
}
  \item{beta}{
  Turing parameter in scPADGRN model, controls the weight of continuity.
}
  \item{eps}{
  Threshold, controls "Dim" function in objective function of BIC optimization problem.
}
}

\value{
\item{Bi}{objective function of BIC optimization problem.}
}
\references{
Li Y, Jin S, Lei L, Pan Z, Zou X. Deciphering deterioration mechanisms of complex diseases based on the construction of dynamic networks and systems analysis. Scientific Reports. 2015;5:9283.
}


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Y, A, alpha, beta, eps)
{
    of <- objFunc(Y, A, alpha, beta)
    dim <- dimList(A, eps)
    Bi <- log(of) - log(dim)
    return(Bi)
  }
}

Y <- list()
length(Y) <- 3
for (i in c(1:3)){
Y[[i]] <- matrix(rnorm(16),4)
}
A <- list()
length(A) <- 2
for (i in c(1:2)){
A[[i]] <- gzomat(4,4,0.1)
}
alpha <- 0.1
beta <- 0.01
eps <- 0.5
BI(Y, A, alpha, beta, eps)
