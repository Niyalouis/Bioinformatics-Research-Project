##CATEGORICAL COVARIATES
# Load the R module
module load R
# Start an R session
R
# Load the dataset containing categorical covariates
load("/data/SBBS-FreydinLab/ukbb/studies/distropy/data/dsets/dset_18052023.Robj")
# Display the first few rows of the dataset
head(dset)
# Extract categorical covariates
gsex <- data.frame(FID=dset$id, IID=dset$id, gsex=dset$gsex)
# Display the first few rows of the gsex dataframe
head(gsex)
# Save the categorical covariates to a text file
write.table(gsex, file="CAcovar.txt", row.names=FALSE, quote=FALSE)

##QUANTITATIVE COVARIATES
# Load the dataset containing quantitative covariates
load("/data/SBBS-FreydinLab/ukbb/studies/distropy/data/dsets/pcs.Robj")
# To check the dimensions of the pcs dataset
dim(pcs)
# Display the first few rows of the pcs dataset
head(pcs)
# Create a dataframe combining principal components (PCs 1-10) and age
y <- data.frame(FID=pcs$FID, IID=pcs$IID, pcs[, 3:12], age=dset$ageattend.f.21003.0.0)
# Display the first few rows of the dataframe
head(y)
# Save the quantitative covariates to a text file 
write.table(y, file="QAcovar.txt", row.names=FALSE, quote=FALSE)
