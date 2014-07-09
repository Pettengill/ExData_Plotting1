## Course Assignment 1, Plot #3
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
png("plot3.png", width = 480, height = 480)

# Make empty plot
plot(pow$DateTime, pow$Sub_metering_1, type ='n', xlab ="", ylab ="Energy sub metering")

# Plot lines, each with its own color
lines(pow$DateTime, pow$Sub_metering_1)
lines(pow$DateTime, pow$Sub_metering_2, col="red")
lines(pow$DateTime, pow$Sub_metering_3, col="blue")

# Add legend in top right corner
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)

# Turn off device
dev.off()