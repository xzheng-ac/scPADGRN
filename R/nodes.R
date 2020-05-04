nodes <- function(M, nodeRank){
    node1 <- rowSums(abs(M))
    node2 <- colSums(abs(M))
    node <- node1 + node2
    node[rank(node)<length(node)-nodeRank+1]<-0
    return(node)
}
