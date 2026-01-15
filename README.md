# Bisulfite Sequencing (BS-seq) Analysis Pipeline

**Author:** Dr. Divya Mishra, Ph.D.  
**Expertise:** Molecular Genetics, Clinical Genomics, NGS Data Analysis  

---

##  Overview

This repository provides an **end-to-end bisulfite sequencing (BS-seq) analysis pipeline**, suitable for:

- Whole-Genome Bisulfite Sequencing (WGBS)
- Reduced Representation Bisulfite Sequencing (RRBS)
- Targeted Bisulfite Sequencing

The workflow includes **alignment, methylation calling, differential methylation analysis (DMRs), visualization**, and reporting using both **R** and **Python**.

All steps use **established tools and pipelines** (e.g., Bismark, methylKit, pandas/seaborn), ensuring **reproducibility and clarity**.

---

##  Workflow Overview

1. **Adapter trimming & quality control** (Trim Galore!)
2. **Alignment to reference genome** (Bismark + Bowtie2)
3. **Deduplication of BAM files** (Bismark)
4. **Methylation calling** (Bismark methylation extractor)
5. **Differential methylation analysis (DMRs)** (methylKit in R)
6. **Visualization of methylation levels** (R: ggplot2 / Python: matplotlib, seaborn)
7. **Reporting** (R Markdown or Python Markdown)

---

##  Repository Structure

```
BSseq_analysis/
├── README.md
├── data/
│ └── raw/ # Raw FASTQ files (not included)
├── results/
│ ├── alignments/ # BAM files
│ ├── methylation/ # Methylation call outputs
│ ├── DMRs/ # Differentially methylated regions
│ └── figures/ # Plots and figures
├── R/
│ └── bsseq_analysis.R # Full R workflow for DMR analysis & visualization
├── Python/
│ └── bsseq_analysis.py # Python workflow for visualization & comparisons
└── scripts/
└── bismark_commands.sh # Alignment, deduplication, methylation calling

```
---

##  R Workflow (methylKit)
```
- Load methylation data from Bismark
- Filtering and normalization of CpG sites
- Unite samples to common CpG positions
- Detect Differentially Methylated Regions (DMRs)
- Generate heatmaps and methylation distribution plots
- Output CSV tables for downstream analysis
```
---

##  Python Workflow (Visualization)
```
- Load methylation calls from Bismark output
- Visualize CpG methylation distributions
- Scatter plots comparing multiple samples
- Publication-quality figures using matplotlib/seaborn
```
---

##  Software Requirements

### Command-line
- **Bismark** (alignment + methylation calling)
- **Bowtie2** (genome alignment)
- **Trim Galore!** (adapter trimming)

### R Packages
- methylKit
- GenomicRanges
- ggplot2

### Python Packages
- pandas
- numpy
- matplotlib
- seaborn

---

##  How to Run
```
1. Run Bash Alignment Pipeline

bash scripts/bismark_commands.sh

2. Run R Analysis
Rscript R/bsseq_analysis.R

3. Run Python Visualization
python Python/bsseq_analysis.py
```
## Outputs
```
BAM alignments (results/alignments/)

Methylation calls (results/methylation/)

DMR tables (results/DMRs/)

Plots (results/figures/)

Fully reproducible and publication-ready figures and CSV tables
```
## Intended Use
```
Demonstrate applied BS-seq analysis skills
Educational and training purposes

```
## License
```
Provided for educational and research purposes.
