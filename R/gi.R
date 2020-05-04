## gi: generalized inverse
gi <- function(A){
    svda <- svd(A, nu = nrow(A), nv = ncol(A))
    dplus <- t(A)
    dplus[] <- 0
    diag(dplus) <- svda$d
    dplus[which(as.matrix(dplus) < 0.1^(4))] <- 0
    dplus[which(as.matrix(dplus) != 0) ] <- 1/dplus[which(as.matrix(dplus) != 0 )]
    aplus <- svda$v %*% dplus %*% t(svda$u)
    return(aplus)
}
# no unit tested, passed
