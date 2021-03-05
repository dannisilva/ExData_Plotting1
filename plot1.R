library(data.table)
library(dplyr)

data <- fread("/Users/danielesilva/Documents/Curso de Ciencia de Dados/04 - Exploratory Data Analysis/Course Project 1/household_power_consumption.txt")
head(data)

class(data$Date)
class(data$Time)

data$Date = as.Date(strptime(data$Date,"%d/%m/%Y"))
class(data$Date)
head(data$Date)

data2 = filter(data, Date == "2007-02-01" | Date == "2007-02-02")

#plot1

png(filename="/Users/danielesilva/Documents/Curso de Ciencia de Dados/04 - Exploratory Data Analysis/Course Project 1/ExData_Plotting1/plot1.png")

with(data2,hist(as.numeric(data2$Global_active_power), col = "red", 
                         xlab = "Global Active Power (kilowatts)",
                         ylab = "Frequency", main = "Global Active Power"))

dev.off()

