households <- read.csv("household_power_consumption.txt", sep = ";", 
                       colClasses = c("character","character","numeric", 
                                      "numeric", "numeric", "numeric", 
                                      "numeric", "numeric", "numeric"), na.strings = "?")
head(households)
households <- households[grep(x = households$Date, pattern = "^[1,2]\\/2\\/2007"),]
households$DateTime <- strptime(paste(households$Date, households$Time), "%d/%m/%Y %H:%M:%OS")
png(filename = "plot2.png")
plot(households$DateTime, households$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()

