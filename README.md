# scPADGRN
scPADGRN: A PADMM approach for reconstructing dynamic gene regulatory network using single-cell RNA sequencing data

# Introduction

## General 

This project includes relative code of  scPADGRN. Three datasets and corresponding scritpts are in directory of \scPADGRN\data. There is also an example script of generating simulation data.

File path \scPADGRN\man includes R Documentation files of each individual function. One '.Rd' file consists of description,usage, arguments, etc. of its function. 

## Specific

1. download files by clone or download from current github page to local directory;
2. Open scRPADGRN.Rproj by Rstudio, press command+shift+B to build the package;
3. To reconstruct DGRNs of real data application, enter directory scPADGRN/data/dataset1. In 'File' panes, click 'more' bottom and click 'Set As Working Directory'. Then run 'script_dataset1.R' file, and we will have DGRN of Dataset 1. DGRNs of Dataset 2 and 3 can also obtained in this way;
4. A example of simulation is in \scPADGRN\data\example. Run 'example_script.R', we can have simulated data and DGRNs by scPADGRN.

## For other datasets

Input data: a list, each element in the list should be a numerical matrix. The matrix is gene expression of time $t,(t=1,2,\cdots)$ . Row and column of matrix are gene and cells. 

In 'exaple_script.R' file, replace 'data' generated from 'simulation2' by your own data. Run and obtain DGRN by scPADGRN. 


## Related information
preprint manuscript: https://www.biorxiv.org/content/10.1101/799189v1

contact: Xiao Zheng, xzheng.ac@gmail.com


