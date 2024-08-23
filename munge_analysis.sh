#!/bin/bash

## Munging summary statistics for PD
#$ -pe smp 5
#$ -l h_vmem=100G
#$ -cwd
#$ -l h_rt=72:0:0
#$ -N Mung
#$ -j y

# Load necessary modules and activate the ldsc environment
module load anaconda3
source activate ldsc

# Run the munging process for PD
/data/scratch/bt23761/ldsc/munge_sumstats.py \
--sumstats /data/scratch/bt23761/gwas_sum/allover/corrected.fastGWA \
--out munged_PD_correct \
--merge-alleles /data/scratch/bt23761/ldsc/w_hm3.snplist

## Munging summary statistics for MS
#$ -pe smp 5
#$ -l h_vmem=10G
#$ -cwd
#$ -l h_rt=72:0:0
#$ -N Mung
#$ -j y

# Load necessary modules and activate the ldsc environment
module load anaconda3
source activate ldsc

# Run the munging process for MS
/data/scratch/bt23761/ldsc/munge_sumstats.py \
--sumstats /data/scratch/bt23761/gwas_sum/allover2/corrected2.fastGWA \
--out munged_MS_correct \
--merge-alleles /data/scratch/bt23761/ldsc/w_hm3.snplist
