df <- read.csv("Database_descriptors.csv",
                 header = TRUE,
                 sep = ","
                 )
#inspect result
#df
#select numerical data
data <- df[3:8]
data
#Perform  PCA 
SDcutoff <- function(block, SDval) {
  standev <- as.data.frame(sapply(block, sd))
  names(standev) <- "column"
  standev <- subset(standev, column > SDval)
  return(block[,rownames(standev)])
}
