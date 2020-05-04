\name{objFunc}
\alias{objFunc}
\title{
Objective function of optimization model
}
\description{
This function returns the objective function value of given data.
}
\usage{
objFunc(Y, A, alpha, beta)
}
\arguments{
  \item{Y}{
Y is cluster-level data, a list of matrix.
}
  \item{A}{
A is dynamic gene regulatory network, a list of matrix.
}
  \item{alpha}{
alpha is tuning parameter in optimization model.
}
  \item{beta}{
beta is tuning parameter in optimization model.
}
}

\value{
'of' is the objective function value of given data.
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Y, A, alpha, beta)
{
    N <- length(Y)
    of <- 0
    for (i in c(1:(N - 1))) {
        of <- of + norm(A[[i]] \%*\% Y[[i]] - Y[[i + 1]] + Y[[i]],
            type = "F")^2/2 + alpha * norm(A[[i]], type = "1")
    }
    for (i in c(1:(N - 2))) {
        of <- of + beta * norm(A[[i + 1]] - A[[i]], type = "1")
    }
    return(of)
  }
}

N <- 4
Y <- list()
length(Y) <- N
for (i in c(1:N)){
Y[[i]] <- matrix(rnorm(16),4)
}
alpha <- 0.1
beta <- 0.01
objFunc(Y, A, alpha, beta)
