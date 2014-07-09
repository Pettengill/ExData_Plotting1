## Course Assignment 1, Plot #2
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
png("plot2.png", width = 480, height = 480)

# Make plot, add lines
plot(pow$DateTime, pow$Global_active_power, type ='n', xlab ="", ylab ="Global Active Power (kilowatts)")
lines(pow$DateTime, pow$Global_active_power)

# Turn off device
dev.off()
