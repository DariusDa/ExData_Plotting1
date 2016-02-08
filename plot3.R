#DATA
df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")
df$Date<- as.Date(df$Date)
df$Time<- strptime(df$Time)

df2 <- df[ which(df$Date=="1/2/2007" | df$Date =="2/2/2007"), ]

df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))
df2$Sub_metering_1 <- as.numeric(as.character(df2$Sub_metering_1))
df2$Sub_metering_2 <- as.numeric(as.character(df2$Sub_metering_2))
df2$Sub_metering_3 <- as.numeric(as.character(df2$Sub_metering_3))

#p3


plot(df2$test, df2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df2$test, df2$Sub_metering_2, col = "red")
lines(df2$test, df2$Sub_metering_3, col = "blue")
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")


