data_file <- "household_power_consumption.txt"

data_full <- read.table(data_file, header=TRUE, na.strings="?", sep=";")

data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

subSetData <- subset(data_full, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot1.png", width=480, height=480)

globalActivePower <- as.numeric(subSetData$Global_active_power)

hist(globalActivePower, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()