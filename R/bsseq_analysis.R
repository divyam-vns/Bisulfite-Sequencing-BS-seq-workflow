# =================================================================
# Bisulfite Sequencing Analysis in R
# Author: Dr. Divya Mishra, Ph.D.
# Purpose: Load Bismark output, perform DMR detection, and visualize
# =================================================================

# Load libraries
library(methylKit)
library(GenomicRanges)
library(ggplot2)

# --------------------------
# 1. Load methylation data
# --------------------------
file.list <- list(
  "results/methylation/sample1_CpG.txt",
  "results/methylation/sample2_CpG.txt"
)

sample.id <- c("sample1","sample2")
treatment <- c(0,1)  # 0=control, 1=treated

myobj <- methRead(file.list,
                  sample.id=sample.id,
                  assembly="hg38",
                  treatment=treatment,
                  context="CpG",
                  pipeline="bismarkCoverage")

# --------------------------
# 2. Filtering and normalization
# --------------------------
filtered <- filterByCoverage(myobj, lo.count=10, hi.perc=99.9)
normalized <- normalizeCoverage(filtered)

# --------------------------
# 3. Unite samples (common CpG sites)
# --------------------------
meth <- unite(normalized, destrand=TRUE)

# --------------------------
# 4. Differential methylation analysis
# --------------------------
myDiff <- calculateDiffMeth(meth, covariates=NULL, overdispersion="MN")

# Extract DMRs
dmr <- getMethylDiff(myDiff, difference=25, qvalue=0.01)
write.csv(dmr, "results/DMRs/DMR_results.csv")

# --------------------------
# 5. Visualization
# --------------------------
# Methylation distribution
pdf("results/figures/methylation_distribution.pdf")
getMethylationStats(meth[[1]], plot=TRUE, both.strands=FALSE)
dev.off()

# DMR heatmap
pdf("results/figures/DMR_heatmap.pdf")
clusterSamples(myDiff, dist="correlation", method="ward", plot=TRUE)
dev.off()
