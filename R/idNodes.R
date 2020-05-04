idNodes <- function(network, flag, tf){
    a <- sum(flag)
    n <- length(network)
    genes <- matrix(0,a,(n+1))
    rownames(genes) <- tf[which(flag==1),1]
    for (i in c(1:a)) {
        fflag <- flag
        fflag[which(flag==1)[i]] <- 2
        genes[i,(1:n)] <- DGIE(network,fflag,tf)
        genes[i,(n+1)] <- sd(genes[i,1:n])
    }
    genes <- genes[order(genes[,(n+1)]),]
    return(genes)
}

