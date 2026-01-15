# Bisulfite Sequencing (BS-seq) Analysis Pipeline

**Author:** Dr. Divya Mishra, Ph.D.  
**Expertise:** Molecular Genetics, Clinical Genomics, NGS Data Analysis  

---

## 📌 Overview

This repository provides an **end-to-end bisulfite sequencing (BS-seq) analysis pipeline**, suitable for:

- Whole-Genome Bisulfite Sequencing (WGBS)
- Reduced Representation Bisulfite Sequencing (RRBS)
- Targeted Bisulfite Sequencing

The workflow includes **alignment, methylation calling, differential methylation analysis (DMRs), visualization**, and reporting using both **R** and **Python**.

All steps use **established tools and pipelines** (e.g., Bismark, methylKit, pandas/seaborn), ensuring **reproducibility and clarity**.

---

## 🧬 Workflow Overview

1. **Adapter trimming & quality control** (Trim Galore!)
2. **Alignment to reference genome** (Bismark + Bowtie2)
3. **Deduplication of BAM files** (Bismark)
4. **Methylation calling** (Bismark methylation extractor)
5. **Differential methylation analysis (DMRs)** (methylKit in R)
6. **Visualization of methylation levels** (R: ggplot2 / Python: matplotlib, seaborn)
7. **Reporting** (R Markdown or Python Markdown)

---

## 📂 Repository Structure

