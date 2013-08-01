### Script to get correlations for microarry expression data by Gina (7/18/13)
#http://www.statmethods.net/advstats/cluster.html

biocLite("affy")
source("http://bioconductor.org/biocLite.R")

require(affy)

#READ FILES
affy_files <-  list.files("/Users/gturco/Documents/cell_tmp/", full.names=TRUE) #list of files in dir with dir names
Data <- ReadAffy(filenames=affy_files, phenoData="/Users/gturco/Dropbox/Allie & Gina/PhenoDatasample.txt") # reads in file

#Get expression data and correlation
exprs <-exprs(Data) # gets only expression data for file
exprs_cor <- cor(exprs(Data)) #correlations between data


 corrgram(exprs_cor, lower.panel=panel.shade,
          upper.panel=NULL, text.panel=panel.txt,
          main="Car Mileage Data (unsorted)")
