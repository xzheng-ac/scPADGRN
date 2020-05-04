DGIE <- function(network, flag, tf){
    a <- sum(flag)
    n <- length(network)
    links <- tf[,1]
    index <- rep(0,n)
    links <- as.data.frame(links)
    index <- as.data.frame(index)
    fflag <- flag
    index <- rep(0,n)
    for (i in c(1:n)) {
        network[[i]]<- abs(network[[i]])
        vertice <- 100-sum((colSums(network[[i]])==0) * (rowSums(network[[i]])==0))
        index[i] <- (vertice/a)*((sum(network[[i]][fflag==1,fflag==1])+sum(network[[i]][fflag==1,fflag!=1])+sum(network[[i]][fflag!=1,fflag==1]))/sum(network[[i]]))
    }
    return(index)
}
