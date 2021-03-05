library(data.table)
library(dplyr)
library(lubridate)

data <- fread("/Users/danielesilva/Documents/Curso de Ciencia de Dados/04 - Exploratory Data Analysis/Course Project 1/household_power_consumption.txt")
head(data)

class(data$Date)
class(data$Time)

data$Date = as.Date(strptime(data$Date,"%d/%m/%Y"))
class(data$Date)
head(data$Date)

data2 = filter(data, Date == "2007-02-01" | Date == "2007-02-02")

data2$datetime = with(data2, ymd(Date) + hms(Time))
head(data2$datetime)

#plot1

png(filename="/Users/danielesilva/Documents/Curso de Ciencia de Dados/04 - Exploratory Data Analysis/Course Project 1/ExData_Plotting1/plot2.png")

with(data2,plot(data2$datetime, as.numeric(data2$Global_active_power),
                type="l",
                xlab="",
                ylab="Global Active Power (kilowatts)"))

dev.off()

