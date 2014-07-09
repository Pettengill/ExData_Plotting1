## Course Assignment 1, Plot #4
# Read in data, assign ? as missing data, set column classes
power <- read.table("./household_power_consumption.txt", header= TRUE, sep =";", 
                    na.strings='?', 
                    colClasses = c('character', 'character', 'numeric', 'numeric', 
                                   'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
# Paste Date and Time columns to create new column, convert date and time variables 
power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

# Subset data for 2007-02-01 and 2007-02-02
pow <- subset(power, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# Make empty file device of 480 x 480 pixels
png("plot4.png", width = 480, height = 480)

# Set graphical parameter 'mfrow' to show a 2 x 2 panel of graphs
par(mfrow=c(2,2))

# Plot 1st graph with lines
plot(pow$DateTime, pow$Global_active_power, type ='n', xlab ="", ylab ="Global Active Power")
lines(pow$DateTime, pow$Global_active_power)

# Plot 2nd graph with lines
plot(pow$DateTime, pow$Voltage, type ='n', xlab ="datetime", ylab ="Voltage")
lines(pow$DateTime, pow$Voltage)

# Plot 3rd graph with lines and legend
plot(pow$DateTime, pow$Sub_metering_1, type ='n', xlab ="", ylab ="Energy sub metering")
lines(pow$DateTime, pow$Sub_metering_1)
lines(pow$DateTime, pow$Sub_metering_2, col="red")
lines(pow$DateTime, pow$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)

# Plot 4th graph with lines
plot(pow$DateTime, pow$Global_reactive_power, type ='n', xlab ="datetime", ylab ="Global_reactive_power")
lines(pow$DateTime, pow$Global_reactive_power)

# Turn off device
dev.off()

