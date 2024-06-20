install.packages("readxl")
install.packages("writexl")
library(writexl)
library(readxl)
#load the sales dataset
salesdata <- read_excel("Path/FileName.xlsx",sheet="SheetName")
View(salesdata)
str(salesdata)

#for Correlation
Y1=salesdata$Sales
X1=salesdata$Exp
X2=salesdata$`count of each team`
X3=salesdata$`No.of days`
correlation_coefficient_Y1_X1 <- cor(Y1, X1)
correlation_coefficient_Y1_X2 <- cor(Y1, X2)
correlation_coefficient_Y1_X3 <- cor(Y1, X3)
# Print correlation coefficients
print(correlation_coefficient_Y1_X1)
print(correlation_coefficient_Y1_X2)
print(correlation_coefficient_Y1_X3)


#for Regression Analysis based on expenditure, count of each team and number of days
install.packages("stats")
library(stats)
lmodel=lm( Sales ~ Sales + Exp + `count of each team`+ `No.of days` ,salesdata)
summary(lmodel)
predicted= predict(lmodel)
print(predicted)
salesdata$predicted=predict(lmodel)
residuals <- salesdata$Sales - predicted
error <- mean(abs(residuals))  # Mean absolute error (MAE) as an example

# Print errors
print(paste("Mean Absolute Error:", error))

excel_file <- "Path/NewFileName.xlsx"

# Export data frame to Excel
write_xlsx(salesdata, excel_file)
#exporting it as excel file#
write_xlsx(salesdata, "Path/NewFileName.xlsx")

#another linear model based on expenditures only.
lmodel2=lm( Sales ~ Exp ,salesdata)
summary(lmodel2)
predicted2= predict(lmodel2)
print(predicted2)
salesdata$predicted=predict(lmodel2)
residuals2 <- salesdata$Sales - predicted1
error <- mean(abs(residuals2))  # Mean absolute error (MAE) as an example

# Print errors
print(paste("Mean Absolute Error:", error))

excel_file2 <- "Path/NewFileName2.xlsx"

# Export data frame to Excel
write_xlsx(salesdata, excel_file2)
#exporting it as excel file#
write_xlsx(salesdata, "Path/NewFileName2.xlsx")
