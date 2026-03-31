data_file <- "household_power_consumption.txt"

data_full <- read.table(data_file, header=TRUE, na.strings="?", sep=";")

data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

subSetData <- subset(data_full, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- as.POSIXct(strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%Y-%m-%d %H:%M:%S"))

globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()