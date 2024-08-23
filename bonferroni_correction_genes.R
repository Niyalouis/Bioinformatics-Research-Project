#### Bonferroni correction for significant genes in PD
# Load the data
data <- read.table("PD_combined.fastbat", header=TRUE, stringsAsFactors=FALSE)
# To return the class of the object
class(data$Pvalue)
# Ensure Pvalue column is numeric
data$Pvalue <- as.numeric(data$Pvalue)
# Remove all rows with NA values
data <- na.omit(data)
# Adjust p-values using Bonferroni correction
data$Pvalue <- p.adjust(data$Pvalue, method = "bonferroni")
# Filter values with adjusted p-value < 0.05
data1 <- data[data$Pvalue < 0.05, ]
# Order the significant data by p-value
x <- data1[order(data1$Pvalue), ]
# Save the significant results to a file
write.table(x, file = "PD_adjusted.txt", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)


#### Bonferroni correction for significant genes in MS
# Load the data
data <- read.table("MS_combined.fastbat", header=TRUE, stringsAsFactors=FALSE)
# Ensure Pvalue column is numeric
data$Pvalue <- as.numeric(data$Pvalue)
# Remove all rows with NA values
data <- na.omit(data)
# Adjust p-values using Bonferroni correction
data$Pvalue <- p.adjust(data$Pvalue, method = "bonferroni")
# Filter values with adjusted p-value < 0.05
data2 <- data[data$Pvalue < 0.05, ]
# Order the significant data by p-value
y <- data2[order(data2$Pvalue), ]
# Save the significant results to a file
write.table(y, file = "MS_adjusted.txt", sep = "\t", quote = FALSE, row.names = FALSE, col.names=TRUE)
