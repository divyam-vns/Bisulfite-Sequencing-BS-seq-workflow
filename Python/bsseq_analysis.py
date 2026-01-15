"""
Bisulfite Sequencing Analysis in Python
Author: Dr. Divya Mishra, Ph.D.
Purpose: Load Bismark methylation calls, visualize CpG methylation and DMRs
"""

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# --------------------------
# 1. Load methylation data
# --------------------------
sample1 = pd.read_csv('results/methylation/sample1_CpG.txt', sep='\t')
sample2 = pd.read_csv('results/methylation/sample2_CpG.txt', sep='\t')

# Merge by genomic position
merged = pd.merge(sample1, sample2, on=['chr','start','end'], suffixes=('_s1','_s2'))

# --------------------------
# 2. Visualize methylation distribution
# --------------------------
plt.figure(figsize=(8,6))
sns.histplot(merged['meth_percent_s1'], color='blue', label='Sample1', kde=True, stat="density")
sns.histplot(merged['meth_percent_s2'], color='red', label='Sample2', kde=True, stat="density")
plt.xlabel('Methylation Percentage')
plt.ylabel('Density')
plt.title('CpG Methylation Distribution')
plt.legend()
plt.savefig('results/figures/methylation_distribution_python.png', dpi=300)
plt.close()

# --------------------------
# 3. Optional: DMR Scatter Plot
# --------------------------
merged['diff'] = merged['meth_percent_s2'] - merged['meth_percent_s1']

plt.figure(figsize=(8,6))
sns.scatterplot(x='meth_percent_s1', y='meth_percent_s2', data=merged, alpha=0.3)
plt.xlabel('Sample1 Methylation (%)')
plt.ylabel('Sample2 Methylation (%)')
plt.title('CpG Methylation Comparison')
plt.savefig('results/figures/DMR_scatter.png', dpi=300)
plt.close()
