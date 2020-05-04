listNodes <- function(A,edgeRank,nodeRank){
    listNode <- list()
    length(listNode) <- length(A)
    for(i in c(1:length(A))){
        listNode[[i]] <- matrixNodes(A[[i]],edgeRank,nodeRank)
    }
    return(listNode)
}

