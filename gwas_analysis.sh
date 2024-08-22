#!/bin/bash

# SGE Job optionss
#$ -pe smp 5          # Request 5 CPU cores 
#$ -l h_vmem=10G      # Request 10GB of virtual memory
#$ -cwd               # Run the job from the current working directory
#$ -l h_rt=72:0:0     # Set a maximum runtime of 72 hours
#$ -N allover         # Set the job name to "allover"
#$ -t 1-22            # Create an array job with tasks numbered 1 to 22
#$ -j y               # Join standard error and standard output streams

# Change to the working directory where the data and scripts are located
cd /data/scratch/bt23761/gwas_sum

# Add GCTA to the PATH
export PATH=$PATH:/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/

### Autosomal chromosomes
## Perform a GWAS analysis on autosomal chromosomes using the GCTA tool
gcta --fastGWA-mlm \
--grm-sparse /data/SBBS-FreydinLab/ukbb/genet/plink/grm/ea/ea_sp_grm \
--pheno /data/scratch/bt23761/gwas_sum/ICD10data.txt \
--mpheno 1 \
--out /data/scratch/bt23761/gwas_sum/allover/allover_all_${SGE_TASK_ID} \
--maf 0.001 \
--geno 0.02 \
--info 0.7 \
--covar /data/scratch/bt23761/gwas_sum/CAcovar.txt \
--qcovar /data/scratch/bt23761/gwas_sum/QAcovar.txt \
--sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_c22_b0_v3_s487164.sample \
--bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_c${SGE_TASK_ID}_b0_v3.bgen \
--thread-num ${NSLOTS}    # Use the number of slots allocated for parallel processing


### For X chromosome model estimation
## Estimate a model for the X chromosome using the GCTA tool
gcta --fastGWA-mlm \
--grm-sparse /data/SBBS-FreydinLab/ukbb/genet/plink/grm/ea/ea_sp_grm \
--pheno /data/scratch/bt23761/gwas_sum/ICD10data.txt \
--mpheno 1 \
--out /data/scratch/bt23761/gwas_sum/allover/allover_all_x_model \      or --out all_$nm"_"model \
--maf 0.001 \
--geno 0.02 \
--info 0.7 \
--covar /data/scratch/bt23761/gwas_sum/CAcovar.txt \
--qcovar /data/scratch/bt23761/gwas_sum/QAcovar.txt \
--model-only \    # Only estimate the model without performing a full GWAS
--sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_c22_b0_v3_s487164.sample \
--bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_c22_b0_v3.bgen \
--keep /data/SBBS-FreydinLab/ukbb/genet/ukb22828_cX_b0_v3_s486511.sample \
--thread-num ${NSLOTS}   # Use the number of slots allocated for parallel processing

### Now run X chromosome 
## Perform a GWAS analysis specifically for the X chromosome using the previously estimated model
gcta --bgen /data/SBBS-FreydinLab/ukbb/genet/bgen/ukb22828_cX_b0_v3.bgen \
--sample /data/SBBS-FreydinLab/ukbb/genet/ukb22828_cX_b0_v3_s486511.sample \
--load-model /data/scratch/bt23761/gwas_sum/allover/allover_all_x_model.fastGWA \    or --load-model all_$nm"_"model.fastGWA \
--maf 0.001 --geno 0.02 --info 0.7 \
--out /data/scratch/bt23761/gwas_sum/allover/allover_all_23 \      or --out all_$nm"_"23 \
--thread-num ${NSLOTS}         # Use the number of slots allocated for parallel processing
