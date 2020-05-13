load(file = 'Dataset2.Rdata')

pseudoTime <- list()
length(pseudoTime) <- N

cluGeneExp <- list()
length(cluGeneExp) <- N

for(i in c(1:N)){
    pseudoTime[[i]] <- time[,2][lable[[i]]]
    geneExp[[i]] <- geneExp[[i]][,order(pseudoTime[[i]])]
    cluGeneExp[[i]] <- orderCluster(geneExp[[i]],k)
}

net <- preADMM(N,cluGeneExp,0.1,0.1,0.01)[[1]]


################################################################################
# Convert networks into -1 to 1 networks
################################################################################

for(i in c(1:(N-1))){
    diag(net[[i]])<-0
    net[[i]][net[[i]]>0]<- net[[i]][net[[i]]>0]/max(net[[i]][net[[i]]>0])
    net[[i]][net[[i]]<0]<- net[[i]][net[[i]]<0]/max(abs(net[[i]][net[[i]]<0]))
    colnames(net[[i]])<-tf[,1]
    rownames(net[[i]])<-tf[,1]
    net[[i]][abs(net[[i]])<0.2268]<-0
    net[[i]] <- abs(net[[i]])
    net[[i]][net[[i]]>0] <- 1
    net[[i]][net[[i]]<0] <- -1
}

