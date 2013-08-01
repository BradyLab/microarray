### Script to analyse microarry expression data by Gina (4/16/13)
#http://www.statmethods.net/advstats/cluster.html

# Read in tab delim file
fh <- "/Users/gt/coldstress_agi_affy"
stress <- read.delim(paste(fh ,".txt", sep=""), row.names="AGI.ID")

#remove any genes (rows) which are not expressed above 100 in any of the columns
row_expression <- apply(stress, MARGIN = 1, function(x) any(x > 100))
stress_expression <- cbind(stress,row_expression)
expressed_rows  <- (stress[stress_expression$row_expression == "TRUE",])
write.table(expressed_rows, paste(fh,"expressed",".txt", sep=""), sep="\t", quote=FALSE)

#log2 transform the data
log2_transformed <- log2(expressed_rows)
write.table(log2_transformed, paste(fh,"log2",".txt", sep=""), sep="\t", quote=FALSE)

#calculate the average of each row (from the log2 transformed data)
average <- rowMeans(log2_transformed)
data_averages <- cbind(log2_transformed,average)
write.table(data_averages, paste(fh,"averages",".txt", sep=""), sep="\t", quote=FALSE)


#calculate gene expression relative to the average of each row for each column
relative_expression = data_averages/data_averages$average
write.table(relative_expression, paste(fh,"relative_expression",".txt", sep=""), sep="\t", quote=FALSE)

