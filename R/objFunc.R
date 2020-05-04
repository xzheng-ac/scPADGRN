objFunc <- function(Y, A,alpha,beta){
    N <- length(Y)
    of <- 0
    for(i in c(1:(N-1))){
        of <- of + norm(A[[i]]%*%Y[[i]]-Y[[i+1]]+Y[[i]],type = 'F')^2/2 + alpha*norm(A[[i]],type = '1')
    }
    for (i in c(1:(N-2))) {
        of <- of + beta*norm(A[[i+1]]-A[[i]],type = '1')
    }
    return(of)
}
