# Request memory of 100 GB
qlogin -l h_vmem=100G
# Load R module
module load R
# Start R session
R
# load the ICD-10 dataset from the .Robj file
load("/data/SBBS-FreydinLab/ukbb/studies/distropy/data/dsets/icd10_2_18052023.Robj")
# Display the first 4 rows and first 4 columns of the 'icd10.2' dataframe to check its contents
icd10.2[1:4, 1:4]
# Search for columns related to Parkinson's disease using ICD-10 code "G20"
grep("G20", colnames(icd10.2))
# Generate a frequency table for Parkinson's disease (G20) and Multiple sclerosis (G35)
table(icd10.2$G20)
table(icd10.2$G35)
#Create a new dataframe with columns - FID, IID, G20, G35
x <- data.frame(FID=icd10.2$id, IID=icd10.2$id, PD=icd10.2$G20, MS=icd10.2$G35)
# Display the first few rows of the dataframe "x"
head(x)
# Save the dataframe as a text file
write.table(x, file="ICD10data.txt", row.names=F, quote=F)
