#Data

library(foreign)
library(dplyr)
library(data.table)

df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")
df$Date<- as.Date(df$Date)
df$Time<- strptime(df$Time)

#data cleaning

df2 <- df[ which(df$Date=="1/2/2007" | df$Date =="2/2/2007"), ]
df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))

df2$Sub_metering_1 <- as.numeric(as.character(df2$Sub_metering_1))
df2$Sub_metering_2 <- as.numeric(as.character(df2$Sub_metering_2))
df2$Sub_metering_3 <- as.numeric(as.character(df2$Sub_metering_3))
df2$Voltage<- as.numeric(as.character(df2$Voltage))
df2$Global_reactive_power<- as.numeric(as.character(df2$Global_reactive_power))


#Plot4

par(mfcol = c(2,2))
par(mar = c(5.1, 2.1, 2.1,2.1))


plot(df2$test, df2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(df2$test, df2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df2$test, df2$Sub_metering_2, col = "red")
lines(df2$test, df2$Sub_metering_3, col = "blue")
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(df2$test, df2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(df2$test, df2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
