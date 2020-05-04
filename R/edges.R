edges <- function(M, edgeRank){
    M[rank(abs(M))<(nrow(M)*ncol(M)-edgeRank+1)]<-0
    return(M)
}
