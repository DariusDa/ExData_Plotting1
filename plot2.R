#DATA
df <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")
df$Date<- as.Date(df$Date)
df$Time<- strptime(df$Time)

df2 <- df[ which(df$Date=="1/2/2007" | df$Date =="2/2/2007"), ]

df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))
df2$Sub_metering_1 <- as.numeric(as.character(df2$Sub_metering_1))
df2$Sub_metering_2 <- as.numeric(as.character(df2$Sub_metering_2))
df2$Sub_metering_3 <- as.numeric(as.character(df2$Sub_metering_3))

#p2


df2$Time2 <-paste(df2$Date, df2$Time)
df2$test<- strptime(df2$Time2, "%d/%m/%Y %H:%M:%S")
plot(df2$test, df2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.copy(png, file = "plot2.png")
