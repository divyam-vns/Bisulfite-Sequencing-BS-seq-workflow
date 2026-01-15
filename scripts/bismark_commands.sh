#!/bin/bash
# BS-seq pipeline using Bismark
# Requirements: Bismark, Bowtie2, Trim Galore

# Step 1: Trim adapters and low-quality bases
trim_galore --paired data/raw/sample1_R1.fastq.gz data/raw/sample1_R2.fastq.gz -o data/trimmed/

# Step 2: Align trimmed reads to reference genome
bismark --genome /path/to/genome/ -1 data/trimmed/sample1_R1_val_1.fq.gz \
                                -2 data/trimmed/sample1_R2_val_2.fq.gz \
                                -o results/alignments/

# Step 3: Deduplicate aligned reads
deduplicate_bismark --bam results/alignments/sample1_R1_val_1_bismark_bt2_pe.bam

# Step 4: Extract methylation calls
bismark_methylation_extractor --comprehensive --bedGraph --gzip \
  --report --CX results/alignments/sample1_R1_val_1_bismark_bt2_pe.deduplicated.bam \
  -o results/methylation/
