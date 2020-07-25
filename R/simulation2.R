simulation2 <- function(ngene, ncell, ngroup, ntime,noise){
    m <- ngene
    n <- ncell
    k <- ngroup
    p <- 0.01
    N <- ntime
    sim.groups <- simgroups(m,n,k)
    Exp <- list()
    length(Exp) <- N
    Exp[[1]] <- logcounts(sim.groups)
    cluExp <- list()
    length(cluExp) <- N
    for (i in c(1:N)) {
        cluExp[[i]] <- matrix(0, m, k)
    }
    groupInfo <- colData(sim.groups)[3]
    for(j in c(1:k)){
        tExp <- Exp[[1]]
        ij <- rowMeans(as.matrix(tExp[,which(groupInfo[,1] == paste("Group",j,sep = ""))]))
        cluExp[[1]][,j] <- ij
    }
    Net <- list()
    length(Net) <- N-1
    for (i in c(1:(N-1))) {
        Net[[i]] <- gzomat(m, m, p)
    }

    for (i in c(2:N)) {
        cluExp[[i]] <- cluExp[[i-1]] + Net[[i-1]] %*% cluExp[[i-1]]
    }
    for(i in c(1:N)){
        cluExp[[i]]<-cluExp[[i]]+noise*matrix(runif(m*k),m)
    }
    return(list(cluExp,Net))
}
