dimMatrix <- function(M, eps){
    M <- M/max(abs(M))
    count <- sum(abs(M)<eps)
    return(count)
}
