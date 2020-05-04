mixDGIE <- function(mixnet, flag, tf){
    pnet <- mixnet
    nnet <- mixnet
    for(i in c(1:length(mixnet))){
        pnet[[i]][pnet[[i]]<0] <- 0
        nnet[[i]][nnet[[i]]>0] <- 0
    }
    index <- matrix(0,3,length(mixnet))
    index[1,] <- DGIE(mixnet,flag,tf)
    index[2,] <- DGIE(pnet, flag, tf)
    index[3,] <- DGIE(nnet, flag, tf)
    return(index)
}
