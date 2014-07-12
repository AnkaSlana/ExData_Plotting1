# PLOT 3
# household_power_consumption.txt should be put in the same folder as the code

data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".", na.string="?")
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

png(file="plot3.png", width=480, height=480, units="px")
data$JoinDateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
plot(data$JoinDateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(data$JoinDateTime, data$Sub_metering_2, type="l", col="red")
points(data$JoinDateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()