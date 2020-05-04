# sto: soft shresholding operater
sto <- function(M, lambda, rho){
    k <- lambda/rho
    B <- M
    B[which(as.matrix(abs(M)) <= k)] <- 0
    B[which(as.matrix(M) > k)] <- B[which(as.matrix(M) > k)] - k
    B[which(as.matrix(M) < -k)] <- B[which(as.matrix(M) < -k)] + k
    return(B)
}
# unit tested
