simulation2 <- function(ngene, ncell, ngroup, ntime,noise){
    m <- ngene
    n <- ncell
    k <- ngroup
    p <- 0.01
    N <- ntime
    # launch spaltter to generate simulation data (time-1 gene expression matrix)
    sim.groups <- simgroups(m,n,k)
    # generate simulation data (time-1 and time-2, both expression and network)
    Exp <- list()
    length(Exp) <- N
    # initial expression
    Exp[[1]] <- logcounts(sim.groups)
    # construct cluster-specific data
    # initialize list cluExp: cluster expression
    cluExp <- list()
    length(cluExp) <- N
    for (i in c(1:N)) {
        cluExp[[i]] <- matrix(0, m, k)
    }
    # construct cluster-specific expression at time-1
    # take out group information
    groupInfo <- colData(sim.groups)[3]
    # compute cluster expression according to group information
    for(j in c(1:k)){
        # tExp: temporary expression, a dummy variable
        tExp <- Exp[[1]]
        # ij: j-th col of i-th element(matrix) of list cluExp
        ij <- rowMeans(as.matrix(tExp[,which(groupInfo[,1] == paste("Group",j,sep = ""))]))
        cluExp[[1]][,j] <- ij
    }

    # time-series expression and network

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
