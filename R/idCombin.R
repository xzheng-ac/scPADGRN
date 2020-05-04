idCombin <- function(net,flag,tf){
    keyNodes <- idNodes(net, flag, tf)[1:5,]
    keyNames <- rownames(keyNodes)
    keyFlag <- rep(0, length(keyNames))
    sd <- rep(0, length(keyNames))
    for(i in c(1:length(keyNames))){
        keyFlag[i] <- tf[keyNames[i],2]
    }
    for (j in c(1:length(keyNames))) {
        fflag <- flag
        fflag[keyFlag[1:j]]<-0
        sd[j] <-sd(DGIE(net,fflag,tf))
    }
    sd <- as.matrix(sd)
    rownames(sd) <- keyNames
    return(sd)
}
