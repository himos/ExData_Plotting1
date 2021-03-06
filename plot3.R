households <- read.csv("household_power_consumption.txt", sep = ";", 
                       colClasses = c("character","character","numeric", 
                                      "numeric", "numeric", "numeric", 
                                      "numeric", "numeric", "numeric"), na.strings = "?")
head(households)
households <- households[grep(x = households$Date, pattern = "^[1,2]\\/2\\/2007"),]
households$DateTime <- strptime(paste(households$Date, households$Time), "%d/%m/%Y %H:%M:%OS")
png(filename = "plot3.png")
plot(households$DateTime, households$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(households$DateTime, households$Sub_metering_2, type = "l", col="red")
lines(households$DateTime, households$Sub_metering_3, type = "l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black", "red", "blue"), lty = "solid")
dev.off()

