gzomat <- function(m, n, p){
    M <- matrix(0, m, n)
    index <- c(1: (m*n))
    index <- sample(index, round(p*m*n), replace = FALSE)
    M[index] <- 1
    return(M)
}
