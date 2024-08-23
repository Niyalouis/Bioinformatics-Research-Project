#### fastBat in PD
#!/bin/bash

# SGE Job options
#$ -pe smp 5         # Request 5 CPU cores for parallel processing
#$ -l h_vmem=10G     # Request 10 GB of virtual memory
#$ -cwd              # Run the job from the current working directory
#$ -l h_rt=72:0:0    # Set a maximum runtime of 72 hours
#$ -N PD             # Set the job name to 'PD'
#$ -t 1-23           # Create an array job with tasks numbered 1 to 23
#$ -j y              # Join standard error and standard output streams

# Change to the directory where the FastBAT analysis will be conducted
cd /data/scratch/bt23761/fastBAT/

# Run GCTA to perform FastBAT analysis for each chromosome
/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta \
--bfile /data/SBBS-FreydinLab/ukbb/genet/plink/ref/ea/ukbb.25k.ea.chr${SGE_TASK_ID} \
--maf 0.01 \
--fastBAT /data/scratch/bt23761/gwas_sum/allover/fastBAT_order/fastBAT_order_${SGE_TASK_ID}.fastGWA \
--fastBAT-gene-list gene_list.txt \
--out PD/PD_all_${SGE_TASK_ID} \
--thread-num ${NSLOTS}


#### fastBAT in MS

#!/bin/bash

# SGE Job options
#$ -pe smp 5         # Request 5 CPU cores for parallel processing
#$ -l h_vmem=10G     # Request 10 GB of virtual memory
#$ -cwd              # Run the job from the current working directory
#$ -l h_rt=72:0:0    # Set a maximum runtime of 72 hours
#$ -N MS           # Set the job name to 'MS'
#$ -t 1-23           # Create an array job with tasks numbered 1 to 23
#$ -j y              # Join standard error and standard output streams

# Change to the directory where the FastBAT analysis will be conducted
cd /data/scratch/bt23761/fastBAT/

# Run GCTA to perform FastBAT analysis for each chromosome
/data/SBBS-FreydinLab/tools/gcta-1.94.1-linux-kernel-3-x86_64/gcta \
--bfile /data/SBBS-FreydinLab/ukbb/genet/plink/ref/ea/ukbb.25k.ea.chr${SGE_TASK_ID} \
--maf 0.01 \
--fastBAT /data/scratch/bt23761/gwas_sum/allover2/fastBAT_order/fastBAT_order_${SGE_TASK_ID}.fastGWA \
--fastBAT-gene-list gene_list.txt \
--out PD/PD_all_${SGE_TASK_ID} \
--thread-num ${NSLOTS}
