# 2018.12.21
# by Xiao Zheng
# main function

# library(splatter)
# library(ROCR)
# # to use 'normalize' in simulation2/simgroups
# library(scater)

preADMM <- function(N, X, alpha=0.1, beta=0.01, error=0.01){
    timestart<-Sys.time()
    maxit <- 100
    rho <- 1
    ng <- nrow(X[[1]])

    A <- list()
    length(A) <- N-1
    for (i in c(1:(N-1))) {
        A[[i]]<-matrix(0, ng, ng)
    }
    Astar <- A
    U <- A
    V <- A
    W <- A
    B <- A
    for (i in c(1:(N-1))) {
        B[[i]] <- matrix(rnorm(ng^2,mean = 0, sd = 0.1),ng)
    }
    C <- A
    for (i in c(1:(N-1))) {
        C[[i]] <- matrix(rnorm(ng^2,mean = 0, sd = 0.1),ng)
    }
    D <- A
    for (i in c(1:(N-1))) {
        D[[i]] <- matrix(rnorm(ng^2,mean = 0, sd = 0.1),ng)
    }
    K <- A
    for (i in c(1:(N-1))) {
        K[[i]] <- gi(X[[i]]%*%t(X[[i]]))
    }
    for(i in c(1: maxit)){
        # A[[1]]
        j <- 1
        sum <- B[[j]]+U[[j]]+D[[j]]+W[[j]]
        A[[j]] <- (rho*sum+(X[[j+1]]-X[[j]])%*%t(X[[j]])-2*rho*A[[j]])%*% K[[j]]
        B[[j]] <- sto(A[[j]] - U[[j]],alpha, rho)
        U[[j]] <- U[[j]]-A[[j]]+B[[j]]
        D[[j]] <- sto(A[[j]]-W[[j]]-A[[j+1]],beta,rho)+A[[j+1]]
        W[[j]] <- W[[j]]-A[[j]]+D[[j]]

        # A[[2:N-2]]
        for(j in c(2:(N-2))){
            sum <- B[[j]]+U[[j]]+C[[j]]+V[[j]]+D[[j]]+W[[j]]
            A[[j]] <- (rho*sum+(X[[j+1]]-X[[j]])%*%t(X[[j]])-3*rho*A[[j]])%*% K[[j]]
            B[[j]] <- sto(A[[j]] - U[[j]],alpha, rho)
            U[[j]] <- U[[j]]-A[[j]]+B[[j]]
            C[[j]] <- sto(A[[j]]-V[[j]]-A[[j-1]],beta,rho)+A[[j-1]]
            V[[j]] <- V[[j]]-A[[j]]+C[[j]]
            D[[j]] <- sto(A[[j]]-W[[j]]-A[[j+1]],beta,rho)+A[[j+1]]
            W[[j]] <- W[[j]]-A[[j]]+D[[j]]
        }

        # A[[N-1]]
        j <- N-1
        sum <- B[[j]]+U[[j]]+C[[j]]+V[[j]]
        A[[j]] <- (rho*sum+(X[[j+1]]-X[[j]])%*%t(X[[j]])-2*rho*A[[j]])%*% K[[j]]
        B[[j]] <- sto(A[[j]] - U[[j]],alpha, rho)
        U[[j]] <- U[[j]]-A[[j]]+B[[j]]
        C[[j]] <- sto(A[[j]]-V[[j]]-A[[j-1]],beta,rho)+A[[j-1]]
        V[[j]] <- V[[j]]-A[[j]]+C[[j]]

        # stop criteron
        reError <- rep(0,N-1)
        for (k in c(1:(N-1))) {
            reError[k] <- norm(A[[k]]-Astar[[k]])/norm(A[[k]])
        }
        if(max(reError) < error){
            niter <- i
            break
        }
        rho <- rho/2
        Astar <- A
    }
    timeend<-Sys.time()
    runningtime<-as.numeric(timeend-timestart)
    return(list(A,runningtime,niter))
}














