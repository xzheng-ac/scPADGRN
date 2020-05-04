matrixNodes <- function(M,edgeRank,nodeRank){
    M <- edges(M,edgeRank)
    matrixNode <- nodes(M,nodeRank)
    return(matrixNode)
}
