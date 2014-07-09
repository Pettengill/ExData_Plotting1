## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1
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
png("plot1.png", width = 480, height = 480)

# Make histogram 
hist(pow$Global_active_power, col = "red", main = "Global Active Power", xlab ="Global Active Power (kilowatts)")

# Turn off device
dev.off()

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2
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

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3

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

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4

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

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

