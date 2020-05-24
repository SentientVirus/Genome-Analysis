library(DESeq2)
library(ggplot2)
directory <- "F:/Master_Uppsala/Year_1/Semester_2/Genome_Analysis/Project"
setwd(directory)
countData <- read.csv('files/input_files/DeSeq2/data_CDS.csv', header = TRUE, sep = ";")
head(countData)
metaData <- read.csv('files/input_files/DeSeq2/metadata.csv', header = TRUE, sep = ";")
annotations <- read.csv('files/input_files/DeSeq2/lept_annotations.csv', header=TRUE, sep=";")
metaData
dds <- DESeqDataSetFromMatrix(countData=countData,
                              colData=metaData,
                              design=~Type, tidy = TRUE)
dds <- DESeq(dds)
res <- results(dds)
summary(res)
res <- res[order(res$padj),]
head(res)

data <- plotCounts(dds, gene="CMHJGECF_02245", intgroup="Type", returnData = TRUE) #Putative adenylylsulfate reductase
data2 <- plotCounts(dds, gene="CMHJGECF_01705", intgroup="Type", returnData = TRUE) #DrsE domain-containing protein
data3 <- plotCounts(dds, gene="CMHJGECF_01744", intgroup="Type", returnData = TRUE) #Putative outer membrane efflux protein (metal resistance)
data4 <- plotCounts(dds, gene="CMHJGECF_01283", intgroup="Type", returnData = TRUE) #COX1 domain-containing protein
data5 <- plotCounts(dds, gene="CMHJGECF_00315", intgroup="Type", returnData = TRUE) #Flagellin (motility)
data6 <- plotCounts(dds, gene="CMHJGECF_01746", intgroup="Type", returnData = TRUE) #Heavy metal efflux pump (metal resistance)

#Several genes in one plot, nicer format
data %>%
  mutate(gene = "Sulfur metabolism") %>%
  bind_rows(mutate(data2, gene = "Sulfur metabolism")) %>%
  ggplot(aes(Type, count)) + 
  geom_point(aes(color = Type, shape = gene)) + 
  scale_y_log10()
data3 %>%
  mutate(gene = "Metal resistance") %>%
  bind_rows(mutate(data4, gene = "Cytochrome C")) %>%
  bind_rows(mutate(data5, gene = "Motility")) %>%
  bind_rows(mutate(data6, gene = "Metal resistance")) %>%
  ggplot(aes(Type, count)) + 
  geom_point(aes(color = Type, shape = gene)) + 
  scale_y_log10()

# Reset par
par(mfrow=c(1,1))
# Make a basic volcano plot
with(res, plot(log2FoldChange, -log10(padj), pch=20, main=expression("Volcano plot: p"['value']), ylim=c(0,70),
               xlab=expression(log[2](FoldChange)), ylab=expression(-log[10](p['adj']))))
mtext("Continuous", side = 1, line=3, at=-4)
mtext("Mineral", side = 1, line=3, at=4)

# Add colored points: blue if padj<0.01, red if log2FC>1 and padj<0.05)
with(subset(res, padj<.01 ), points(log2FoldChange, -log10(padj), pch=20, col="blue"))
with(subset(res, padj<.01 & abs(log2FoldChange)>2), points(log2FoldChange, -log10(padj), pch=20, col="red"))

par(mfrow=c(1,1))
#Plot with manual annotations
with(res, plot(log2FoldChange, -log10(padj), pch=20, main="Volcano plot: gene category", ylim=c(0,70),
               xlab=expression(log[2](FoldChange)), ylab=expression(-log[10](p['adj']))))
mtext("Continuous", side=1, line=3, at=-4)
mtext("Mineral", side=1, line=3, at=4)
atp <- subset(annotations, Category=="ATP synthase", select=CDS)$CDS
gmp <- subset(annotations, Category=="c-di-GMP", select=CDS)$CDS
chem <- subset(annotations, Category=="Chemotaxis", select=CDS)$CDS
hom <- subset(annotations, Category=="pH homeostasis", select=CDS)$CDS
met <- subset(annotations, Category=="Metal resistance", select=CDS)$CDS
mot <- subset(annotations, Category=="Motility", select=CDS)$CDS
nad <- subset(annotations, Category=="NADH dehydrogenase", select=CDS)$CDS
nif <- subset(annotations, Category=="Nitrogen fixation", select=CDS)$CDS
pol <- subset(annotations, Category=="Polysaccharide", select=CDS)$CDS
tca <- subset(annotations, Category=="TCA cycle", select=CDS)$CDS
legend("center", pch= 3, cex=0.8, legend=c("ATP synthase", "Chemotaxis", "Homeostasis", "Metal resistance", "Motility", "NADH DH", "Nitrogen fixation", "Polysaccharide", "TCA cycle"),
       col=c("red", "orange", "gold", "yellow", "green", "cyan", "blue", "purple", "violet"))
with(res[atp,], points(log2FoldChange, -log10(padj), pch = 3, cex = 1.0, col="red"))
with(res[gmp,], points(log2FoldChange, -log10(padj), pch = 3, cex = 1.0, col="orange"))
with(res[chem,], points(log2FoldChange, -log10(padj), pch = 3, cex = 1.0, col="gold"))
with(res[hom,], points(log2FoldChange, -log10(padj), pch = 3, cex = 1.0, col="yellow"))
with(res[met,], points(log2FoldChange, -log10(padj), pch = 3, cex = 1.0, col="green"))
with(res[mot,], points(log2FoldChange, -log10(padj), pch = 3, cex = 1.0, col="cyan"))
with(res[nad,], points(log2FoldChange, -log10(padj), pch = 3,cex = 1.0, col="dodger blue"))
with(res[nif,], points(log2FoldChange, -log10(padj), pch = 3, cex = 1.0, col="blue"))
with(res[pol,], points(log2FoldChange, -log10(padj), pch = 3, cex = 1.0, col="purple"))
with(res[tca,], points(log2FoldChange, -log10(padj), pch = 3, cex = 1.0, col="violet"))


# PCA plot
vsdata <- vst(dds, blind=FALSE)
plotPCA(vsdata, intgroup="Type")

