dimList <- function(A,eps){
    count <- 0
    for (i in c(1:length(A))) {
        count <- count + dimMatrix(A[[i]],eps)
    }
    return(count)
}
