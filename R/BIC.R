BIC <- function(Y,eps,Lambda){
    lenL <- length(Lambda)
    N <- length(Y)
    Bi <- matrix(0,lenL,lenL)
    for(i in c(1:lenL)){
        for (j in c(1:lenL)) {
            A <- preADMM(N,Y,Lambda[i],Lambda[j],0.01)
            A <- A[[1]]
            Bi[i,j] <- BI(Y,A,Lambda[i],Lambda[j],eps)
        }
    }
    return(Bi)
}





