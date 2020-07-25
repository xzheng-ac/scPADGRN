simgroups <- function(m,n,k){
    # launch spaltter to generate simulation data (time-1 gene expression matrix)
    # First, generate parameters
    params <- newSplatParams()
    params <- setParams(params, nGenes = m)
    params <- setParams(params, batchCells= n)
    rk <- 1/k
    params <- setParams(params, group.prob = c(rep(rk,k-1), 1 - (k-1)*rk))
    # Second, run main function of splatter
    sim.groups <- splatSimulate(params, method = "group", verbose = FALSE)
    sim.groups <- normalize(sim.groups)
    return(sim.groups)
}
