# PLOT 2

data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".", na.string="?")
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

png(file="plot2.png", width=480, height=480, units="px")
data$JoinDateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
plot(data$JoinDateTime, data$Global_active_power, type="l", xlab="", ylab="Global Actice Power (kilowatts)")
dev.off()