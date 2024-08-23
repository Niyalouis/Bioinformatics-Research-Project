### Bonferroni correction for significant trait PD
# Load the R module
module load R 
# Start R session
R
# Load the data
data <- read.csv("PD_Result_ldsc.csv", header=TRUE, stringsAsFactors=FALSE)
# Remove all rows with NA values
data <- na.omit(data)
# Adjust p-values using Bonferroni correction
data$p <- p.adjust(data$p, method = "bonferroni")
# Filter values with adjusted p-value < 0.05
data1 <- data[data$p < 0.05, ]
# Order the filtered data by p-value
y <- data1[order(data1$p), ]
# Save the significant results to a file
write.table(y, file = "PD_adj.txt", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

#### Bonferroni correction for significant trait MS
# Load the R module
module load R
# Start R session
R
# Load the data
data <- read.csv("Ms_Result_ldsc.csv", header=TRUE, stringsAsFactors=FALSE)

# Remove all rows with NA values
data <- na.omit(data)

# Adjust p-values using Bonferroni correction
data$p <- p.adjust(data$p, method = "bonferroni")

# Filter values with adjusted p-value < 0.05
data1 <- data[data$p < 0.05, ]

# Order the filtered data by p-value
y <- data1[order(data1$p), ]

# Write the significant results to a file
write.table(y, file = "MS_adj.txt", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)

#### Bonferroni correction for significant gene PD
