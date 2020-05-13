# scPADGRN
scPADGRN: A PADMM approach for reconstructing dynamic gene regulatory network using single-cell RNA sequencing data

# Introduction

## General 

This repository contains R codes to implement scPADGRN and three demo datasets with their pre-processing scripts in the directory of \scPADGRN\data.

Directory \scPADGRN\man includes R Documentation files of each individual function. One '.Rd' file consists of description, usage, arguments, etc. of its function.

## Instructions

1.	Download all files by "clone" or "download" from the current Github page to a local directory.
2.	Open scRPADGRN.Rproj by Rstudio. Press command+shift+B (Mac) or control+shift+B (Windows) to build the package.
3.	To reconstruct DGRNs of real data application, enter the directory scPADGRN/data/dataset1. In 'File' panes, click 'more' bottom and then click 'Set As Working Directory'. After setting the correct directory, run 'script_dataset1.R' file, and we will have DGRN of Dataset 1. DGRNs of Dataset 2 and 3 can be obtained in the same way.

## For other datasets

Prepare inputs:
X –  a list variable, with each element a numerical matrix containing gene expressions of time $t,(t=1,2,\cdots)$ . Row and column of the matrix are genes and cells.
N- an integer variable indicating the number of time points.
Run the following code, which will return the DGRN for your dataset X: 

<p>preADMM(N, X, alpha, beta, error)[[1]]

## Notes

Before using scPADGRN, users should have R and RStudio installed on their PC or Mac. 
This package has been tested only by a small number of users for now. If you meet any kind of trouble during the process, we would be appreciate if you could email us, so we could figure it out together. (Contact: Xiao Zheng, xzheng.ac@gmail.com)


## Related information
preprint manuscript: https://www.biorxiv.org/content/10.1101/799189v1

Xiao Zheng, xzheng.ac@gmail.com


