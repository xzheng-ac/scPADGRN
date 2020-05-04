BI <- function(Y,A,alpha,beta,eps){
    of <- objFunc(Y,A,alpha,beta)
    dim <- dimList(A,eps)
    Bi <- log(of) - log(dim)
    return(Bi)
}
