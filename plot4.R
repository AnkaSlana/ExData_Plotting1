# household_power_consumption.txt should be put in the same folder as the code

data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".", na.string="?")
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
data$JoinDateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480, units="px")

par(mfrow = c(2,2))

#PLOT 1
plot(data$JoinDateTime, data$Global_active_power, type="l", xlab="", ylab="Global Actice Power")


#PLOT 2
plot(data$JoinDateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

# PLOT 3
plot(data$JoinDateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(data$JoinDateTime, data$Sub_metering_2, type="l", col="red")
points(data$JoinDateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", inset = .05, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

#PLOT 4
plot(data$JoinDateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")



dev.off()