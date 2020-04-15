library(DESeq2)
library(ggplot2)
directory <- "F:/Master_Uppsala/Year_1/Semester_2/Genome_Analysis/Project"
setwd(directory)
countData <- read.csv('data.csv', header = TRUE, sep = ";")
head(countData)
metaData <- read.csv('../metadata.csv', header = TRUE, sep = ";")
metaData
dds <- DESeqDataSetFromMatrix(countData=countData, 
                              colData=metaData, 
                              design=~Type, tidy = TRUE)
dds <- DESeq(dds)
res <- results(dds)
head(results(dds, tidy=TRUE))
summary(res)
res <- res[order(res$padj),]
head(res)
par(mfrow=c(2,3))

plotCounts(dds, gene="CMHJGECF_02245", intgroup="Type") #Putative adenylylsulfate reductase
plotCounts(dds, gene="CMHJGECF_01705", intgroup="Type") #DrsE domain-containing protein
plotCounts(dds, gene="CMHJGECF_01744", intgroup="Type") #Putative outer membrane efflux protein
plotCounts(dds, gene="CMHJGECF_01283", intgroup="Type") #COX1 domain-containing protein
plotCounts(dds, gene="CMHJGECF_00315", intgroup="Type") #Flagellin
plotCounts(dds, gene="CMHJGECF_01746", intgroup="Type") #Heavy metal efflux pump

#reset par
par(mfrow=c(1,1))
# Make a basic volcano plot
with(res, plot(log2FoldChange, -log10(pvalue), pch=20, main="Volcano plot", xlim=c(-3,3)))

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(res, padj<.01 ), points(log2FoldChange, -log10(pvalue), pch=20, col="blue"))
with(subset(res, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))
