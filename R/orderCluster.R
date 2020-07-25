# input:
# M: matrix, row for genes, col for ordered cells
# k: cluster number
orderCluster <- function(M,k){
    n <- ncol(M)
    N <- matrix(0, nrow(M), k)
    distance <- dist(t(M))
    distance <- as.matrix(distance)
    distance <- diag(distance[2:n,1:(n-1)])
    link <- rank(distance) <= n - k
    j <- 1
    N[,1] <- M[,1]
    for (i in c(1:(n-1))) {
        if(link[i]==1){
            N[,j] <- N[,j] + M[,i+1]
        }else{
            j <- j + 1
            N[, j] <- M[, i]
        }
    }
    shre <- !link
    shre <- which(shre==1)
    shre <- c(0,shre,n)
    # length(shre)
    cluNumber <- shre[2:length(shre)] - shre[1:(length(shre)-1)]
    for(i in c(1:k)){
        N[,i] <- N[,i]/cluNumber[i]
    }
    return(N)
}

