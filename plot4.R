data_file <- "household_power_consumption.txt"

data_full <- read.table(data_file, header=TRUE, na.strings="?", sep=";")

data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

subSetData <- subset(data_full, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- as.POSIXct(strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%Y-%m-%d %H:%M:%S"))

globalActivePower <- as.numeric(subSetData$Global_active_power)

globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

voltage <- as.numeric(subSetData$Voltage)

subMetering1 <- as.numeric(subSetData$Sub_metering_1)

subMetering2 <- as.numeric(subSetData$Sub_metering_2)

subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")

lines(datetime, subMetering2, type="l", col="red")

lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()