# PLOT 1

# household_power_consumption.txt should be put in the same folder as the code
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".", na.string="?")
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

png(file="plot1.png", width=480, height=480, units="px")
hist (data$Global_active_power, col="red", xlab="Global Actice Power (kilowatts)", main="Global Active Power")
dev.off()

