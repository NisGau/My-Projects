install.packages("readxl")
install.packages("zoo")
library(readxl)
library(zoo)

#load the sales dataset
data <- read_excel("Path/FileName.xlsx",sheet="SheetName")

# If your data is in a specific column, select that column
# Assuming the data is in the 8th column
data <- data[[8]]
# Calculate the 4-interval moving average
moving_average <- rollmean(data, k = 4, fill = NA)

# Print the result
print(moving_average)

#exporting to excel
install.packages("writexl")
library(writexl)
moving_average <- "Path/NewFileNAme.xlsx"
write_xlsx(data, moving_average)
#exporting it as excel file#
write_xlsx(data, "Path/NewFileNAme.xlsx")